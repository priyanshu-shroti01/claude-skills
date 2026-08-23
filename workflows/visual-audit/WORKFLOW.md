# Workflow: Visual Audit

**Trigger**: scheduled sweep, post-change verification, "something looks
off", or pre-release. **Lead**: visual-qa-agent, with design-director and
anti-slop-agent on judgment calls.

## Stages

1. **Scope** — full site or changed surfaces + blast radius (graph).
   Release candidates always get the full matrix.
2. **Capture** — the visual-qa skill's matrix: viewports (320→1920) ×
   states (default/hover/focus/loading/empty/error/success/filled) ×
   pages. Real rendering; states forced deliberately; captures named and
   organized.
3. **Mechanical inspection** — visual-qa-agent works the checklist per
   capture: overflow, clipping, broken grids, unstyled elements, missing
   media, contrast-over-imagery, focus visibility, touch crowding.
   Interactive sweeps: tab-through, hover, invalid submissions.
4. **Fidelity pass** — captures vs. the visual spec / DESIGN.md tokens;
   deviations listed factually (design-director rules on intent).
5. **Judgment pass** — design-director (design-review skill) on
   hierarchy/consistency/composition; anti-slop-agent if the surface
   smells generic.
6. **Report** — `page | viewport | state | element | issue | screenshot |
   severity`; clean cells reported as coverage. Blockers (broken money
   path rendering) flagged immediately.
7. **Fix & re-verify** — owners fix; visual-qa re-captures the affected
   cells; design gates re-run where judgment findings existed.

## Rules

- Cross-browser (Chromium/Firefox/WebKit) on release candidates.
- No verdicts on unexamined screenshots — coverage claimed is coverage
  shown.
