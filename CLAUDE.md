# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A **Slidev presentation** ("presentation-as-code") titled "Generating API Clients from OpenAPI". All slide content lives in `slides.md`. There is no `tsconfig.json`, `vite.config.*`, `eslint.config.*`, or test framework — Slidev manages all tooling internally via `@slidev/cli`.

## Commands

```bash
npm run dev            # Dev server with live reload at http://localhost:3030
npm run build          # Production build → ./dist
npm run build:gh-pages # Build for GitHub Pages (base: /open-api-client-gen/)
npm run export         # Export to PDF
```

Verify changes by running `npm run build`. There are no tests — verification is visual (dev server) or build-based.

## Architecture

- `slides.md` — all slides, separated by `---`; global frontmatter sets theme/transitions
- `components/QrLink.vue` — only custom component; auto-imported by Slidev (no explicit import needed in Markdown)
- `.github/workflows/deploy-pages.yml` — pushes to main trigger `npm ci → build:gh-pages → GitHub Pages`

## Slide Syntax

- Slide separator: `---` with optional per-slide frontmatter (`layout`, `transition`, `class`)
- Layouts: `center`, `default`, `two-cols` (use `::right::` to split columns)
- `<v-clicks>` / `<v-click>` — progressive reveal
- Code step highlighting: ` ```ts {1|2-5|all} `
- Mermaid: fenced ` ```mermaid ` block with `%%{init: {...}}%%` for custom styles
- Speaker notes: HTML comment `<!-- ... -->` immediately after slide content
- Tailwind utility classes work directly in Markdown HTML

## Vue Component Conventions

- `<script setup lang="ts">` — no Options API, no `export default`
- Props typed with `defineProps<{ ... }>()` / `withDefaults(...)`
- Double quotes in templates, single quotes in `<script>` blocks
- Semicolons omitted in `<script setup>` (Slidev/Vite convention)
- Component files: `PascalCase.vue`; used in Markdown as `<MyComponent />`
