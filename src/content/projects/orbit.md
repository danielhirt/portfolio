---
title: "Orbit"
description: "A local-first productivity tool that lets you save links, code snippets, and notes, then receive AI-generated weekly email digests."
tags: ["Go", "Chrome Extension", "OpenAI", "PostgreSQL"]
demo: "https://chromewebstore.google.com/detail/orbit/hfjdjkaoeodoblkckkcbplpphicdogag"
featured: true
order: 2
---

## Overview

Orbit is a "save it, forget it, get a digest" tool. It's a browser extension that lets you capture content throughout the week, then uses AI to summarize and group everything into a weekly email digest.

## How It Works

1. **Save**: Capture links, code snippets, or notes via the Chrome extension popup, right-click context menu, or keyboard shortcut
2. **Forget**: Everything is stored locally in your browser - no content leaves your device unless you request a digest
3. **Digest**: Once a week, receive an AI-generated email that summarizes and groups your saved items by theme

## Technical Details

- **Extension**: Vanilla JavaScript with Chrome Manifest V3
- **Backend**: Go with Chi router
- **Database**: PostgreSQL (Neon) for user accounts only
- **AI**: OpenAI API (gpt-4o-mini) for digest summarization
- **Email**: Resend API for delivery
- **Hosting**: Fly.io

## Privacy-First Architecture

The core design principle is **local-first**: all user content is stored in the browser's local storage. The server only handles authentication and ephemeral digest generation. Even in the event of a server breach, no user content is at risk.

## Features

- Multiple save methods: popup, page capture, context menu, keyboard shortcut
- Data export in Markdown or JSON
- Dark mode support
- Free tier (local-only) and Pro tier (scheduled AI digests)
- Status tracking: active, archived, digested
