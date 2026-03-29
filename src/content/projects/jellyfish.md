---
title: "Jellyfish"
description: "A distributed key-value store database written in Go, designed for reliable data persistence with an append-only file architecture."
tags: ["Go", "Distributed Systems", "Database"]
github: "https://github.com/danielhirt/jellyfish"
featured: true
order: 3
---

## Overview

Jellyfish is a key-value storage system built from scratch in Go. It implements a distributed database architecture with durability guarantees through an append-only file (AOF) persistence mechanism.

## Technical Details

- **Language**: Go
- **Persistence**: Append-only file for durability and crash recovery
- **Architecture**: Designed for distributed deployment across multiple nodes

## Key Features

- Efficient key-value storage and retrieval
- Data persistence with append-only file logging
- Clean Go module structure for easy integration
- Built for reliability in distributed environments

## Why I Built This

I built this to understand core database infrastructure from first principles: data persistence, distributed consensus, and key-value storage at a low level.
