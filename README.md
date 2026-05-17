# Greenplum in Docker

**Local Greenplum Database setup for development and testing.**

## Requirements
- Docker (tested on v20.10+)
- At least **4GB RAM** (Greenplum is resource-intensive)
- Ports `5432` (PostgreSQL) and `6000-6010` (Greenplum segments) free

## Quick Start
1. Clone this repo:
   ```bash
   git clone https://github.com/mraduntsev/docker-greenplum.git
   cd docker-greenplum
   docker-compose up -d
   ```
