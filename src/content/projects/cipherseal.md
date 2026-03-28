---
title: "CipherSeal"
description: "A CLI tool that embeds hidden, imperceptible watermarks into images and text to help combat AI-generated misinformation and deepfakes."
tags: ["Python", "Steganography", "CLI", "Security"]
github: "https://github.com/danielhirt/CipherSeal"
featured: true
order: 4
---

## Overview

CipherSeal embeds imperceptible watermarks into images and text files. It generates content identifiers that can be verified independently, designed to combat AI-generated misinformation and deepfakes.

## How It Works

1. **Embed**: Add a hidden watermark to an image or text file via a simple CLI command
2. **Share**: Distribute the watermarked content. The watermark is invisible to the naked eye
3. **Verify**: Extract and verify the embedded watermark to confirm content authenticity

## Technical Details

- **Language**: Python
- **Image Watermarking**: Least-significant-bit (LSB) steganography on PNG files
- **Text Watermarking**: Concealed identifiers embedded into text documents
- **License**: Apache-2.0

## Key Features

- Embed hidden watermarks in PNG images and text files
- Extract and verify watermarks from protected content
- Custom message support for watermark payloads
- Configurable output file paths

## Why I Built This

AI-generated content and deepfakes created demand for tools that verify content authenticity. CipherSeal uses steganographic techniques as a lightweight approach to content provenance, embedding proof of origin into the media itself.
