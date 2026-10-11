# monitoring-stack

A self-hosted observability stack for monitoring the inventory-api and its underlying infrastructure.

## Overview

This stack collects metrics and logs from the application and the server it runs on, stores them in purpose-built databases, visualizes everything in unified dashboards, and sends alerts when something goes wrong.

## Stack

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat&logo=grafana&logoColor=white)
![Loki](https://img.shields.io/badge/Loki-F46800?style=flat&logo=grafana&logoColor=white)
![Alloy](https://img.shields.io/badge/Alloy-F46800?style=flat&logo=grafana&logoColor=white)
![Alertmanager](https://img.shields.io/badge/Alertmanager-E6522C?style=flat&logo=prometheus&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)

## Components

**Prometheus**: scrapes and stores metrics from all configured targets every 15 seconds.

**Grafana**: reads from Prometheus and Loki, displays metrics and logs in unified dashboards. Datasources and dashboard providers are provisioned automatically on startup.

**Loki**: stores and indexes logs from the application. Designed for high cardinality and low resource usage.

**Alloy**: collects logs from Docker containers via the Docker socket and forwards them to Loki. 

**Alertmanager**: receives alerts from Prometheus and routes them to email based on severity. Critical alerts are sent immediately, warnings are grouped and batched.

**Node Exporter**: exposes host-level metrics from the server: CPU, memory, disk and network.

## Getting Started

```bash
cp .env.example .env
cp alertmanager/alertmanager.yml.example alertmanager/alertmanager.yml
```

Fill in the required values in both files, then start the stack:

```bash
docker compose up -d
```

### Environment variables

`.env` is used for Grafana credentials only:

| Variable | Description |
|---|---|
| `GRAFANA_ADMIN_USER` | Grafana admin username |
| `GRAFANA_ADMIN_PASSWORD` | Grafana admin password |

### Gmail App Password

Alertmanager uses Gmail SMTP to send alert emails. A regular Gmail password will not work, you need an App Password:

1. Go to your Google Account -> Security -> 2-Step Verification
2. Scroll to the bottom and click App passwords
3. Create a new password, name it something like "Alertmanager"
4. Copy the generated password into `alertmanager/alertmanager.yml` and your `.env` file

### Alertmanager config

`alertmanager/alertmanager.yml` is excluded from version control because it contains credentials. Copy the example file and fill in your values:

```bash
cp alertmanager/alertmanager.yml.example alertmanager/alertmanager.yml
```

Replace all occurrences of `your-email@gmail.com` with your Gmail address and `your-app-password` with the App Password you generated.

## Related

[inventory-api](https://github.com/OKapirulya/inventory-api)