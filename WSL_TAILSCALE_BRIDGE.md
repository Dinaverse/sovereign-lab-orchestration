# BRIDGE RÉSEAU : LINUX VERS WSL (TAILSCALE)

## 1. Problème
L'accès SSH direct depuis un hôte Linux vers une instance WSL (Windows Subsystem for Linux) est souvent bloqué par le NAT (Network Address Translation) de Windows. Le port 22 n'est pas exposé par défaut à l'extérieur de l'instance WSL, et le routage hôte-vers-invité est complexe.

## 2. Solution (Pont Tailscale)
Au lieu de configurer des redirections de ports (Port Forwarding) dans Windows, nous utilisons Tailscale pour créer un réseau overlay.

- Concept : Tailscale installe une interface virtuelle (`tailscale0`) à l'intérieur du conteneur WSL.
- Bridge : Cette interface se comporte comme une connexion réseau directe, indépendante de la couche NAT de l'hôte Windows.
- Résultat : Chaque nœud WSL obtient une IP interne persistante dans le réseau `100.x.x.x` et devient un nœud de premier niveau au même titre que vos serveurs physiques.

## 3. Configuration Requise
Sur l'instance WSL :
1. Installer le serveur SSH : `sudo apt install openssh-server -y`
2. Activer le service : `sudo systemctl enable --now ssh`
3. Installer et connecter Tailscale : `curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale up`

## 4. Usage
La connexion devient transparente :
`ssh -i ~/.ssh/id_lab_master dina@<IP_TAILSCALE_WSL>`
EOF
