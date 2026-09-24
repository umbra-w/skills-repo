#!/usr/bin/env python3
"""Rebuild the distributable suite from an installed Codex Skill root."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import tarfile
import zipfile


SUITE_NAME = "cryogenian-research-suite"


def read_skills(path: Path) -> list[str]:
    skills = [
        line.strip()
        for line in path.read_text(encoding="utf-8").splitlines()
        if line.strip() and not line.startswith("#")
    ]
    if not skills:
        raise ValueError("skills.txt contains no skills")
    if len(skills) != len(set(skills)):
        raise ValueError("skills.txt contains duplicate names")
    return skills


def validate_skill(source_root: Path, skill: str) -> None:
    if not skill.replace("-", "").isalnum() or skill.lower() != skill:
        raise ValueError(f"unsafe skill name: {skill}")
    skill_file = source_root / skill / "SKILL.md"
    if not skill_file.is_file():
        raise FileNotFoundError(f"missing {skill_file}")
    expected = f"name: {skill}"
    if expected not in skill_file.read_text(encoding="utf-8"):
        raise ValueError(f"SKILL.md name mismatch: {skill}")


def ensure_output_is_external(template_root: Path, output_dir: Path) -> None:
    try:
        output_dir.relative_to(template_root)
    except ValueError:
        return
    raise ValueError("output directory must not be inside the template bundle")


def hash_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def write_archives(bundle: Path, output_dir: Path) -> tuple[Path, Path, Path]:
    zip_path = output_dir / f"{bundle.name}.zip"
    tar_path = output_dir / f"{bundle.name}.tar.gz"
    checksum_path = output_dir / f"{bundle.name}.sha256"

    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(bundle.rglob("*")):
            if path.is_file():
                archive.write(path, path.relative_to(output_dir).as_posix())

    with tarfile.open(tar_path, "w:gz") as archive:
        archive.add(bundle, arcname=bundle.name)

    lines = [
        f"{hash_file(zip_path)}  {zip_path.name}",
        f"{hash_file(tar_path)}  {tar_path.name}",
    ]
    checksum_path.write_text("\n".join(lines) + "\n", encoding="ascii", newline="\n")
    return zip_path, tar_path, checksum_path


def build(source_skills: Path, output_dir: Path, version: str, force: bool) -> Path:
    template_root = Path(__file__).resolve().parents[1]
    source_skills = source_skills.resolve()
    output_dir = output_dir.resolve()
    ensure_output_is_external(template_root, output_dir)

    skills = read_skills(template_root / "skills.txt")
    for skill in skills:
        validate_skill(source_skills, skill)

    bundle = output_dir / f"{SUITE_NAME}-{version}"
    generated = [
        bundle,
        output_dir / f"{bundle.name}.zip",
        output_dir / f"{bundle.name}.tar.gz",
        output_dir / f"{bundle.name}.sha256",
    ]
    existing = [path for path in generated if path.exists()]
    if existing and not force:
        raise FileExistsError(f"output already exists: {existing[0]}; pass --force to replace it")
    if force:
        for path in existing:
            if path.is_dir():
                shutil.rmtree(path)
            else:
                path.unlink()

    output_dir.mkdir(parents=True, exist_ok=True)

    def ignore_template(directory: str, names: list[str]) -> set[str]:
        ignored = {"skills", "__pycache__"}
        return ignored & set(names)

    shutil.copytree(template_root, bundle, ignore=ignore_template)
    (bundle / "skills").mkdir()
    for skill in skills:
        shutil.copytree(source_skills / skill, bundle / "skills" / skill)

    manifest_path = bundle / "suite-manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    manifest["version"] = version
    manifest["skills"] = skills
    manifest_path.write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
        newline="\n",
    )

    for script in (bundle / "install.sh", bundle / "verify.sh", bundle / "tools" / "build_bundle.py"):
        script.chmod(script.stat().st_mode | 0o111)

    write_archives(bundle, output_dir)
    return bundle


def default_skill_root() -> Path:
    codex_home = os.environ.get("CODEX_HOME")
    return (Path(codex_home) if codex_home else Path.home() / ".codex") / "skills"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-skills", type=Path, default=default_skill_root())
    parser.add_argument("--output-dir", type=Path, default=Path(__file__).resolve().parents[2] / "dist")
    parser.add_argument("--version", required=True)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    bundle = build(args.source_skills, args.output_dir, args.version, args.force)
    print(f"Built {bundle}")
    print(f"Archives and SHA-256 checksums are in {bundle.parent}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
