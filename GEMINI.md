# Generating API Clients from OpenAPI (Presentation)

This project is a Slidev-based presentation titled "Generating API Clients from OpenAPI: How we stopped suffering and started generating". It is a "presentation-as-code" project built with Vue 3, Slidev, and TypeScript.

## Project Overview

- **Core Technology**: [Slidev](https://sli.dev/) (Markdown-based slides for developers).
- **Theme**: `@slidev/theme-seriph`.
- **Key Features**:
  - Interactive slides written in `slides.md`.
  - Custom Vue components (e.g., `QrLink.vue` for QR codes).
  - Mermaid diagrams for architecture visualization.
  - Built-in syntax highlighting with Shiki.
  - Automated deployment to GitHub Pages.

## Building and Running

The project uses `npm` for dependency management and scripts.

| Command | Description |
| :--- | :--- |
| `npm run dev` | Starts the development server with live reload at `http://localhost:3030`. |
| `npm run build` | Builds the presentation for production (SPAs). |
| `npm run build:gh-pages` | Builds the presentation specifically for GitHub Pages deployment. |
| `npm run export` | Exports the slides to a PDF file. |
| `npm run presenter` | Starts the presentation in remote presenter mode. |

## Development Conventions

### Content Management
- **Main Content**: All slide content, transitions, and layouts are defined in `slides.md`.
- **Layouts**: Uses standard Slidev layouts like `center`, `default`, and `two-cols`.
- **Animations**: Utilizes `<v-clicks>` for progressive list item reveals.

### Components
- **Location**: Custom Vue components reside in the `components/` directory.
- **Style**: Components use `<script setup lang="ts">` and Vue 3 Composition API.
- **Example**: `QrLink.vue` is used to generate QR codes for links (e.g., on the final "Thank you" slide).

### Styling & Diagrams
- **CSS**: Tailwind CSS is used for utility-first styling within the Markdown and components.
- **Diagrams**: Mermaid.js is integrated directly into the Markdown for flowcharts and diagrams.

### Deployment
- **GitHub Actions**: Automated deployment is configured in `.github/workflows/`.
- **Target**: Deployed to GitHub Pages at `/open-api-client-gen/`.
