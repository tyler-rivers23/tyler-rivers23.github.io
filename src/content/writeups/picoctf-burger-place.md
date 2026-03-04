---
title: "picoCTF: Burger Place (Format String)"
date: 2026-02-28
ctf: "picoCTF"
difficulty: "Easy"
tags: ["pwn", "format-string"]
summary: "User input is used as a printf format string; triggering SIGSEGV prints the flag."
source: "/writeups/bof1/formatstring.c"
asm: "/writeups/bof1/formatstring.asm"
---

## TL;DR
- Bug: `printf(choice)` where `choice` is attacker-controlled → **format string vulnerability**
- Goal: trigger a controlled crash using `%s` so the program hits the **SIGSEGV handler**
- Result: handler prints the flag

---

## Challenge Overview
This challenge contains a classic format string vulnerability: user input is passed directly to `printf()` as the format string. Instead of leaking memory with `%p`, the intended solve here is to use `%s` to dereference an invalid pointer and crash the program — which triggers a custom **SIGSEGV** handler that prints the flag.

---

## Vulnerability
The program calls something equivalent to:

```c
printf(choice);