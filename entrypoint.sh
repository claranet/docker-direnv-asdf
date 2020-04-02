#!/bin/bash
set -euo pipefail

# Enable asdf.
source /asdf/asdf.sh

# Enable direnv.
mkdir -p ~/.config/direnv
cat > ~/.config/direnv/config.toml <<EOF
[whitelist]
prefix = ["/"]
EOF
eval "$(direnv export bash)"

# Execute the command.
exec "$@"
