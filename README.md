# Pecola

AI-powered my personal assistant.

## Setup

### Environment variables

```bash
$ cp .env.example .env
```

Adjust the environment variables in `.env` to your needs.

### Database

```bash
$ docker compose run --rm api bin/rails db:prepare
```

## Development

### Start containers

```bash
$ docker compose up -d
```
