# UI/UX Quality Standard

These rules are normative for all user-facing interfaces (web, mobile, or desktop) unless superseded by an approved product specification or architectural decision.

## Scope

This Standard governs visual hierarchy, information density, interaction ergonomics, state handling, visual identity, motion performance, and accessibility across all user interface implementations in the project.

---

## 1. Context-Aware Design Principles

UI decisions MUST be driven by the **primary purpose of the screen**, not by rigid generic templates.

| Screen Type | Primary Goal | Design Priority | Motion & Expression |
|---|---|---|---|
| **Marketing / Landing** | Value proposition & conversion | Scannable value, clear next action, high visual identity | Expressive motion, rich imagery/demos, branded rhythm |
| **App / Dashboard** | High-efficiency task execution | Data hierarchy, compact chunking, low friction, controls near data | Subtle, utility-driven motion; zero interaction latency |
| **Content / Documentation** | Reading comprehension & study | Typography, reading rhythm, table of contents, diagrams, code clarity | Minimal motion; text and media are the product |
| **Portfolio / Experience** | Brand immersion & storytelling | Visual showcase, art direction, memorable interaction | High expressive motion, but user retains control (no scroll-jacking) |

---

## 2. Core Normative Rules

### 2.1 Content & Scannability ("Ít nhưng đủ")
- **MUST** prioritize information that helps the user understand where they are, what to do next, what consequence an action has, and how to recover.
- **MUST NOT** strip essential labels, field requirements, or error guidance solely to reduce word count.
- **MUST** apply **progressive disclosure**: place core choices in immediate view; keep advanced/secondary options behind clearly labeled triggers.
- **MUST** chunk related content into clear visual groups with meaningful headings, whitespace, and typographic contrast. Avoid unbroken dense walls of text.

### 2.2 Visual Identity & Brand Cohesion ("Độ nhận dạng")
To prevent bland, generic, or "AI-slop" interfaces:
- **MUST** establish and adhere to the project's design tokens (defined in root `DESIGN.md` or code):
  - **Typography:** Pair an expressive, brand-aligned Heading/Display font with a highly legible Body font.
  - **Color Palette:** Define semantic color roles (`primary`, `neutral`, `surface`, `accent`, `danger`, `warning`, `success`). Accent colors MUST be used with clear intent for key actions/focus, not as decorative clutter.
  - **Geometry & Rhythm:** Maintain consistent border-radius scales, elevation/shadows, and spacing increments (e.g., 4px/8px grid).
- **MUST** use a single, unified icon family (e.g., Lucide, Heroicons, Phosphor).
- **MUST NOT** mix mismatched icon sets, random SVG shapes, or use loose emojis as interactive controls or status indicators.
- **Icons with ambiguous meaning MUST** be accompanied by a visible label or accessible assistive text.

### 2.3 Interaction Cost & Usability
- **MUST** minimize total interaction cost: reduce typing, cognitive effort, and redundant confirmations.
- **MUST** provide smart defaults, inline validation, and clear error recovery paths.
- **MUST** implement complete states for all asynchronous or dynamic components:
  - `Loading`: Skeletons or spinners that preserve layout stability (prevent layout shift).
  - `Empty`: Clear explanation with an immediate call to action (CTA).
  - `Error`: Human-readable explanation and an actionable recovery mechanism (e.g., Retry, Back, or Support link).
  - `Success`: Clear feedback on completed state changes.
  - `Partial / Long Data`: Graceful truncation, wrapping, or overflow handling.
  - `Permission Denied`: Explicit explanation of missing privilege and contact/upgrade path.

### 2.4 Motion Quality & Performance
- **MUST** use motion with clear functional intent: feedback on press, state transitions, container expansion, or spatial orientation.
- **MUST NOT** block user interaction, delay input handling, or force users to wait for an animation to finish before proceeding.
- **Performance Constraint:** Animations MUST prioritize CSS hardware-accelerated, composite-only properties (`opacity`, `transform`).
- **MUST NOT** animate properties that trigger layout re-calculation or paint thrashing (e.g., animating `width`, `height`, `top`, `left`, `margin`, or `padding`) during high-frequency interactions.
- **MUST** respect user accessibility preferences via `@media (prefers-reduced-motion: reduce)` by disabling non-essential motion while preserving functional state changes.

### 2.5 Responsive & Accessible (a11y) Baseline
- **MUST** remain fully responsive across target viewports (mobile, tablet, desktop) without broken overflow or clipped content.
- **MUST** ensure interactive touch targets meet minimum accessible sizes (minimum 44×44px or 48×48px on touch devices).
- **MUST** support full keyboard navigation with visible focus indicators.
- **MUST** meet WCAG 2.2 Level AA contrast requirements for text and interactive controls.
- **MUST** properly support target languages, including Vietnamese diacritics, word wrapping, and dynamic string length expansion.

---

## 3. Required Verification (4-Layer Evidence Matrix)

Claiming "UI is complete" or "UI looks good" requires verifiable evidence across 4 distinct layers:

| Layer | What to Verify | Required Evidence |
|---|---|---|
| **1. Visual** | Layout hierarchy, spacing rhythm, typography, token compliance, and visual identity. | Actual rendered screenshot at target viewport/state (not code reading or assumptions). |
| **2. Usability** | End-to-end task completion, form submissions, empty/loading/error handling, and recovery paths. | Verified walkthrough logs or interactive test run. |
| **3. Motion** | Fluidity, no frame drops during interaction, graceful interruption, and reduced-motion fallback. | Live browser check or interaction capture; reduced-motion CSS inspection. |
| **4. Technical / a11y** | Responsive reflow, keyboard focus order, touch targets, contrast ratios, and semantic HTML/ARIA. | DOM inspection, automated a11y scan report, and keyboard tab-through test. |

> [!NOTE]
> If the current agent environment lacks browser inspection or live rendering capabilities, the agent **MUST explicitly state which visual/runtime layers remain unverified**, rather than claiming full UI acceptance.

---

## 4. Rapid 1-Page Checklist (For PR Reviews & Small Features)

For incremental feature work or fast reviews, verify these 8 checks before merge:

- [ ] **Purpose Check:** Does this UI match the screen type (landing vs dashboard vs docs) in density and tone?
- [ ] **Clarity Check:** Is essential text preserved, dense text chunked, and clutter removed?
- [ ] **Identity Check:** Are approved tokens used (fonts, colors, radius) and is the icon set unified (no loose emojis/random SVGs)?
- [ ] **States Check:** Are Loading, Empty, Error, and Success states implemented and tested?
- [ ] **Interaction Check:** Are redundant clicks or re-inputs eliminated? Are dangerous actions confirmed?
- [ ] **Motion Check:** Is motion fast (<250ms for utility), non-blocking, and composite-only (`opacity`/`transform`)?
- [ ] **A11y Check:** Are focus states visible, contrast sufficient, and keyboard navigation functional?
- [ ] **Evidence Check:** Has the rendered candidate been inspected at the target viewport?
