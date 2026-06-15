#!/bin/bash
# Script d'export des métriques clés via Prometheus API
# Évite la surcharge de tokens Gemini
PROMETHEUS_URL="http://<TS_IP>:9090"

echo "=== RAPPORT DE SANTÉ DU LABO (Prometheus API) ==="
echo "Date : $(date)"

# Fonction de helper pour traiter le JSON sans crash
process_query() {
    curl -s "$PROMETHEUS_URL/api/v1/query?query=$1" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if 'data' in data and 'result' in data['data'] and data['data']['result']:
        for t in data['data']['result']:
            inst = t.get('metric', {}).get('instance', 'unknown')
            val = t.get('value', [None, 'N/A'])[1]
            print(f'{inst}: {val}')
    else:
        print('Aucune donnée trouvée')
except Exception as e:
    print(f'Erreur JSON: {e}')
"
}

echo -e "\n--- CPU Usage (avg 5m) ---"
process_query '100-(avg%20by%20(instance)%20(irate(node_cpu_seconds_total{mode=%22idle%22}[5m]))*100)'

echo -e "\n--- RAM Usage (%) ---"
process_query '(1-(node_memory_MemAvailable_bytes/node_memory_MemTotal_bytes))*100'

echo -e "\n--- Root Disk Usage (%) ---"
process_query '(1-(node_filesystem_avail_bytes{mountpoint=%22/%22}/node_filesystem_size_bytes{mountpoint=%22/%22}))*100'
