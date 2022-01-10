# PuTTY User Manual

PuTTY is a free (MIT-licensed) Windows Telnet and SSH client. This manual documents PuTTY, and its companion utilities PSCP, PSFTP, Plink, Pageant and PuTTYgen.

Note to Unix users: this manual currently primarily documents the Windows versions of the PuTTY utilities. Some options are therefore mentioned that are absent from the Unix version; the Unix version has features not described here; and the pterm and command-line puttygen and pageant utilities are not described at all. The only Unix-specific documentation that currently exists is the man pages.

This manual is copyright 1997-2021 Simon Tatham. All rights reserved. You may distribute this documentation under the MIT licence. See appendix D for the licence text in full.

## Chapter 1: Introduction to PuTTY

1.1 What are SSH, Telnet, Rlogin, and SUPDUP?
1.2 How do SSH, Telnet, Rlogin, and SUPDUP differ?
 
## Chapter 2: Getting started with PuTTY

- 2.1. Starting a session
- 2.2. Verifying the host key (SSH only)
- 2.2. Verifying the host key (SSH only)
- 2.2. Verifying the host key (SSH only)
- 2.3. Logging in
- 2.4. After logging in
- 2.5. Logging out

## Chapter 3: Using PuTTY

- 3.1 During your session
- 3.2 Creating a log file of your session
- 3.3 Altering your character set configuration
- 3.4 Using X11 forwarding in SSH
- 3.5 Using port forwarding in SSH
- 3.6 Connecting to a local serial line
- 3.7 Making raw TCP connections
- 3.8 Connecting using the Telnet protocol
- 3.9 Connecting using the Rlogin protocol
- 3.10 Connecting using the SUPDUP protocol
- 3.11 The PuTTY command line

## Chapter 4: Configuring PuTTY

- 4.1 The Session panel
- 4.2 The Logging panel
- 4.3 The Terminal panel
- 4.4 The Keyboard panel
- 4.5 The Bell panel
- 4.6 The Features panel
- 4.7 The Window panel
- 4.8 The Appearance panel
- 4.9 The Behaviour panel
- 4.10 The Translation panel
- 4.11 The Selection panel
- 4.12 The Copy panel
- 4.13 The Colours panel
- 4.14 The Connection panel
- 4.15 The Data panel
- 4.16 The Proxy panel
- 4.17 The SSH panel
- 4.18 The Kex panel
- 4.19 The Host Keys panel
- 4.20 The Cipher panel
- 4.21 The Auth panel
- 4.22 The GSSAPI panel
- 4.23 The TTY panel
- 4.24 The X11 panel
- 4.25 The Tunnels panel
- 4.26 The Bugs and More Bugs panels
- 4.27 The ‘Bare ssh-connection’ protocol
- 4.28 The Serial panel
- 4.29 The Telnet panel
- 4.30 The Rlogin panel
- 4.31 The SUPDUP panel
- 4.32 Storing configuration in a file

## Chapter 5: Using PSCP to transfer files securely

- 5.1 Starting PSCP
- 5.2 PSCP Usage

## Chapter 6: Using PSFTP to transfer files securely

- 6.1 Starting PSFTP
- 6.2 Running PSFTP
- 6.3 Using public key authentication with PSFTP

## Chapter 7: Using the command-line connection tool Plink

- 7.1 Starting Plink
- 7.2 Using Plink
- 7.3 Using Plink in batch files and scripts
- 7.4 Using Plink with CVS
- 7.5 Using Plink with WinCVS

## Chapter 8: Using public keys for SSH authentication

- 8.1 Public key authentication - an introduction
- 8.2 Using PuTTYgen, the PuTTY key generator
- 8.3 Getting ready for public key authentication

## Chapter 9: Using Pageant for authentication

- 9.1 Getting started with Pageant
- 9.2 The Pageant main window
- 9.3 The Pageant command line
- 9.4 Using agent forwarding
- 9.5 Loading keys without decrypting them
- 9.6 Security considerations

## Chapter 10: Common error messages

- 10.1 ‘The server's host key is not cached in the registry’
- 10.2 ‘WARNING - POTENTIAL SECURITY BREACH!’
- 10.3 ‘SSH protocol version 2 required by our configuration but remote only provides (old, insecure) SSH-1’
- 10.4 ‘The first cipher supported by the server is ... below the configured warning threshold’
- 10.5 ‘Remote side sent disconnect message type 2 (protocol error): "Too many authentication failures for root"’
- 10.6 ‘Out of memory’
- 10.7 ‘Internal error’, ‘Internal fault’, ‘Assertion failed’
- 10.8 ‘Unable to use key file’, ‘Couldn't load private key’, ‘Couldn't load this key’
- 10.9 ‘Server refused our key’, ‘Server refused our public key’, ‘Key refused’
- 10.10 ‘Access denied’, ‘Authentication refused’
- 10.11 ‘No supported authentication methods available’
- 10.12 ‘Incorrect MAC received on packet’ or ‘Incorrect CRC received on packet’
- 10.13 ‘Incoming packet was garbled on decryption’
- 10.14 ‘PuTTY X11 proxy: various errors’
- 10.15 ‘Network error: Software caused connection abort’
- 10.16 ‘Network error: Connection reset by peer’
- 10.17 ‘Network error: Connection refused’
- 10.18 ‘Network error: Connection timed out’
- 10.19 ‘Network error: Cannot assign requested address’

## Appendix A: PuTTY FAQ

- A.1 Introduction
- A.2 Features supported in PuTTY
- A.3 Ports to other operating systems
- A.4 Embedding PuTTY in other programs
- A.5 Details of PuTTY's operation
- A.6 HOWTO questions
- A.7 Troubleshooting
- A.8 Security questions
- A.9 Administrative questions
- A.10 Miscellaneous questions

## Appendix B: Feedback and bug reporting

- B.1 General guidelines
- B.2 Reporting bugs
- B.3 Reporting security vulnerabilities
- B.4 Requesting extra features
- B.5 Requesting features that have already been requested
- B.6 Support requests
- B.7 Web server administration
- B.8 Asking permission for things
- B.9 Mirroring the PuTTY web site
- B.10 Praise and compliments
- B.11 E-mail address

## Appendix C: PPK file format

- C.1 Overview
- C.2 Outer layer
- C.3 Private key encodings
- C.4 Key derivation
- C.5 Older versions of the PPK format

## Appendix D: PuTTY Licence

## Appendix E: PuTTY hacking guide

- E.1 Cross-OS portability
- E.2 Multiple backends treated equally
- E.3 Multiple sessions per process on some platforms
- E.4 C, not C++
- E.5 Security-conscious coding
- E.6 Independence of specific compiler
- E.7 Small code size
- E.8 Single-threaded code
- E.9 Keystrokes sent to the server wherever possible
- E.10 640×480 friendliness in configuration panels
- E.11 Automatically generated Makefiles
- E.12 Coroutines in the SSH code
- E.13 Explicit vtable structures to implement traits
- E.14 Single compilation of each source file
- E.15 Do as we say, not as we do

## Appendix F: PuTTY download keys and signatures

- F.1 Public keys
- F.2 Security details
- F.3 Key rollover

## Appendix G: SSH-2 names specified for PuTTY

- G.1 Connection protocol channel request names
- G.2 Key exchange method names
- G.3 Encryption algorithm names
- G.4 Agent extension request names

## Index

- If you want to provide feedback on this manual or on the PuTTY tools themselves, see the Feedback page.

[PuTTY release 0.76]
