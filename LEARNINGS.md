# Apprentissages : Orchestration Souveraine

## Problèmes Résolus
1. **Connectivité Monitoring (Docker)** :
   - *Problème* : Prometheus (en conteneur) ne pouvait pas atteindre Gitea sur `localhost`.
   - *Solution* : Utilisation de la gateway Docker bridge (`172.17.0.1`) ou du mode `network_mode: host` pour permettre la communication entre services.
2. **Exposition des Métriques Gitea** :
   - *Problème* : Endpoint `/metrics` retournant une erreur 404.
   - *Solution* : Activation explicite dans `app.ini` via la section `[metrics]` et forçage par variable d'environnement `GITEA__metrics__ENABLED=true`.
3. **Optimisation MCP** :
   - *Problème* : Erreurs de compilation TypeScript sur le serveur de sécurité.
   - *Solution* : Remplacement de `exec` par `execFile` pour la sécurité et optimisation du `tsconfig.json` pour limiter l'empreinte mémoire lors de la compilation.

## Architecture Cible
Pilotage centralisé via Gemini CLI et surveillance continue via Grafana/Prometheus sur tunnel Tailscale.
