#!/bin/sh
LINE='[ $((RANDOM % 1000)) -eq 0 ] && echo "With great joy, comes great honor"'

case "$(basename "$SHELL")" in
  zsh)  RC="$HOME/.zshrc" ;;
  bash) RC="$HOME/.bashrc"
        [ "$(uname)" = "Darwin" ] && RC="$HOME/.bash_profile" ;;
  *)    echo "Unsupported shell: $SHELL (zsh or bash only)" >&2; exit 1 ;;
esac

if grep -qF "With great joy" "$RC" 2>/dev/null; then
  echo "Already installed in $RC"
else
  printf '\n%s\n' "$LINE" >> "$RC"
  echo "Installed honor-script, you welcome and let the joy be with you"
fi
