---
version: alpha
name: product-design-system
description: "A production-grade, token-driven design system document defining visual identity, surface hierarchy, and UI ergonomics. Built for human developers and AI coding agents to produce consistent, high-craft interfaces without visual genericness or 'AI-slop'."

colors:
  primary: "#6366f1"
  on-primary: "#ffffff"
  primary-hover: "#4f46e5"
  primary-focus: "#4338ca"
  ink: "#f8fafc"
  ink-muted: "#cbd5e1"
  ink-subtle: "#94a3b8"
  ink-tertiary: "#64748b"
  canvas: "#090d16"
  surface-1: "#0f172a"
  surface-2: "#1e293b"
  surface-3: "#334155"
  hairline: "#1e293b"
  hairline-strong: "#334155"
  hairline-focus: "#6366f1"
  semantic-success: "#10b981"
  semantic-warning: "#f59e0b"
  semantic-danger: "#ef4444"
  semantic-info: "#3b82f6"

typography:
  display-xl:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 56px
    fontWeight: 600
    lineHeight: 1.08
    letterSpacing: -2.0px
  display-lg:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 40px
    fontWeight: 600
    lineHeight: 1.15
    letterSpacing: -1.2px
  headline:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 28px
    fontWeight: 600
    lineHeight: 1.25
    letterSpacing: -0.6px
  card-title:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 20px
    fontWeight: 500
    lineHeight: 1.30
    letterSpacing: -0.3px
  body-lg:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 18px
    fontWeight: 400
    lineHeight: 1.50
    letterSpacing: -0.1px
  body:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.50
    letterSpacing: -0.05px
  body-sm:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.50
    letterSpacing: 0
  caption:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.40
    letterSpacing: 0
  button:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.20
    letterSpacing: 0
  eyebrow:
    fontFamily: "Inter, system-ui, -apple-system, sans-serif"
    fontSize: 12px
    fontWeight: 600
    lineHeight: 1.30
    letterSpacing: 0.5px
  mono:
    fontFamily: "JetBrains Mono, ui-monospace, SFMono-Regular, monospace"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.50
    letterSpacing: 0

rounded:
  xs: 4px
  sm: 6px
  md: 8px
  lg: 12px
  xl: 16px
  pill: 9999px
  full: 9999px

spacing:
  xxs: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  section: 80px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "8px 16px"
  button-primary-hover:
    backgroundColor: "{colors.primary-hover}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
  button-secondary:
    backgroundColor: "{colors.surface-1}"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "8px 16px"
    border: "1px solid {colors.hairline}"
  button-tertiary:
    backgroundColor: "transparent"
    textColor: "{colors.ink-muted}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: "8px 12px"
  card:
    backgroundColor: "{colors.surface-1}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.lg}"
    padding: "24px"
    border: "1px solid {colors.hairline}"
  card-featured:
    backgroundColor: "{colors.surface-2}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.lg}"
    padding: "24px"
    border: "1px solid {colors.hairline-strong}"
  text-input:
    backgroundColor: "{colors.surface-1}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.md}"
    padding: "8px 12px"
    border: "1px solid {colors.hairline}"
  text-input-focused:
    backgroundColor: "{colors.surface-1}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.md}"
    padding: "8px 12px"
    border: "1px solid {colors.hairline-focus}"
  status-badge:
    backgroundColor: "{colors.surface-2}"
    textColor: "{colors.ink-muted}"
    typography: "{typography.caption}"
    rounded: "{rounded.pill}"
    padding: "2px 8px"
  top-nav:
    height: "56px"
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.body-sm}"
    border: "1px solid {colors.hairline}"
---

# Design System & Visual Direction

This document is the canonical source of truth for the project's visual identity, design tokens, and surface ergonomics. It follows the Google Stitch / `DESIGN.md` plain-text specification for AI coding agents and human developers.

Implementation rules, motion performance constraints, and verification procedures are governed normatively by `docs/04-standards/ui-quality.md`.

---

## 1. Overview & Visual Identity

