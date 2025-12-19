# md2html (Astro)

Static site built with Astro and Tufte CSS. The author keeps writing Markdown in `content/` and the site renders it with the same sidenote and footnote syntax.

## Quick Start

```bash
npm install
npm run dev
```

Open the URL printed by Astro to preview changes with hot reload.

## Scripts

```bash
npm run dev      # development server
npm run build    # static build to dist/
npm run preview  # serve the built site
```

Optional wrapper:

```bash
./scripts/manage.sh dev
```

## Project Structure

```
content/              Markdown source (kept unchanged)
content/img/          Image assets served from /static/img/
public/static/        Tufte CSS assets and fonts
src/layouts/          Astro layouts
src/lib/              Markdown pipeline and Tufte helpers
src/pages/            Astro routes (`index.astro` -> `content/index.md`, `[slug]/index.astro` -> other `content/*.md`)
```

## Markdown Support

- Sidenotes: `Main text^[This becomes a sidenote]`
- Footnotes: `Main text[^note]` + `[^note]: note text` (rendered as sidenotes)
- Margin notes from image titles: `![Alt](path "Caption")`
- Margin notes via `{:.marginnote}` on inline emphasis or links
- Math: inline `$E = mc^2$` or block `$$ a^2 + b^2 = c^2 $$` (rendered with KaTeX)
- Multi-page: any `content/*.md` (except `index.md`) is emitted at `/{filename}` via `src/pages/[slug]/index.astro`

## Notes

- The site reads `content/index.md` directly to keep the author workflow intact.
- Assets are served from `/static/` to preserve existing links.
- Build assets emitted to `/static/_astro` inside `dist`.
- Images should live in `content/img/` and be referenced as `/static/img/...` in Markdown.
# md2html
