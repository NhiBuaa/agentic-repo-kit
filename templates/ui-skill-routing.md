# UI Skill Routing & Governance

This scoped rule governs how AI coding agents select and execute UI/UX-related skills in this repository.

**Core Invariant:** All UI implementations MUST adhere strictly to the visual identity in root `DESIGN.md` and the normative quality standards in `docs/04-standards/ui-quality.md`. Skills are execution aids; they NEVER override repository design authority.

---

## 1. The 4-Stage UI Execution Matrix

Agents MUST activate skills strictly according to the current stage of UI development. Do NOT stack multiple style or design skills simultaneously.

| Stage | Focus Area | Permitted Skills | Output / Milestone |
|---|---|---|---|
| **1. Layout & Identity** | Visual hierarchy, spacing scale, typographic contrast, component structure, design token adherence. | `impeccable`<br/>*or* `design-taste-frontend` | Structured component layout conforming to `DESIGN.md` tokens; zero "AI-slop" or generic templates. |
| **2. Interaction & Mechanics** | Micro-interactions, spring physics, click/press feedback, dropdowns/modals, non-blocking motion. | `emil-design-eng`<br/>*or* `animate` | High-craft interaction ergonomics, complete states (`Loading`, `Empty`, `Error`, `Success`). |
| **3. Live Verification & a11y** | Rendered DOM inspection, responsive reflow, color contrast, keyboard tab order, touch targets. | `chrome-devtools`<br/>+ `a11y-debugging` | Verified rendered screenshot, a11y audit report, 4-layer evidence matrix fulfillment. |
| **4. Performance Optimization** | GPU composite-only properties (`transform`, `opacity`), layout thrashing prevention, 60/120fps budget. | `animation-performance`<br/>*or* `debug-optimize-lcp` | Verified zero frame drops, Core Web Vitals compliance. |

---

## 2. Invariant Guardrails (Hard Rules)

### 2.1 No Style Stacking (Không cộng dồn phong cách)
- **MUST NOT** activate `design-taste-frontend` and `emil-design-eng` at the same time.
- If both skills seem relevant, resolve by phase: use `design-taste-frontend` first to settle section art direction and layout; close that phase, then use `emil-design-eng` exclusively to polish component interaction physics.

### 2.2 Token Authority (Thẩm quyền Token tối cao)
- Personal taste or stylistic opinions from skill prompts (e.g., Emil Kowalski's personal palette or TasteSkill's curated gallery themes) **MUST NOT** override project colors, typography, border-radius, or surface ladders defined in root `DESIGN.md`.
- If an agent identifies a gap in `DESIGN.md`, propose the token addition explicitly in the PR rather than inventing arbitrary ad-hoc hex codes or CSS values.

### 2.3 Zero Unapproved Dependencies (Không tự kéo thư viện)
- **MUST NOT** install new icon libraries, external fonts, animation packages (e.g., Framer Motion), or CSS frameworks without explicit developer approval in the task Issue.
- Adhere to the existing icon family and styling infrastructure already present in the codebase.

### 2.4 Evidence Before Assertions (Bằng chứng thực tế)
- **MUST NOT** claim "UI looks great", "responsive is clean", or "animation is smooth" based solely on reading code.
- Prior to completing a UI task, agents MUST obtain actual runtime evidence (browser screenshot, Chrome DevTools element inspection, or automated layout/a11y tests) as mandated by `docs/04-standards/ui-quality.md`.
- If browser inspection tools are unavailable in the current environment, the agent MUST explicitly declare which visual/runtime layers remain unverified.
