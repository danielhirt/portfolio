---
title: "WickWright"
description: "A candle-making experiment tracking app for documenting candle recipes, burn tests, and organizing collections."
tags: ["Next.js", "React", "TypeScript", "Drizzle", "Turso"]
featured: true
order: 4
---

## Overview

WickWright is a purpose-built tool for candle makers to track their craft. It lets you document candle recipes with detailed pour parameters, run structured burn tests with hourly photo tracking, and organize everything into collections.

## Features

- **Candle Recipes** — Track wax type, fragrance, wick, and pour details for each candle
- **Burn Tests** — Document burn test results with hourly photo tracking to dial in performance
- **Collections** — Organize candles into groups for product lines or experiments
- **Media Gallery** — Attach photos and videos to candles, burn tests, and collections
- **Tools** — Batch calculator and wax/fragrance formula helpers

## Technical Details

- **Framework**: Next.js 16 (App Router), React 19, TypeScript
- **Database**: Drizzle ORM with Turso (libSQL/SQLite)
- **Styling**: Tailwind CSS v4, shadcn/ui
- **Storage**: Vercel Blob for media uploads
- **Deployment**: Vercel

## Architecture

The app uses a polymorphic media system — images and videos can be attached to any entity (candle, burn test, or collection) through a single media table. Local development runs against a SQLite file, while production uses Turso for edge-friendly distributed SQLite.
