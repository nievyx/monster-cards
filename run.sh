#!/bin/bash
# -e exits when an unhandled command fails, -u treats unset variables as errors, -o pipefail, detects failures within command pipelines
set -ueo pipefail

# prints current working directory
echo -n "Current Working directory: "
pwd

# prints script location
echo -n "Scripts directory: "
dirname "$0"

# changes directory to the scripts, or exit
echo -n "Changing directory to scripts location.. : $(dirname "$0")"
cd "$(dirname "$0")" || exit

# Check current working directory
echo -en "\nCurrent Work directory..:"
pwd

# Check if uv is installed or exit program
# Game relies on a slighter older version of python
if command -v uv; then
  echo "uv installed on machine"
else
  echo "uv not found! try : 'sudo dnf install uv'"
  exit 1
fi

# check if python 3.13
if command -v python3.13; then
  echo "python3.13 installed on machine"
else
  echo "trying... uv python install 3.13"
  uv python install 3.13
fi


# Check .venv exists, install via uv if not
if [ ! -d ".venv" ]; then
  echo "Creating virtual environment.."
  uv venv --python 3.13
fi

# install requirements
uv pip install -r requirements.txt

# TODO: When game fails to launch, save full log error to log file
# Investigate whether Bash can prepare a command to open the log, ideally allowing the user to retrieve it with the ↑ arrow.

# run game
.venv/bin/python -m src.main