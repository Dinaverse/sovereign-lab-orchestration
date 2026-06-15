#!/bin/bash
# 🏥 SCRIPT DE SANTÉ DU LABO (Lab Health Check)
# Exécuter depuis Kali pour vérifier l'état du cluster via Tailscale

echo "--- 🏥 DIAGNOSTIC GLOBAL DU LABO (via Tailscale) ---"

# 1. État local (Kali)
echo "[1/5] Kali (Contrôle) : $(nvidia-smi -q -d MEMORY | grep "Total" | head -1 | xargs)"

# 2. Arch Cluster (Inférence IA)
echo "[2/5] Arch Cluster (100.69.65.101) :"
ssh -i /home/dina/.ssh/id_lab_master dina@100.69.65.101 "hostname && nvidia-smi -L | wc -l && systemctl is-active ollama"

# 3. Dell Precision (Orchestrateur)
echo "[3/5] Dell Precision (Dell non détecté sur Tailscale) :"
# ssh -i /home/dina/.ssh/id_lab_master dina@<IP_TAILSCALE_DELL> "hostname && uptime"

# 4. Raspberry Pi (Réseau/Pi-hole)
echo "[4/5] Raspberry Pi (100.80.155.45) :"
ssh -i /home/dina/.ssh/id_lab_master dina@100.80.155.45 "hostname && systemctl is-active pihole-FTL"

# 5. Canwork189 (Stockage)
echo "[5/5] Canwork189 (100.118.171.116) :"
ssh -i /home/dina/.ssh/id_lab_master newdina@100.118.171.116 "hostname && uptime && df -h / | tail -1"

echo "-------------------------------------"
echo "Fin du diagnostic."