- **Core Personality:** Crisp, intentional, and quiet utility. Every element has a clear role in helping the user understand, decide, or act.
- **Brand Keywords:** `focused`, `crisp`, `effortless`, `deliberate`.
- **Single Chromatic Accent:** The primary accent `{colors.primary}` is treated as scarce. It is reserved for key action points, primary interactive highlights, and focused inputs. It MUST NEVER be used as a large background wash or decorative distraction.
- **Rhythm & Visual Focus:** Page rhythm is driven by functional data panels and actual UI components framed in clean surfaces, not by decorative gradients or filler illustrations.

---

## 2. Surface Modes & Context

Apply the visual system according to the primary job of the surface:

| Mode | Surface Type | Primary Objective | Visual & Motion Guidance |
|---|---|---|---|
| **Persuade** | Marketing, Landing, Pricing | Convince and convert; value proposition leads | Expressive typography, distinct brand accent, purposeful demo motion |
| **Operate** | App UI, Dashboards, Settings, Tools | Rapid task execution; scanability and low friction | High scannability, compact chunking, subtle utility motion (<200ms) |
| **Read** | Documentation, Articles, Knowledge | Comprehension and focus; text is the product | Clear typographic hierarchy, comfortable line lengths (60–75ch), readable tables |
| **Experience** | Showcase, Portfolios, Interactive Demos | Brand immersion and craft | Distinct visual styling; user retains full navigation control (no scroll-hijack) |

---

## 3. Surface Ladder & Depth Architecture

Depth is constructed through a **Surface Ladder** and crisp **hairline borders (1px)**, avoiding muddy, heavy box-shadows.

| Level | Surface Token | Border Treatment | Typical Usage |
|---|---|---|---|
| **0 (Canvas)** | `{colors.canvas}` | None | Base page background, canvas backdrop |
| **1 (Surface 1)** | `{colors.surface-1}` | 1px solid `{colors.hairline}` | Standard cards, panels, inputs, secondary buttons |
| **2 (Surface 2)** | `{colors.surface-2}` | 1px solid `{colors.hairline-strong}` | Featured cards, hovered surfaces, dropdowns, status pills |
| **3 (Surface 3)** | `{colors.surface-3}` | 1px solid `{colors.hairline-strong}` | Modals, elevated dialogs, tooltips |
| **Focus Lift** | Active Surface | 1px solid `{colors.hairline-focus}` | Focused interactive controls (inputs, buttons) |

---

## 4. Typography System & Rules

### Hierarchy Scale

| Token | Size | Weight | Line Height | Letter Spacing | Primary Use |
|---|---|---|---|---|---|
| `{typography.display-xl}` | 56px | 600 | 1.08 | -2.0px | Hero headlines |
| `{typography.display-lg}` | 40px | 600 | 1.15 | -1.2px | Major section openers |
| `{typography.headline}` | 28px | 600 | 1.25 | -0.6px | Section subheads, modal titles |
| `{typography.card-title}` | 20px | 500 | 1.30 | -0.3px | Card titles, widget headers |
| `{typography.body-lg}` | 18px | 400 | 1.50 | -0.1px | Hero lead paragraphs, intro text |
| `{typography.body}` | 16px | 400 | 1.50 | -0.05px | Default body copy |
| `{typography.body-sm}` | 14px | 400 | 1.50 | 0 | Secondary descriptions, table cells |
| `{typography.button}` | 14px | 500 | 1.20 | 0 | All interactive button labels |
| `{typography.caption}` | 12px | 400 | 1.40 | 0 | Timestamps, metadata, footnotes |
| `{typography.eyebrow}` | 12px | 600 | 1.30 | +0.5px | Uppercase section taglines |
| `{typography.mono}` | 13px | 400 | 1.50 | 0 | Code, IDs, hashes, numerical metrics |

### Typographic Principles
- **Display Tracking:** Large headings use negative letter-spacing to maintain optical density.
- **Eyebrow Tracking:** Eyebrows use positive letter-spacing (`+0.5px`) with uppercase text to clearly signal taxonomy.
- **Language Support:** Font stacks must render Vietnamese diacritics cleanly without clipped accents or font-fallback mismatches.
- **Recommended Open-Source Fonts:**
  - *Display / Headings:* `Cabinet Grotesk`, `Plus Jakarta Sans`, `Geist Sans`, or `Inter`.
  - *Body / Interface:* `Inter` or `Geist Sans`.
  - *Monospace:* `JetBrains Mono` or `Geist Mono`.

