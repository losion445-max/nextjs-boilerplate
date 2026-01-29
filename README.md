# Next.js TypeScript Boilerplate

A minimal, clean Next.js 16 + TypeScript project with modern development setup.

---

## Features

- ✅ Next.js 16.1.6 with App Router
- ✅ TypeScript for type safety
- ✅ Tailwind CSS for styling
- ✅ ESLint for code quality
- ✅ Prettier for code formatting
- ✅ VS Code optimized (.vscode folder)
- ✅ Environment variables setup (.env.local)
- ✅ HTTP requests file for API testing (requests.http)
- ✅ Minimal boilerplate — ready for dev & production

---

## Quick Start

### 1️⃣ Development (dev mode)

**Option 1: Local (no Docker)**

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)
Hot reload works: changes in `src/` appear instantly
Use `requests.http` for testing API routes

**Option 2: Docker (dev container)**

```bash
docker compose -f docker-compose.dev.yml up
```

- Uses `Dockerfile.dev`
- Mounts your local code with volumes → **hot reload works**
  Stop dev container:

```bash
docker compose -f docker-compose.dev.yml down
```

---

### 2️⃣ Production (prod mode)

**Option 1: Local build**

```bash
npm run build
npm start
```

- Starts the server in `NODE_ENV=production`
- No hot reload — code is **static build**

**Option 2: Docker (production)**

```bash
docker compose up -d
```

- Uses `Dockerfile` (production image)
- Optionally includes **Nginx reverse proxy**
- Healthcheck included
- To update code → **rebuild image**:

```bash
docker compose build
docker compose up -d
```

Stop containers:

```bash
docker compose down
```

---

## Project Structure

```bash
src/
└── app/
    ├── components/      # React components
    ├── api/             # API routes
    ├── layout.tsx       # Root layout
    ├── page.tsx         # Home page
    ├── globals.css      # Global styles
    └── favicon.ico

.vscode/                 # VS Code configuration
├── settings.json        # Editor settings
├── extensions.json      # Recommended extensions
└── launch.json          # Debugger config

Configuration Files:
├── .env.local           # Environment variables
├── .eslintrc.json       # ESLint rules
├── .prettierrc.json     # Prettier formatting
├── tsconfig.json        # TypeScript settings
├── next.config.ts       # Next.js configuration
└── requests.http        # API testing examples
```

---

## Scripts

```bash
npm run dev      # Start development server
npm run build    # Build for production
npm start        # Start production server
npm run lint     # Run ESLint
```

---

## Environment Variables

Copy `.env.local` and add your variables:

```env
NEXT_PUBLIC_API_URL=http://localhost:3000
# DATABASE_URL=
# API_KEY=
```

> Variables starting with `NEXT_PUBLIC_` are exposed to the browser.

---

## Dev vs Production Summary

| Mode        | Command / Docker                                              | Hot Reload | Notes                                                    |
| ----------- | ------------------------------------------------------------- | ---------- | -------------------------------------------------------- |
| Development | `npm run dev` / `docker compose -f docker-compose.dev.yml up` | ✅         | Code changes reflected instantly                         |
| Production  | `npm run build && npm start` / `docker compose up -d`         | ❌         | Requires rebuild after changes, uses NODE_ENV=production |

---

## Tools & Extensions

- ESLint - Code quality checking
- Prettier - Auto code formatter
- Tailwind CSS IntelliSense - Class autocomplete
- GitHub Copilot - AI code assistant
- GitLens - Git history & blame
- Error Lens - Inline error display

---

## Development Workflow

1. **Edit files** → modify TypeScript / React code
2. **Save (`Ctrl+S`)** → Prettier & ESLint auto-check
3. **View changes** → live reload in browser
4. **Test API** → use `requests.http` or Postman
5. **Commit** → push meaningful commits

---

## Getting Help

- [Next.js Docs](https://nextjs.org/docs)
- [TypeScript Docs](https://www.typescriptlang.org/docs/)
- [Tailwind CSS Docs](https://tailwindcss.com/docs/)
