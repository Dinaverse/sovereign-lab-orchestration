# 🌐 Sovereign Lab Orchestration

> *Methodology, principles, and tooling for managing a distributed, resilient bare-metal laboratory as a unified, code-defined system.*

---

## 🎯 Philosophy

The sovereign lab is treated as a living system not a collection of individual machines. Every configuration decision is reproducible, every service dependency is documented, and every node can be rebuilt from scratch using defined procedures. This repository captures the orchestration layer that holds it all together.

---

## 🧩 Orchestration Principles

### 1. Infrastructure-as-Code
Every service, network rule, and system configuration is defined in version-controlled files. No snowflake servers everything is reproducible.

### 2. Resilience by Design
Services are distributed across multiple nodes. No single point of failure for critical workloads. Monitoring detects degradation before it becomes an outage.

### 3. Sovereign Execution
No external orchestration platforms (no Kubernetes cloud, no managed services). The lab is self-managed using Docker Compose, systemd, and custom Bash/Python tooling.

### 4. Observability First
Every node ships metrics to Prometheus. Every anomaly triggers an alert. The Grafana stack provides real-time visibility across the entire lab.

---

## 🏗️ Lab Node Map

| Node | OS | Managed By |
|------|----|------------|
| Kali (Master) | Kali Linux | Manual + Ansible-style scripts |
| Arch (GPU) | Arch Linux | systemd + custom Python agents |
| Raspberry Pi | Raspbian | systemd + Suricata rules |
| Dell (Gateway) | Debian | Docker Compose + cron |
| AMD Canwork189 | Ubuntu Server | Docker Compose |

---

## 🔄 Orchestration Stack

```text
📦 Containerization   ::  Docker, Docker Compose
⚙️ Service Management  ::  systemd (GPU persistence, auto-restart)
🔁 Automation          ::  n8n workflows, custom Python/Bash agents
📊 Observability       ::  Prometheus + Grafana + custom dashboards
🤖 AI Orchestration    ::  Ollama + Gemini CLI + sovereign-ai-skills
```

---

## 📋 Standard Operating Procedures

### Deploying a New Service
1. Define service in `docker-compose.yml`
2. Add Prometheus scrape target
3. Create Grafana dashboard panel
4. Document in this repository

### Node Recovery
1. Restore base OS from documented config
2. Clone relevant repositories
3. Run `docker compose up -d` or replay systemd unit files
4. Verify with `show ip interface brief` equivalent (`ip a`, `systemctl status`)

---

## 🔗 Related Repositories

| Repository | Role |
|------------|------|
| [`sovereign-ai-infrastructure`](https://github.com/Dinaverse/sovereign-ai-infrastructure) | Full architecture documentation |
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | AI stack deployment |
| [`sovereign-docker-hosting`](https://github.com/Dinaverse/sovereign-docker-hosting) | Docker service configurations |
| [`infrastructure-as-code-lab`](https://github.com/Dinaverse/infrastructure-as-code-lab) | IaC experiments |

---

*A lab that documents itself because infrastructure without documentation is just expensive hardware.*
