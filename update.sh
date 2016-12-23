#!/bin/bash
#
# This script assumes the presence of a most_recent/ dir.
#

CURRENT=derp

# Extract the most recent backup into its own directoy for easy access to backups.
(
    cd most_recent
    rm -rf * .stymie.d
    gpg -d ../$CURRENT | tar xjvf -
)

