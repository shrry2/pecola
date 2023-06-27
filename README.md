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
$ make db-prepare
```

## Development

### Start containers

```bash
$ make up
```

### Stop containers

```bash
$ make down
```

### Run tests

```bash
$ make test
```