---

## 5. Iconography & Media Guidelines

- **Single Icon Family:** All icons MUST come from a single unified library (e.g., `lucide-react`, `heroicons`, or `phosphor-icons`).
- **Icon Rules:**
  - MUST maintain consistent stroke width (default: 1.5px or 2px across all icons);
  - MUST NOT mix mismatched icon styles (e.g., mixing filled icons with thin outline icons);
  - MUST NOT use loose emojis as interactive controls, buttons, or status badges;
  - Ambiguous actions MUST always be accompanied by visible text or accessible aria-labels.
- **Illustrations:** Use subtle, purposeful vector spots or structural diagrams. Avoid generic 3D corporate stock illustrations.

---

## 6. Do's and Don'ts (Strict Guardrails for Agents)

### DO:
- **DO** use the Surface Ladder (`canvas` → `surface-1` → `surface-2` → `surface-3`) to express depth.
- **DO** treat `{colors.primary}` as scarce: restrict to primary CTAs, focus rings, and key active states.
- **DO** frame cards with 1px hairline borders (`{colors.hairline}`).
- **DO** pair bold/semi-bold headings with regular weight (400) body copy.
- **DO** implement complete UI states: Loading skeleton, Empty with CTA, Error with recovery, and Success.
- **DO** ensure all touch targets are at least 44×44px on mobile viewports.

### DON'T:
- **DON'T** introduce arbitrary hex colors outside the defined tokens.
- **DON'T** use `{colors.primary}` as a full section background or card fill.
- **DON'T** add decorative atmospheric gradients, glowing borders, or unprompted blur cards.
- **DON'T** use heavy, muddy drop shadows (`box-shadow: 0 10px 30px rgba(0,0,0,0.5)`) on dark surfaces.
- **DON'T** pill-round standard cards or form inputs; reserve `{rounded.pill}` strictly for status badges and segmented tab pills.
- **DON'T** hide critical labels or error messages behind tooltips just to make the screen look "cleaner".

---

## 7. Responsive Behavior & Touch Ergonomics

### Breakpoints

| Name | Breakpoint | Grid & Layout Strategy |
|---|---|---|
| **Desktop-XL** | ≥1440px | Max content width 1280px; 3-column / 4-column grids |
| **Desktop** | ≥1024px | Standard 3-column grid; full desktop navigation |
| **Tablet** | ≥768px | 2-column grid; compact navigation |
| **Mobile** | <768px | Single-column stack; sticky bottom action bar or hamburger navigation |

### Collapsing & Interaction Strategy
- **Display Typography:** On mobile screens (<768px), `{typography.display-xl}` collapses to `{typography.display-lg}` (40px) to prevent awkward word breaks.
- **Touch Targets:** Buttons and interactive touch points expand to minimum 44px height on touch viewports.
- **Tables & Dense Data:** Wrap horizontally with sticky first column or collapse into mobile card rows.

---

## 8. Agent Iteration Guide

When creating or modifying a UI component or page:

1. **Check the Mode:** Identify whether the surface is *Persuade*, *Operate*, *Read*, or *Experience*.
2. **Assign the Surface Level:** Place standard cards on `{colors.surface-1}`, featured/lifted elements on `{colors.surface-2}`.
3. **Reference Exact Tokens:** Use token names (`{colors.primary}`, `{typography.body}`, `{rounded.md}`, `{spacing.md}`).
4. **Follow Do's and Don'ts:** Double-check that no unauthorized gradients, loose emojis, or unstyled pills were introduced.
5. **Verify Normative Quality:** Check against [docs/04-standards/ui-quality.md](docs/04-standards/ui-quality.md) (non-blocking motion, keyboard a11y, contrast).
6. **Linter Check:** Run `npx @google/design.md lint DESIGN.md` when tooling is available to verify token references.

---

## 9. Known Gaps & Specifics

- **Theme Polarity:** This template defaults to a focused dark canvas (`#090d16`). When adapting for a light-first product, invert the polarity (`canvas: #ffffff`, `surface-1: #f8fafc`, `hairline: #e2e8f0`, `ink: #0f172a`).
- **Data Visualizations:** Specialized chart and visualization palettes (categorical, diverging, sequential) are defined as domain extensions when required by product specifications.
