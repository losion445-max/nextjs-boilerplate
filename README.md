# Next.js TypeScript Boilerplate

A minimal, clean Next.js 16 + TypeScript project with modern development setup.

## Features

- ✅ Next.js 16.1.6 with App Router
- ✅ TypeScript for type safety
- ✅ Tailwind CSS for styling
- ✅ ESLint for code quality
- ✅ Prettier for code formatting
- ✅ Tab indentation configured
- ✅ VS Code optimized (.vscode folder)
- ✅ Environment variables setup (.env.local)
- ✅ HTTP requests file for API testing (requests.http)
- ✅ Minimal boilerplate - production ready

## Quick Start

### Development

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

### Build

```bash
npm run build
```

### Production

```bash
npm start
```

## Project Structure

```bash
src/
└── app/
    ├── components/      # React components (create as needed)
    ├── api/            # API routes (create as needed)
    ├── layout.tsx      # Root layout
    ├── page.tsx        # Home page
    ├── globals.css     # Global styles
    └── favicon.ico

.vscode/               # VS Code configuration
├── settings.json      # Editor settings
├── extensions.json    # Recommended extensions
└── launch.json        # Debugger config

Configuration Files:
├── .env.local         # Environment variables
├── .eslintrc.json     # ESLint rules
├── .prettierrc.json   # Prettier formatting
├── tsconfig.json      # TypeScript settings
├── next.config.ts     # Next.js configuration
└── requests.http      # API testing examples
```

## Tools & Extensions

**Installed Extensions:**

- ESLint - Code quality checking
- Prettier - Auto code formatter
- Tailwind CSS IntelliSense - Class autocomplete
- GitHub Copilot - AI code assistant
- GitLens - Git history & blame
- Error Lens - Inline error display
- And more...

## Development Workflow

1. **Edit files** - Create/modify TypeScript files
2. **Save** (`Ctrl+S`) - Auto-formats with Prettier, checks with ESLint
3. **See changes** - Live reload on localhost:3000
4. **Test API** - Use requests.http file with Thunder Client
5. **Commit** - Push meaningful commits to GitHub

## Scripts

```bash
npm run dev      # Start development server
npm run build    # Build for production
npm start        # Start production server
npm run lint     # Run ESLint
```

## Configuration Files

- `tsconfig.json` - TypeScript settings
- `next.config.ts` - Next.js configuration
- `tailwind.config.ts` - Tailwind CSS configuration
- `postcss.config.mjs` - PostCSS configuration
- `.gitignore` - Git ignore rules

## Environment Variables

Copy `.env.local` and add your variables:

```env
NEXT_PUBLIC_API_URL=http://localhost:3000
# DATABASE_URL=
# API_KEY=
```

**Note:** Variables starting with `NEXT_PUBLIC_` are exposed to the browser.

## Getting Help

- [Next.js Docs](https://nextjs.org/docs)
- [TypeScript Docs](https://www.typescriptlang.org/docs/)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)

---

## Credits

Created with ❤️ | Minimal boilerplate for modern web development
