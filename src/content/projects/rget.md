---
title: "rget"
description: "A lightweight wget clone written in Rust — a fast, async file downloader with progress tracking and streaming support."
tags: ["Rust", "CLI", "Async", "Networking"]
github: "https://github.com/danielhirt/rget"
featured: true
order: 5
---

## Overview

rget is a command-line download utility that replicates the core functionality of `wget`, built in Rust. It streams files from HTTP/HTTPS URLs with a clean progress bar, quiet mode, and smart filename detection.

## Technical Details

- **Language**: Rust (Edition 2024)
- **HTTP Client**: reqwest with async streaming
- **Async Runtime**: Tokio for non-blocking I/O
- **CLI Parsing**: clap for declarative argument handling
- **Progress**: indicatif for styled terminal progress bars

## Key Features

- Download files from any HTTP/HTTPS URL with a single command
- Interactive progress bar showing elapsed time, bytes downloaded, and filename
- Quiet mode (`-q`) for silent, scriptable downloads
- Chunked streaming for efficient handling of large files
- Smart filename extraction from URLs, with timestamp fallback

## Why I Built This

I wanted to get more hands-on with Rust's async ecosystem and see how it handles real I/O-bound workloads. Rebuilding a familiar tool like `wget` was a good way to explore Tokio, streaming responses, and Rust's error handling in a practical context.
