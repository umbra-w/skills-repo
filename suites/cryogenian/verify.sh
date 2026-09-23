#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
codex_home=${CODEX_HOME:-${HOME:-}/.codex}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --codex-home)
      [ "$#" -ge 2 ] || { echo "Missing value for --codex-home" >&2; exit 2; }
      codex_home=$2
      shift 2
      ;;
    -h|--help) echo "Usage: ./verify.sh [--codex-home PATH]"; exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

case "$codex_home" in ""|/) echo "Refusing unsafe CODEX_HOME" >&2; exit 2 ;; esac
target_skills="$codex_home/skills"
failures=0
count=0

while IFS= read -r skill || [ -n "$skill" ]; do
  case "$skill" in ""|'#'*) continue ;; esac
  count=$((count + 1))
  skill_file="$target_skills/$skill/SKILL.md"
  if [ ! -f "$skill_file" ]; then
    echo "Missing: $skill_file" >&2
    failures=$((failures + 1))
    continue
  fi
  if ! grep -Eq "^name:[[:space:]]*$skill[[:space:]]*$" "$skill_file"; then
    echo "Name mismatch: $skill_file" >&2
    failures=$((failures + 1))
  fi
done < "$script_dir/skills.txt"

if [ "$failures" -ne 0 ]; then
  echo "FAIL: $failures verification error(s)" >&2
  exit 1
fi

echo "PASS: verified $count/$count Cryogenian research suite Skills in $target_skills"
