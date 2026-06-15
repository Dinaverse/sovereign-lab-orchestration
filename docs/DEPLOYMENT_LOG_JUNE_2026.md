# 📜 Deployment Log: Lab Hardening & Monitoring - June 14, 2026

## Overview
This document logs the successful execution of the Ansible playbook designed to harden the laboratory nodes and deploy monitoring agents (Wazuh and Node Exporter).

## Playbook Scope
- **Target Hosts:** `archlinux`, `canwork189`, `canwork164`, `dell`, `pi-hole`
- **Actions:**
    - **SSH Hardening:** Applied secure configuration (`PasswordAuthentication no`, `PermitRootLogin no`, `MaxAuthTries 3`).
    - **Wazuh Agent:** Automated deployment and configuration on Debian/Ubuntu-based nodes.
    - **Node Exporter:** Automated deployment, systemd service creation, and activation on all nodes.

## Execution Summary
The playbook was executed successfully with no failed tasks.

| Host | Status | Changes |
| :--- | :--- | :--- |
| `archlinux` | OK | 3 |
| `canwork164` | OK | 0 |
| `canwork189` | OK | 0 |
| `dell` | OK | 0 |
| `pi-hole` | OK | 3 |

*Note: Wazuh installation tasks were skipped on `archlinux` as intended (package management differs).*

## Timestamp
- **Date:** June 14, 2026
EOF
,file_path: