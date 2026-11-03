# Interface Direction

Use this document to define product-specific visual identity, brand personality, and UI foundations.

While `docs/04-standards/ui-quality.md` defines general implementation quality rules, this document specifies **what this specific product looks and feels like**.

---

## 1. Product Identity & Personality

- **Core Character / Tone:** (e.g., "Professional & trust-inspiring", "Playful & energetic", "Minimal & academic")
- **3–5 Brand Keywords:** (e.g., `focused`, `crisp`, `effortless`, `reliable`)
- **Visual Expression Level:** (e.g., High brand expression for landing pages; quiet, high-density utility for data views)

---

## 2. Target Users & Priority Tasks

| Persona / User Role | Primary Device(s) | Top 1–3 Priority Tasks |
|---|---|---|
| (e.g., Operations Manager) | Desktop (1920×1080) | 1. Review daily anomalies; 2. Approve invoices; 3. Export reports |
| (e.g., Field Technician) | Mobile (390×844) | 1. Check assigned ticket; 2. Upload status photo; 3. Sign off |

---

## 3. Screen Purpose Classification

Map key screens to their primary purpose to guide appropriate density and motion:

- **Marketing / Landing:** (e.g., `/`, `/pricing`)
- **Application / Workspace:** (e.g., `/dashboard`, `/settings`, `/editor`)
- **Content / Documentation:** (e.g., `/docs`, `/blog`)
- **Portfolio / Experience:** (e.g., `/case-studies`, `/showcase`)

---

## 4. Design Foundations & Tokens

### 4.1 Typography
- **Display / Heading Font:** `[Font Name]` (e.g., Cabinet Grotesk, Inter, Plus Jakarta Sans) — role: character and hierarchy.
- **Body / Interface Font:** `[Font Name]` (e.g., Inter, system font stack) — role: high legibility at 12–16px.
- **Code / Monospace Font:** `[Font Name]` (if applicable).

### 4.2 Semantic Color Roles
- **Primary / Brand:** `[Color or CSS Token]`
- **Accent / Focus:** `[Color or CSS Token]` (used sparingly for key CTAs and highlights)
- **Neutral / Surface:** `[Background, Card, Border, Muted colors]`
- **Feedback:** `success`, `warning`, `danger`, `info`

### 4.3 Geometry & Rhythm
- **Border Radius:** (e.g., 6px for controls, 12px for cards / containers)
- **Spacing Increment:** (e.g., 4px baseline, 8px layout rhythm)
- **Elevation / Shadows:** (e.g., flat borders with subtle 1px border highlight; soft low-blur shadow)

### 4.4 Icon & Media Family
- **Approved Icon Library:** (e.g., `lucide-react` / `heroicons` / `phosphor-icons`)
- **Icon Style:** (e.g., 1.5px stroke outline, 20px default size)
- **Illustration Style:** (e.g., subtle monochrome vector spots; no generic 3D stock figures)

---

## 5. Canonical Sources & References

- **Token Implementation Source:** (e.g., `src/styles/tokens.css`, `tailwind.config.ts`, or theme object)
- **Component Source / System:** (e.g., `src/components/ui/`, Radix UI, Headless UI)
- **Figma / Design Source (if any):** Link to approved Figma file, version, or frames.
- **Approved Visual References:**
  - *Reference A:* (Link/Screenshot) — What to learn from it: (e.g., clear table hierarchy, calm contrast).
  - *Anti-Reference B:* What to avoid: (e.g., excessive animated cards, low-contrast gray text).
