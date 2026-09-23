#!/usr/bin/env bash
# MySkills 一键安装与软链脚本 (Linux / macOS)
set -e

TARGET="all"
MODE="symlink"
DRY_RUN=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --target) TARGET="$2"; shift ;;
        --mode) MODE="$2"; shift ;;
        --dry-run) DRY_RUN=true ;;
        -h|--help)
            echo "用法: ./install.sh [--target antigravity|claude|codex|all] [--mode symlink|copy] [--dry-run]"
            exit 0
            ;;
        *) echo "未知参数: $1"; exit 1 ;;
    esac
    shift
done

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
SUITES_DIR="$REPO_ROOT/suites"

echo "========================================"
echo "  MySkills 安装向导 (BlueRocket)"
echo "  模式: $MODE | 目标: $TARGET"
echo "========================================"

TARGET_DIRS=()
if [[ "$TARGET" == "antigravity" || "$TARGET" == "all" ]]; then
    TARGET_DIRS+=("$HOME/.gemini/config/skills")
fi
if [[ "$TARGET" == "claude" || "$TARGET" == "all" ]]; then
    TARGET_DIRS+=("$HOME/.claude/skills")
fi
if [[ "$TARGET" == "codex" || "$TARGET" == "all" ]]; then
    TARGET_DIRS+=("$HOME/.codex/skills")
fi

for dest_root in "${TARGET_DIRS[@]}"; do
    echo ">>> 处理目录: $dest_root"
    if [ "$DRY_RUN" = false ]; then
        mkdir -p "$dest_root"
    fi

    # 1. 独立技能
    for skill_path in "$SKILLS_DIR"/*; do
        if [ -d "$skill_path" ]; then
            name="$(basename "$skill_path")"
            dest="$dest_root/$name"
            echo "  - 独立技能: $name"
            if [ "$DRY_RUN" = false ]; then
                rm -rf "$dest"
                if [[ "$MODE" == "symlink" ]]; then
                    ln -sf "$skill_path" "$dest"
                else
                    cp -r "$skill_path" "$dest"
                fi
            fi
        fi
    done

    # 2. 成冰纪套件子技能
    for skill_path in "$SUITES_DIR/cryogenian/skills"/*; do
        if [ -d "$skill_path" ]; then
            name="$(basename "$skill_path")"
            dest="$dest_root/$name"
            echo "  - 套件子技能: $name"
            if [ "$DRY_RUN" = false ]; then
                rm -rf "$dest"
                if [[ "$MODE" == "symlink" ]]; then
                    ln -sf "$skill_path" "$dest"
                else
                    cp -r "$skill_path" "$dest"
                fi
            fi
        fi
    done
done

echo "安装完成！"
