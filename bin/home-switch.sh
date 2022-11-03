#!/usr/bin/env bash

set -euo pipefail

. "$(dirname $(readlink -f $0))/utils.sh"

NIXARCH="$(nixarch)"

nix --extra-experimental-features "nix-command flakes" build --impure ".#homeConfigurations.${NIXARCH}.${USER}.activationPackage" $*
./result/activate
