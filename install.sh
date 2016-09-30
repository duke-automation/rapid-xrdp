#!/bin/bash
set -x

INVENTORY=~/.rapid_ansible_hosts

echo localhost ansible_connection=local > $INVENTORY

## Do the install here
ansible-playbook -i $INVENTORY ./xrdp.yaml | tee /tmp/rapid_image_status.txt

if [[ ${PIPESTATUS[0]} == 0 ]]; then
    echo "Ansible Playbook Succeeded"
    echo "success" > /tmp/rapid_image_complete
else
    echo "Ansible playbook failed"
    echo "fail" > /tmp/rapid_image_complete
fi
