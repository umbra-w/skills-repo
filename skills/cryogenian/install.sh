#!/usr/bin/env bash
set -euo pipefail

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_skills="$script_dir/skills"
skill_list="$script_dir/skills.txt"
codex_home=${CODEX_HOME:-${HOME:-}/.codex}
dry_run=0
no_backup=0

usage() {
  cat <<'EOF'
Usage: ./install.sh [--codex-home PATH] [--dry-run] [--no-backup]

Installs the complete Cryogenian Research Suite into CODEX_HOME/skills.
Existing suite Skills are backed up before replacement unless --no-backup is used.
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --codex-home)
      [ "$#" -ge 2 ] || { echo "Missing value for --codex-home" >&2; exit 2; }
      codex_home=$2
      shift 2
      ;;
    --dry-run) dry_run=1; shift ;;
    --no-backup) no_backup=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$codex_home" in
  ""|/) echo "Refusing unsafe CODEX_HOME: '$codex_home'" >&2; exit 2 ;;
esac

[ -f "$skill_list" ] || { echo "Missing package skill list: $skill_list" >&2; exit 1; }
target_skills="$codex_home/skills"
skill_count=0
conflict_count=0

while IFS= read -r skill || [ -n "$skill" ]; do
  case "$skill" in ""|'#'*) continue ;; esac
  case "$skill" in *[!a-z0-9-]*|-[a-z0-9-]*|*-) echo "Unsafe skill name: $skill" >&2; exit 1 ;; esac
  [ -f "$source_skills/$skill/SKILL.md" ] || { echo "Missing SKILL.md for $skill" >&2; exit 1; }
  grep -Eq "^name:[[:space:]]*$skill[[:space:]]*$" "$source_skills/$skill/SKILL.md" || {
    echo "SKILL.md name does not match directory: $skill" >&2; exit 1;
  }
  skill_count=$((skill_count + 1))
  [ ! -e "$target_skills/$skill" ] || conflict_count=$((conflict_count + 1))
done < "$skill_list"

echo "Package: cryogenian-research-suite 1.0.0"
echo "Target:  $target_skills"
echo "Skills:  $skill_count"
[ "$conflict_count" -eq 0 ] || echo "Update:  $conflict_count existing skill directories will be replaced."

if [ "$dry_run" -eq 1 ]; then
  echo "DRY RUN: no files were created or changed."
  exit 0
fi

mkdir -p "$codex_home" "$target_skills"
staging=$(mktemp -d "$codex_home/.cryogenian-install.XXXXXX")
installed_file="$staging/.installed"
backup_root=""

rollback() {
  status=$?
  if [ "$status" -ne 0 ] && [ -f "$installed_file" ]; then
    while IFS= read -r skill; do
      [ -n "$skill" ] || continue
      rm -rf -- "$target_skills/$skill"
      if [ -n "$backup_root" ] && [ -d "$backup_root/$skill" ]; then
        cp -R -p -- "$backup_root/$skill" "$target_skills/$skill"
      fi
    done < "$installed_file"
  fi
  rm -rf -- "$staging"
  exit "$status"
}
trap rollback EXIT
trap 'exit 130' INT TERM

while IFS= read -r skill || [ -n "$skill" ]; do
  case "$skill" in ""|'#'*) continue ;; esac
  cp -R -p -- "$source_skills/$skill" "$staging/$skill"
done < "$skill_list"

if [ "$conflict_count" -gt 0 ] && [ "$no_backup" -eq 0 ]; then
  stamp=$(date '+%Y%m%d-%H%M%S')
  backup_root="$codex_home/backups/cryogenian-research-suite/$stamp-$$"
  mkdir -p "$backup_root"
  while IFS= read -r skill || [ -n "$skill" ]; do
    case "$skill" in ""|'#'*) continue ;; esac
    [ ! -e "$target_skills/$skill" ] || cp -R -p -- "$target_skills/$skill" "$backup_root/$skill"
  done < "$skill_list"
fi

while IFS= read -r skill || [ -n "$skill" ]; do
  case "$skill" in ""|'#'*) continue ;; esac
  printf '%s\n' "$skill" >> "$installed_file"
  rm -rf -- "$target_skills/$skill"
  mv -- "$staging/$skill" "$target_skills/$skill"
done < "$skill_list"

sh "$script_dir/verify.sh" --codex-home "$codex_home"
trap - EXIT
rm -rf -- "$staging"

echo "Installation complete. Open a new Codex task or restart Codex to refresh the Skill catalog."
[ -z "$backup_root" ] || echo "Backup: $backup_root"
