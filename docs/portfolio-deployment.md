# Astro Portfolio Setup & GitHub Pages Deployment

**Author:** Tyler Rivers
**Project:** Personal Cybersecurity Portfolio (CTF Writeups + Projects)
**Website:** httpstylergithub.io

---

# 1. Overview

This document explains how the personal portfolio website was created using **Astro**, developed locally with **Node/Docker**, and deployed publicly using **GitHub Pages**.

The portfolio includes:

* Projects showcase
* CTF writeups
* Contact page
* Resume download
* GitHub integration

Once deployed, the website is hosted entirely by GitHub Pages and does **not** require the local computer or Docker to remain running.

---

# 2. Prerequisites

Required software:

* Node.js (or Docker with Node image)
* Git
* GitHub account
* VS Code or any editor

Optional:

* Docker Desktop
* PowerShell (Windows)

---

# 3. Creating the Astro Project

Navigate to your development directory:

```bash
cd C:\dev\tyler-portfolio
```

Create Astro project:

```bash
npm create astro@latest
```

Choose:

* Template: Minimal / Starter
* TypeScript: Yes
* Install dependencies: Yes

Project folder example:

```
C:\dev\tyler-portfolio\superior-spiral
```

---

# 4. Running the Website Locally

Inside the project folder:

```bash
cd superior-spiral
npm install
npm run dev
```

Site runs at:

```
http://localhost:4321
```

Docker alternative:

```bash
docker run -it --rm -v ${PWD}:/app -w /app -p 4321:4321 node:lts bash
npm install
npm run dev -- --host 0.0.0.0 --port 4321
```

---

# 5. Project Structure

Important folders:

```
src/
  pages/
  content/
    projects/
    writeups/
  components/
public/
astro.config.mjs
package.json
```

Content collections store projects and CTF writeups.

---

# 6. Creating Content Collections

File:

```
src/content/config.ts
```

Example schema:

```ts
import { defineCollection, z } from "astro:content";

const projects = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.date(),
    tags: z.array(z.string()).default([]),
    summary: z.string(),
  }),
});

const writeups = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.date(),
    ctf: z.string(),
    difficulty: z.string().optional(),
    tags: z.array(z.string()).default([]),
    summary: z.string(),
  }),
});

export const collections = { projects, writeups };
```

---

# 7. Adding Writeups

Folder:

```
src/content/writeups/
```

Example file:

```
picoctf-buffer1.md
```

Frontmatter:

```md
---
title: "Buffer Overflow 1"
date: 2025-10-01
ctf: "picoCTF"
difficulty: "Easy"
tags: ["buffer overflow", "pwn"]
summary: "Basic stack overflow exploitation."
---

Writeup content here...
```

---

# 8. Dynamic Writeup Routing

File:

```
src/pages/writeups/[...slug].astro
```

This enables URLs like:

```
/writeups/picoctf-buffer1/
```

---

# 9. Preparing for GitHub Pages Deployment

GitHub Pages requires static output.

Install adapter:

```bash
npm install @astrojs/github
```

Edit:

```
astro.config.mjs
```

```js
import { defineConfig } from 'astro/config';
import github from '@astrojs/github';

export default defineConfig({
  site: 'https://tyler-rivers23.github.io',
  base: '/',
  output: 'static',
  integrations: [github()],
});
```

---

# 10. Disable Jekyll (Important)

Create file in project root:

```
.nojekyll
```

This prevents GitHub from trying to build with Jekyll instead of Astro.

---

# 11. GitHub Repository Setup

Repository name must be:

```
tyler-rivers23.github.io
```

Initialize git:

```bash
git init
git add .
git commit -m "Initial portfolio"
git branch -M main
git remote add origin https://github.com/tyler-rivers23/tyler-rivers23.github.io.git
git push -u origin main
```

---

# 12. GitHub Actions Deployment

Create folder:

```
.github/workflows/
```

File:

```
deploy.yml
```

Example:

```yaml
name: Deploy Astro to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20

      - run: npm install
      - run: npm run build

      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}

    runs-on: ubuntu-latest
    needs: build

    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
```

---

# 13. Enable GitHub Pages

GitHub → Repository → Settings → Pages

Set:

```
Source: GitHub Actions
```

After deployment:

```
https://tyler-rivers23.github.io
```

---

# 14. Updating the Website

Edit files locally:

```
src/content/
src/pages/
src/components/
```

Then push:

```bash
git add .
git commit -m "Update portfolio"
git push
```

GitHub automatically redeploys.

---

# 15. Resume Download Button

Place resume in:

```
public/resume.pdf
```

Link example:

```html
<a href="/resume.pdf" download>Download Resume</a>
```

---

# 16. Hosting Behavior

Important:

* GitHub hosts the site permanently.
* Local machine does NOT need to stay on.
* Docker is only for development.

---

# 17. Future Improvements

Recommended upgrades:

* Dark mode toggle
* Blog section
* Homelab diagrams
* Splunk dashboards screenshots
* Reverse engineering writeups
* Contact form with email service

---

# 18. Technologies Used

* Astro
* TypeScript
* Markdown
* GitHub Pages
* Node.js
* Docker (optional)

---

# 19. Author

Tyler Rivers
Cybersecurity Student — University of Cincinnati
GitHub: https://github.com/tyler-rivers23
Website: httpstylergithub.io

---
