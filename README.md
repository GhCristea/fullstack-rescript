# fullstack-rescript

Full-stack monorepo — **ReScript 12 · Bun · Hono · Cloudflare Workers · React**

> FP-first · Type-safe · ESM-only · Contract-driven API

## Stack

| Layer | Tech |
|-------|------|
| Language | ReScript 12 |
| Runtime | Bun |
| Backend | Hono on Cloudflare Workers |
| Frontend | React 18 + `@rescript/react` |
| Validation | `rescript-schema` |
| Build | Vite (frontend) · wrangler (backend) |

## Monorepo Layout

```
packages/
  shared/     ← API contract: paths + request/response schemas
  backend/    ← Hono router, Cloudflare Workers entry
  frontend/   ← React app
```

## Quick Start

```bash
bun install
bun run res:build       # compile all ReScript

bun run dev:backend     # → http://localhost:8787
bun run dev:frontend    # → http://localhost:5173
```

## Contract Layer

All route contracts live in `packages/shared/src/Routes.res`. Both backend and frontend share the same paths, types, and schemas — no duplication.

```rescript
// backend: validate incoming body
switch raw->S.parseWith(Routes.Users.Create.Request.schema) {
| Ok(input) => ...
| Error(e) => ...
}

// frontend: validate API response
switch raw->S.parseWith(Routes.Users.GetAll.Response.schema) {
| Ok(users) => ...
| Error(_) => ...
}
```

## Scripts

| Command | Description |
|---------|-------------|
| `bun run res:build` | Compile all packages |
| `bun run res:watch` | Watch mode |
| `bun run res:clean` | Clean compiled output |
| `bun run dev:backend` | Start Wrangler dev server |
| `bun run dev:frontend` | Start Vite dev server |
| `bun run build` | Production build |

## Deploy Backend

```bash
cd packages/backend
bun run deploy   # rescript build + wrangler deploy
```
