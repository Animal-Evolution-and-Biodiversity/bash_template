#!/usr/bin/env bash
#
# A minimal Bash template.

set -o errtrace
set -o errexit
set -o nounset
set -o pipefail

# Show line numbers and function names when debugging
export PS4='+ ${LINENO}:${FUNCNAME[0]:-}() '

readonly ARGS=("$@")
readonly ARG_COUNT="$#"
readonly VERSION="0.0.1"

usage() { printf "%s" "\
usage:
  bash_template.bash [--help] [--version]

description:
  This is a template meant for Bash scripts.

options:
  -h, --help       display this help message and exit
  -v, --version    display the version number and exit
"
  exit 1
}

# Display the version number and exit.
version_info() {
  echo "$VERSION"
  exit 1
}

# Display the provided error message before exiting with the provided status
# (default: 1).
error() {
  local message="$1"
  local status="${2-1}" # default exit status: 1
  echo "$message"
  exit "$status"
}

# Parse user-provided arguments
parse_params() {
  (( "$ARG_COUNT" != 0 )) &&
    usage

  for arg in "${ARGS[@]}"
  do
    case "$arg" in
      -h | --help)
        usage
        ;;
      -v | --version)
        version_info
        ;;
      --) # end of all options
        break
        ;;
      -*) # unknown option
        echo "unknown option: $arg"
        ;;
      *) # end of options
        echo "unkown positional argument: $arg"
        ;;
    esac
  done
}

main() {
  parse_params
}

main
