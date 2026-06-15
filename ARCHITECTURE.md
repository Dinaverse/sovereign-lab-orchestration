================================================================================
DOCUMENTATION ARCHITECTURE (Sovereign Lab)
================================================================================
1. INTRODUCTION
Ce document décrit la structure décentralisée du laboratoire.

2. TOPOLOGIE LOGIQUE
La communication réseau repose exclusivement sur le tunnel chiffré Tailscale. L'accès SSH public est désactivé.

3. INVENTAIRE DES NŒUDS
- Kali Station : Contrôleur central, orchestrateur.
- Arch Cluster : Compute IA haute performance (Inférence multi-GPU).
- Dell Precision : Orchestrateur secondaire, monitoring (Stack Docker).
- Canwork189/164 : Stockage de données et nœud général.
- Pi-hole : Services réseau (filtrage DNS).

4. ORCHESTRATION
- Orchestrateur central : Gemini CLI.
- Pont MCP : Serveur `security-tools-native` (`mcp-security-server.ts`).
- Persistance : Services systemd avec `lingering` activé sur les nœuds persistants.
EOF
