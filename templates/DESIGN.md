# Design System & Visual Direction

This document is the canonical source of truth for the project's visual identity, design tokens, and surface ergonomics. It applies to all user-facing interfaces in this repository.

Implementation rules, motion performance constraints, and verification procedures are governed normatively by `docs/04-standards/ui-quality.md`.

---

## 1. Product Identity & Character

- **Core Personality:** (e.g., "Crisp, focused, and quiet utility" / "Bold, confident, and editorial" / "Warm, accessible, and playful")
- **Brand Keywords:** `[keyword-1]`, `[keyword-2]`, `[keyword-3]`
- **Design Philosophy:**
  - Value clarity over decorative fluff;
  - Every visual element must serve understanding, action, confidence, or distinct identity;
  - Avoid generic "AI-slop" or unstyled template defaults.

---

## 2. Surface Modes & Context

Apply the visual system according to the surface's primary job:

| Mode | Surface Type | Primary Objective | Visual & Motion Guidance |
|---|---|---|---|
| **Persuade** | Marketing, Landing, Pricing | Convince and convert; design is front-and-center | Expressive typography, high brand identity, purposeful motion |
| **Operate** | App UI, Dashboards, Settings, Tools | Rapid task execution; scanability and low friction | High scannability, compact chunking, subtle utility motion |
| **Read** | Documentation, Articles, Knowledge | Comprehension and focus; text is the product | Clear hierarchy, comfortable line length, readable code/tables |
| **Experience** | Showcase, Portfolios, Interactive Demos | Brand immersion and craft | Distinct visual styling; user retains full navigation control |

---

## 3. Design Foundations & Tokens

### 3.1 Typography
- **Heading / Display Font:** `[Font Family]` (e.g., Cabinet Grotesk, Plus Jakarta Sans, Inter Display) — used for major headings to establish character.
- **Body / Interface Font:** `[Font Family]` (e.g., Inter, system-ui) — optimized for legibility at small sizes (12–16px).
- **Code / Monospace Font:** `[Font Family]` (e.g., JetBrains Mono, Fira Code) — for tabular numbers, IDs, and code blocks.
- **Scale & Rhythm:**
  - Maintain clear typographic hierarchy (`h1` through `h4`, body, caption);
  - Respect Vietnamese diacritics, word wraps, and vertical line-height spacing.

### 3.2 Semantic Color Roles
Avoid arbitrary hex values in components; map all colors to semantic roles:
- **Primary / Brand:** `[Color or CSS Variable]` — dominant brand expression.
- **Accent / Focus:** `[Color or CSS Variable]` — reserved strictly for key actions, selections, and primary interactive highlights. Do not use as background noise.
- **Surface / Background:** `[Canvas, Card, Elevated, Border, Divider]`.
- **Feedback & Status:**
  - `Success`: `[Color]`
  - `Warning`: `[Color]`
  - `Danger`: `[Color]`
  - `Info`: `[Color]`

### 3.3 Geometry & Elevation
- **Border Radius Scale:**
  - Controls & Buttons: `[e.g., 6px]`
  - Cards & Containers: `[e.g., 12px]`
  - Modals & Drawers: `[e.g., 16px]`
- **Spacing Rhythm:** Base-4 or Base-8 scale (`4px`, `8px`, `12px`, `16px`, `24px`, `32px`, `48px`).
- **Elevation:** Clean borders (`1px solid var(--border)`) preferred over heavy, muddy box-shadows.

### 3.4 Iconography & Imagery
- **Approved Icon Library:** `[e.g., Lucide React / Heroicons / Phosphor Icons]`
- **Icon Rules:**
  - MUST use a single unified icon family across the entire application;
  - MUST NOT mix mismatched icon stroke widths, styles, or random SVGs;
  - MUST NOT use loose emojis as interactive controls or status badges;
  - Ambiguous actions MUST be accompanied by a visible label.
- **Imagery & Illustration:** Purposeful diagrams or spot illustrations only; avoid generic 3D stock figures.

---

## 4. Component System & Implementation Sources

- **Token Definitions:** `[Path to CSS variables, Tailwind config, or theme file]`
- **Primitive Components:** `[Path to UI component folder, e.g., src/components/ui/]`
- **Design System Tooling / Upstream:** `[e.g., Radix UI, Shadcn UI base, Headless UI]`
- **Figma / Design Source (if applicable):** `[Link to approved Figma file, version, or frames]`

---

## 5. Visual Benchmarks & Boundaries

- **Approved References:**
  - *Reference 1:* `[URL or Screenshot]` — What to emulate: (e.g., calm contrast, clean data grid).
- **Anti-References:**
  - What to avoid: (e.g., gratuitous gradients, unneeded badge clutter, low-contrast gray text on gray cards).
