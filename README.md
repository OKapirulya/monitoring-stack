# monitoring-stack

A self-hosted observability stack for monitoring the inventory-api and its underlying infrastructure.

## Overview

This stack collects metrics from the application and the server it runs on, stores them in a time-series database, visualizes them in dashboards, and sends alerts when something goes wrong.

## Components

Prometheus scrapes and stores metrics from all configured targets every 15 seconds.

Grafana reads from Prometheus and displays the data as dashboards. The datasource and dashboard provider are provisioned automatically on startup.

Alertmanager receives alerts from Prometheus and routes them to email based on severity. Critical alerts are sent immediately, warnings are grouped and sent less frequently.

Node Exporter exposes host-level metrics from the server: CPU usage, memory, disk space, and network traffic.

cAdvisor exposes per-container metrics: CPU and memory usage per running Docker container.

## Stack

Prometheus, Grafana, Alertmanager, Node Exporter, cAdvisor, Docker Compose

## Related

inventory-api: github.com/OKapirulya/inventory-api