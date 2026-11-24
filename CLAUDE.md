# CLAUDE.md

WhatsApp chatbot built with Django, connected to the Meta WhatsApp Cloud API.
Three parts: the bot (webhook + message handling), a REST API, and the Django admin.

## Stack
- Python 3.14, Django 6.1
- Package manager: uv
- Database: SQLite (dev)

## Commands
- Run server: `uv run python manage.py runserver`
- Migrations: `uv run python manage.py makemigrations && uv run python manage.py migrate`
- Tests: `uv run python manage.py test`
- Add dependency: `uv add <package>`

## Project structure
- `chatbot/` — Django project (settings, urls)
- `chatbot/core/` — main app

## Conventions
<!-- Add coding conventions as they are decided -->

## Context docs
Read the relevant file before working on that area:
- `docs/claude/architecture.md` — overall design and app layout
- `docs/claude/whatsapp.md` — Meta API, webhook, message flow
- `docs/claude/api.md` — REST API endpoints and auth
- `docs/claude/admin.md` — admin customizations
