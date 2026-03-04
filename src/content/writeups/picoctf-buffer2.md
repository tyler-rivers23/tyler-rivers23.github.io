---
title: "picoCTF: Buffer Overflow 2"
date: 2026-02-27
ctf: "picoCTF"
difficulty: "Easy"
summary: "A classic 32-bit stack overflow where you redirect execution to win() and also control the function arguments on the stack."
tags:
  - CTF
  - Pwn
  - Buffer Overflow
  - x86
source: "/writeups/bof1/vuln2.c"
asm: "/writeups/bof1/vuln2.asm"
---

## TL;DR
- Bug: unsafe input into a fixed-size stack buffer → overwrite saved return address
- Goal: jump to `win()` **and** supply the expected arguments on the stack (cdecl)
- Layout: `padding + win + fake_ret + arg1 + arg2`
- Tools: Ghidra (win addr / arg values), cyclic (offset), pwntools (payload)

---

## Challenge Overview
This challenge is an extension of a basic stack overflow. Instead of *only* redirecting execution to `win()`, you also have to pass the correct values as arguments to `win()` by placing them on the stack.

In a typical **32-bit x86** binary using **cdecl**, arguments are passed on the stack.

---

## Vulnerability
The program reads user input into a fixed-size local buffer without proper bounds checking (ex: `gets()` or an equivalent unsafe read). That allows writing past the buffer and overwriting stack control data — including the saved return address.

> **Why it matters**
> If we overwrite the saved return address, we can redirect execution to a function of our choice (like `win()`).

---

## Find `win()` and the required arguments
In Ghidra (or `objdump`/`nm`), locate:
1) The address of `win()`
2) The values `win()` expects (often compared against constants in the function)

Examples of how to locate `win()`:
```bash
nm -n vuln2 | grep " win"
# or
objdump -d -M intel vuln2 | grep "<win>"