---
title: "picoCTF: Burger Place (Format String)"
date: 2026-02-28
ctf: "picoCTF"
difficulty: "Easy"
tags: ["pwn", "format-string"]
summary: "User input is used as a printf format string; triggering SIGSEGV prints the flag."
---

## Bug
`printf(choice)` uses attacker-controlled format strings.

## Result
Using a `%s`-driven crash triggers the SIGSEGV handler which prints `flag`.