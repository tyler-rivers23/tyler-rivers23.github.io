import { defineCollection, z } from "astro:content";

const projects = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.date(),
    tags: z.array(z.string()).default([]),
    summary: z.string(),
    github: z.string().url().optional(),
    demo: z.string().url().optional(),
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