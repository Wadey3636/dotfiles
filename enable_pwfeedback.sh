#!/bin/bash
if sudo grep -q "pwfeedback" /etc/sudoers; then
    echo "pwfeedback already enabled"
else
    echo "Defaults pwfeedback" | sudo tee /etc/sudoers.d/pwfeedback > /dev/null
    echo "pwfeedback enabled"
fi
