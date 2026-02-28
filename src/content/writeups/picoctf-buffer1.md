---
title: "picoCTF: buffer overflow 1"
date: 2026-02-28
ctf: "picoCTF"
difficulty: "Easy"
tags: ["pwn", "buffer-overflow", "stack"]
summary: "Classic stack buffer overflow to redirect execution to win() function."
---

## Overview

This challenge involves exploiting a stack-based buffer overflow to redirect execution to a hidden `win()` function that prints the flag.

The vulnerability occurs because user input is read into a fixed-size buffer without proper bounds checking.

---

## Vulnerability

The program uses an unsafe input function (such as `gets()` or `scanf("%s")`) allowing more data than the buffer size.

Example pattern:

```c
char buf[32];
gets(buf);