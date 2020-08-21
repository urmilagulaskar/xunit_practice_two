#!/bin/bash

export webhook=$1
export message=$2
export title=${@:3}

cat << EOF > webhook.py
#!/usr/bin/python3
import pymsteams
import sys
webhook = sys.argv[1]
message = ' '.join(sys.argv[2:])
myTeamsMessage = pymsteams.connectorcard(webhook)
myTeamsMessage.text(message)
myTeamsMessage.title("Custom title for CI notification")
myTeamsMessage.send()
EOF

chmod 755 webhook.py

./webhook.py $webhook $message $title
