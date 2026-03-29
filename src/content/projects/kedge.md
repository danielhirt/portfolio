---
title: "kedge"
description: "A Rust CLI that detects when code changes make docs stale, then invokes AI agents to fix them."
tags: ["Rust", "CLI", "AI", "tree-sitter", "DevTools"]
github: "https://github.com/danielhirt/kedge"
featured: true
order: 1
---

## Overview

kedge detects documentation drift. It compares AST fingerprints of code against provenance markers stored in doc frontmatter. When fingerprints diverge, the docs are stale. An AI triage step classifies each drifted anchor as `no_update`, `minor`, or `major`, and kedge invokes an external agent to update the prose and open a merge request.

## How It Works

1. **Detection** parses code with tree-sitter and computes structural fingerprints that ignore whitespace and comments. A renamed variable triggers drift; a reformatted file does not.
2. **Triage** sends each drifted anchor to an LLM for severity classification. An internal refactor is `no_update`. A new required parameter is `major`.
3. **Remediation** invokes an agent process for `minor`/`major` docs. kedge advances provenance for `no_update` anchors without touching the prose.

## Technical Details

- **Language**: Rust
- **AST Parsing**: tree-sitter grammars for Java, Go, TypeScript/TSX, Python, Rust, and XML
- **Fingerprinting**: Symbol-scoped SHA-256 over AST node kinds and identifiers, truncated to 64-bit `sig:` values
- **Triage Providers**: Anthropic, OpenAI, shell command, or skip entirely
- **Agent Contract**: JSON over stdin/stdout with configurable timeout
- **CI Integration**: GitHub Actions and GitLab CI guides, with `--no-stamp` for two-repo workflows

## Design Decisions

**Content-addressed provenance.** Storing a structural fingerprint instead of a git SHA means detection works without git history. Rebases and shallow clones don't break anything.

**Two-repo model.** Code and docs live in separate repositories. kedge bridges them through frontmatter anchors that point from doc files into code locations. `kedge install` distributes steering files to agent workspace directories.

**Three-layer pipeline.** Splitting detection (deterministic), triage (cheap AI), and remediation (expensive agent) keeps costs proportional to actual drift severity. Most anchors end up as `no_update` and never reach the agent.

## Why I Built This

Documentation goes stale without automated checks. Stale docs mislead more than missing docs. I built kedge to connect code changes to doc updates: detection finds drift, triage filters noise, and an agent handles the fix.
