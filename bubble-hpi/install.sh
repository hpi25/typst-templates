#!/bin/sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
echo "Installing Bubble HPI package from $SCRIPT_DIR"

if [ -n "$XDG_DATA_HOME" ]; then
  PKGDIR="$XDG_DATA_HOME/typst/packages"
else
  case "$(uname)" in
    Darwin)
      PKGDIR="$HOME/Library/Application Support/typst/packages"
      ;;
    *)
      PKGDIR="$HOME/.local/share/typst/packages"
      ;;
  esac
fi

VERSION=$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' "$SCRIPT_DIR/typst.toml")

echo "Installing package of version $VERSION to $PKGDIR/hpi/bubble-hpi/$VERSION"

mkdir -p "$PKGDIR/hpi/bubble-hpi/"

echo "Removing any existing version..."
rm -rf "$PKGDIR/hpi/bubble-hpi/$VERSION"

echo "Copying files..."
cp -r "$SCRIPT_DIR" "$PKGDIR/hpi/bubble-hpi/$VERSION"

echo "Installation complete."

