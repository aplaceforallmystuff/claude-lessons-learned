#!/bin/bash

# Lessons Learned Installer
# Installs the /lessons-learned skill for Claude Code

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SKILL_NAME="lessons-learned"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "Lessons Learned Installer"
echo "========================="
echo ""

# Check for existing installation
if [ -d "$INSTALL_DIR" ] && [ "$1" != "--force" ]; then
    echo -e "${YELLOW}Warning:${NC} $SKILL_NAME is already installed at $INSTALL_DIR"
    echo "Use --force to reinstall"
    exit 1
fi

# Create skills directory if needed
mkdir -p "$HOME/.claude/skills"

# Copy skill files
echo "Installing $SKILL_NAME..."
rm -rf "$INSTALL_DIR"
cp -r "$SCRIPT_DIR/skills/$SKILL_NAME" "$INSTALL_DIR"

# Verify installation
if [ -f "$INSTALL_DIR/SKILL.md" ]; then
    echo ""
    echo -e "${GREEN}Success!${NC} Lessons Learned installed to $INSTALL_DIR"
    echo ""
    echo "Usage:"
    echo "  /lessons-learned              # Review lessons from current session"
    echo "  /lessons-learned what failed   # Analyze what went wrong"
    echo ""
else
    echo -e "${RED}Error:${NC} Installation failed - SKILL.md not found"
    exit 1
fi
