### 1. Основные правила

- Основная сущность - **project-id**: `ngm-<domain>-<project>`. Пример: `ngm-llm-rag`.

- Разделитель - только дефис `-`. Без пробелов, PascalCase и camelCase, точек и нижних подчёркивания.

### 2. Словарь окружения

### 3. Структура хранения

```
/srv/
├── git/
│   └── ngm/
│       └── <domain>/
│           └── <project-id>.git
├── work/
│   └── ngm/
│       └── <domain>/
│           └── <project-id>/
│               ├── .git/
│               ├── project.yaml
│               ├── README.md
│               ├── docs/
│               │   ├── tasks/
│               │   │   └── TASK-<project-id>-<NNNN>-<slug>.md
│               │   ├── adr/
│               │   │   └── ADR-<project-id>-<NNNN>-<slug>.md
│               │   └── runbooks/
│               │       └── RUNBOOK-<project-id>-<slug>.md
│               ├── deploy/
│               │   └── docker/
│               │       ├── compose.yaml
│               │       ├── compose.prod.yaml
│               │       └── .env.example
│               ├── src/
│               └── tests/
├── artifacts/
│   └── <project-id>/
│       └── <component>/
│           └── <version>/
└── backups/
    └── docker-volumes/
        └── <volume-name>/
            └── <YYYY-MM-DDTHH-MM-SSZ>/
```

### 4. Пример YAML проекта

```yaml
schema: 1
id: ngm-pdm-workflow
org: ngm
domain: pdm
project: workflow
display_name: "Workflow processes customization"
components:
  - id: api
    type: service
    language: C#
    image: registry.local/ngm/pdm/workflow/api
  - id: worker
    type: service
    language: python
    image: registry.local/ngm/pdm/workflow/worker
  - id: db
    type: datastore
    engine: postgres
environments: [local, dev, stage, prod]
```

### 5. Пример Docker Compose

```yaml
name: acme-payments-billing-prod

services:
  api:
    image: registry.local/acme/payments/billing/api:v1.4.2
    container_name: acme-payments-billing-api-prod-01
    networks:
      - acme-payments-billing-prod-net

  worker:
    image: registry.local/acme/payments/billing/worker:v1.4.2
    container_name: acme-payments-billing-worker-prod-01

volumes:
  acme-payments-billing-db-data-prod:
    name: acme-payments-billing-db-data-prod

networks:
  acme-payments-billing-prod-net:
    name: acme-payments-billing-prod-net
```