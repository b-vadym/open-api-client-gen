# AGENTS.md - Agent Guidelines for This Repository

This is a **Slidev presentation project** about generating API clients from OpenAPI specifications.
The presentation topic is: "Generating API Clients from OpenAPI: How we stopped suffering and started generating".

## Project Overview

- **Type**: Slidev presentation ("presentation-as-code")
- **Tech Stack**: Vue 3, Slidev (`@slidev/cli ^52`), TypeScript, Tailwind CSS (via Slidev), Mermaid.js
- **Theme**: `@slidev/theme-seriph`
- **Purpose**: Conference presentation on OpenAPI client generation using Orval
- **Deployed at**: `https://b-vadym.github.io/open-api-client-gen/`

## Project Structure

```
.
├── slides.md                    # All slide content (883 lines, ~20 slides)
├── components/
│   └── QrLink.vue               # Custom Vue component — renders a QR code
├── package.json                 # npm scripts and dependencies
├── package-lock.json
└── .github/workflows/
    └── deploy-pages.yml         # GitHub Actions — deploy to GitHub Pages on push to main
```

There are **no** `tsconfig.json`, `vite.config.*`, `eslint.config.*`, or `prettier.config.*` files.
Slidev manages all Vite/TypeScript/tooling internally via `@slidev/cli`.

## Build & Dev Commands

```bash
# Install dependencies (use npm ci in CI, npm install locally)
npm install

# Start development server with live reload at http://localhost:3030
npm run dev

# Build for production (outputs to ./dist)
npm run build

# Build for GitHub Pages (sets base path to /open-api-client-gen/)
npm run build:gh-pages

# Export slides to PDF
npm run export

# Start remote presenter mode (for presenting on a second screen)
npm run presenter
```

**Preferred verification workflow**: After making changes, run `npm run build` (or
`npm run build:gh-pages`) to confirm the build succeeds without errors. The dev server
(`npm run dev`) is better for iterative editing with instant feedback.

## Testing

This project has **no test files** and no test framework. There is no `test` script.
Verification is done by building or visually inspecting via the dev server.

## CI/CD — GitHub Pages Deployment

- Defined in `.github/workflows/deploy-pages.yml`
- Triggered on push to `main` branch (or manual `workflow_dispatch`)
- Steps: checkout → Node 20 setup → `npm ci` → `npm run build:gh-pages` → deploy to Pages
- Output artifact: `./dist` directory
- Base path for the deployed build: `/open-api-client-gen/`

## Slide Content (`slides.md`)

### Structure

- Slides are separated by `---`
- Global frontmatter (lines 1–16): sets theme, background, title, highlighter, transition
- Per-slide frontmatter: `layout`, `transition`, `class`

### Available Layouts

| Layout | Use case |
|---|---|
| `center` | Centered single-focus slides |
| `default` | Standard left-aligned content |
| `two-cols` | Side-by-side columns; use `::right::` to start the right column |

### Slidev-Specific Markdown Features

- `<v-clicks>` — wraps a list to reveal items one click at a time
- `<v-click>` — reveals a single block on the next click
- Code blocks with step highlighting: ` ```ts {1|2-5|all} ` — highlights lines per click
- Mermaid diagrams: fenced block with ` ```mermaid ` — use `%%{init: {...}}%%` for custom styling
- Tailwind CSS utility classes work directly in Markdown HTML and component templates
- Speaker notes: HTML comment `<!-- ... -->` immediately below slide content

### Example Slide

```markdown
---
layout: two-cols
transition: fade-out
---

# Left column heading

Content here

::right::

Content in right column

<!--
Speaker notes go here.
-->
```

## Vue Components (`components/`)

### Conventions

- File names: `PascalCase.vue` (e.g., `QrLink.vue`)
- Use `<script setup lang="ts">` — no Options API, no `export default`
- Define all props with TypeScript generics: `defineProps<{ ... }>()`
- Use `withDefaults(defineProps<...>(), { ... })` when any prop has a default value
- Prefer Composition API (no `data()`, `methods`, `computed` options blocks)
- Templates use double-quoted attributes; script/logic uses single quotes

### Component Example (`QrLink.vue`)

```vue
<script setup lang="ts">
import { QrcodeSvg } from 'qrcode.vue'

withDefaults(
  defineProps<{
    value: string
    size?: number
    level?: 'L' | 'M' | 'Q' | 'H'
  }>(),
  {
    size: 180,
    level: 'M',
  }
)
</script>

<template>
  <div class="inline-flex items-center justify-center rounded-lg bg-white p-3">
    <QrcodeSvg :value="value" :size="size" :level="level" render-as="svg" />
  </div>
</template>
```

## TypeScript Conventions

- All component props must be typed — no `any`, no untyped props
- Use union literal types for constrained string values (e.g., `'L' | 'M' | 'Q' | 'H'`)
- Type/interface names: `PascalCase`
- Prop/variable names: `camelCase`
- No standalone `.ts` files exist yet; all TypeScript lives inside `.vue` files

## Formatting Conventions

No linter or formatter config is committed. Follow the style observed in the codebase:

- **Indentation**: 2 spaces (Vue files and Markdown)
- **Quotes**: double in Vue templates; single in `<script>` blocks
- **Trailing commas**: yes (in `withDefaults` objects, import lists, etc.)
- **Semicolons**: omitted in `<script setup>` blocks (Slidev/Vite convention)
- **Blank lines**: one blank line between `<script>`, `<template>`, and `<style>` blocks

## Import Order (in `<script setup>`)

1. External libraries (e.g., `import { QrcodeSvg } from 'qrcode.vue'`)
2. Local components (e.g., `import MyComp from './MyComp.vue'`)
3. Type-only imports last (e.g., `import type { Foo } from './types'`)

## Naming Conventions

| Item | Convention | Example |
|---|---|---|
| Vue component files | `PascalCase.vue` | `QrLink.vue` |
| Component usage in Markdown | Self-closing PascalCase | `<QrLink />` |
| Directory names | `kebab-case` | `components/` |
| Props | `camelCase` | `qrCodeValue` |
| TypeScript interfaces/types | `PascalCase` | `UserApiResource` |

## Dependencies

- `@slidev/cli` — Slidev framework (includes Vite, Vue 3, UnoCSS/Tailwind, Shiki, Mermaid)
- `@slidev/theme-seriph` — presentation theme
- `qrcode.vue` — QR code Vue component (used in `QrLink.vue`)

All listed under `devDependencies` in `package.json`; there are no runtime `dependencies`.

## Adding New Content

### New slide
1. Open `slides.md`
2. Add `---` separator, optional per-slide frontmatter, then content
3. Check rendering with `npm run dev`

### New Vue component
1. Create `components/MyComponent.vue` using `<script setup lang="ts">`
2. Use it directly in `slides.md` as `<MyComponent />` — Slidev auto-imports components
3. No explicit import statement needed in Markdown
