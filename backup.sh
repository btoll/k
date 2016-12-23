#!/bin/bash
#
# This script assumes the presence of an archive/ dir.
#
CURRENT=derp
TIMESTAMP=$(date "+%Y%m%d%H%M%S")

# Archive, encrypt and write in one step.
tar cvj -C $HOME .stymie.d | gpg -s -r ben@benjamintoll.com -e > $TIMESTAMP

# Secure and archive with the same permissions.
chmod 600 $TIMESTAMP
cp -p $TIMESTAMP archive/

# Always have the same filename for the most recent backup to make things easier to version.
mv $TIMESTAMP $CURRENT

# Commit.
git add $CURRENT archive/$TIMESTAMP

