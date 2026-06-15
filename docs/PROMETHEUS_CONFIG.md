# 📊 Prometheus Configuration Reference

This document provides a reference for the command-line arguments and configuration settings currently applied to the Prometheus monitoring server.

## Configuration Flags

| Flag | Value |
| :--- | :--- |
| `--agent` | `false` |
| `--alertmanager.notification-batch-size` | `256` |
| `--config.file` | `/etc/prometheus/prometheus.yml` |
| `--log.level` | `info` |
| `--query.timeout` | `2m` |
| `--storage.tsdb.path` | `/prometheus` |
| `--storage.tsdb.retention.time` | `15d` |
| `--web.listen-address` | `0.0.0.0:9090` |
| `--web.page-title` | `Prometheus Time Series Collection and Processing Server` |

*(Note: Additional flags not listed here are running with their default values.)*

---
*Technical Reference Version 1.0 (2026-06-14)*
