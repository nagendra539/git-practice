#!/bin/bash
failure(){
    echo "failed at $1: $2"
}
trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR
echo "Nagendra"
echoooooooo "Nagendra"
