# CheatSheets

Личное хранилище инструкций, команд, примеров конфигурации и рабочих заметок.

## Разделы

- [Docker](docker/README.md) — команды и руководства по установке Docker.
- [Git](git/README.md) — настройка Git.
- [Linux](linux/README.md) — команды и управление пакетами.
- [LLM](llm/README.md) — Ollama, DeepSeek Harness, RAG и промпты.
- [Платформы](platforms/README.md) — инструкции, привязанные к конкретным платформам.
- [Соглашения](conventions/README.md) — правила именования и организации проектов.
- [Черновики](_drafts/README.md) — незавершённые материалы.

## Соглашения репозитория

- В каждой крупной тематической папке находится навигационный `README.md`.
- Руководства размещаются в `guides/`, команды — в `commands.md` или `commands/`.
- Запускаемые конфигурации и код размещаются в `examples/`.
- Изображения и другие вложения размещаются в `assets/` рядом с материалом.
- Имена файлов и каталогов записываются в lowercase kebab-case.

## Проверка ссылок

Локальные ссылки между Markdown-файлами можно проверить командой:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-markdown-links.ps1
```

Та же проверка автоматически запускается в GitHub Actions при push и pull request.
