---
title: "Charcast"
description: "A browser-based ASCII art engine that converts images and video to ASCII art in real time, with text-to-ASCII via FIGlet fonts."
tags: ["Next.js", "TypeScript", "Canvas API", "Web Workers"]
demo: "https://charcast.app"
featured: true
order: 3
---

## Overview

Charcast is a free, privacy-first tool that converts images and videos into ASCII art directly in your browser. Drop an image or video and watch it transform into colored ASCII characters in real time. Everything runs client-side — no uploads, no server processing.

## How It Works

The rendering pipeline samples pixels from a canvas element, computes luminance, and maps brightness values to a character ramp (` .:-=+*#%@`). For video, pixel sampling runs in a Web Worker to keep the UI thread smooth. The output is drawn character-by-character onto a second canvas with per-cell RGB coloring.

## Features

- **Media to ASCII**: Real-time conversion of JPG, PNG, MP4, and WebM files
- **Text to ASCII**: 10 bundled FIGlet fonts for text-to-ASCII rendering
- **Color modes**: Full color, grayscale, and monochrome with theme support
- **Export**: PNG, plain text, styled HTML, clipboard copy, and video (WebM/MP4)
- **Video export**: Records the ASCII canvas with audio via MediaRecorder API
- **Adjustable controls**: Resolution, font size, character ramp, cropping, and more

## Technical Details

- **Framework**: Next.js 16 with React 19 and TypeScript
- **Rendering**: Canvas API with per-cell character drawing using JetBrains Mono
- **Performance**: Web Worker offloads pixel sampling for smooth video playback
- **State**: React Context with localStorage persistence and IndexedDB for media files
- **Styling**: Tailwind CSS v4 with dark/light theme support
- **Export**: MediaRecorder API with VP9/VP8/H.264 codec detection
