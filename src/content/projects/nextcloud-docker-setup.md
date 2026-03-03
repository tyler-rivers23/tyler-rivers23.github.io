---
title: "Nextcloud Docker Deployment with NGINX Proxy Manager"
description: "Self-hosted Nextcloud deployment using Docker Compose, MariaDB, Redis, and NGINX Proxy Manager with SSL."
date: 2026-03-03
summary: "Built a segmented homelab with mirrored traffic and NSM sensors for detection and analysis."
tags: ["Docker", "Nextcloud", "Reverse Proxy", "NGINX", "Homelab"]
---

## Overview

Deployed a secure self-hosted Nextcloud instance using Docker Compose with:

- Nextcloud
- MariaDB
- Redis
- NGINX Proxy Manager
- Let’s Encrypt SSL

This project simulates real-world secure infrastructure deployment in a homelab environment.

## Technical Highlights

- Configured reverse proxy routing with NGINX Proxy Manager
- Debugged and resolved a **502 Bad Gateway** issue caused by incorrect volume mounting
- Implemented container networking best practices
- Used Docker volumes for persistent storage
- Configured HTTPS with automatic certificate management

## What I Learned

- Deepened understanding of Docker networking and volume mounts
- Improved troubleshooting skills for reverse proxy and container misconfigurations
- Gained experience debugging production-style web deployment issues

## Repository

[View on GitHub](https://github.com/tyler-rivers23/nextcloud-docker-setup)