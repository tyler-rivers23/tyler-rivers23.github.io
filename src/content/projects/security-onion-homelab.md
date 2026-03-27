---
title: "Splunk Siem Lab"
date: 2026-02-28
tags: ["AD", "Dashboards", "Suricata", "Splunk"]
summary: "Built a segmented homelab with mirrored traffic and NSM sensors for detection and analysis."
github: "https://github.com/tyler-rivers23"
---

---

title: "Splunk SIEM SOC Lab"
date: 2026-03-27
tags: ["Splunk", "SIEM", "Blue Team", "Windows Logs", "SOC"]
summary: "Built a SOC-style lab using Splunk to detect brute force attacks, PowerShell activity, and persistence techniques from a Kali attacker."
github: "https://github.com/tyler-rivers23/splunk-siem-lab"
-----------------------------------------------------------

## What I built

* Centralized logging pipeline (Windows  Splunk via Universal Forwarder)
* SOC-style dashboard for real-time monitoring
* Detection queries for authentication, PowerShell, and account activity
* Automated alerts for brute-force login attempts

## What I did (Attack Simulation)

* Simulated brute-force login attempts (Event ID 4625)
* Executed PowerShell commands for post-exploitation activity
* Ran reconnaissance commands (`whoami`, `net user`, `ipconfig`)
* Created a new user account to simulate persistence (Event ID 4720)

## Detection & Monitoring

* Built SPL queries to detect:

  * Failed login attempts
  * PowerShell execution
  * Suspicious command usage
  * Account creation events
* Created a dashboard with:

  * Failed logins over time
  * Top attacker IPs
  * Targeted users
  * PowerShell activity
* Configured alerts to detect brute-force behavior in near real time

## What I learned

* How to configure and troubleshoot a SIEM data pipeline
* Importance of proper log ingestion and index configuration
* How attackers move from initial access → discovery → persistence
* How to use logs to reconstruct attacker activity and timelines
* Building detections that map to real-world attack techniques

## Key Takeaway

This project gave me hands-on experience building a mini SOC environment, detecting real attack behavior, and investigating events using log data—skills directly applicable to a SOC or security analyst role.
