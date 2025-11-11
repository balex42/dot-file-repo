#!/usr/bin/env bash
# append-tmux-autostart.sh

cat >> "$HOME/.bashrc" <<'EOF'
# Automatically start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
EOF

echo "Appended tmux autostart snippet to ~/.bashrc"