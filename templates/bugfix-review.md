# Bugfix and Review Standard

This standard applies to bug fixes, review remediation and review of the affected behavior. Humans and agents use the same evidence requirements, scaled to risk. Small prose changes need document checks, not a transaction test matrix. Work scope, approvals, findings and run evidence stay in Issues/PRs.

## 1. Establish the behavior before editing

Identify and record:

- **Expected behavior and authority:** the accepted requirement, domain rule, API contract or owner decision, with its version/reference. Source and tests show implementation reality; they do not silently settle conflicting requirements. Keep missing business decisions open for the owner and continue independent authorized work.
- **Root cause:** reproduce the failure and explain the causal path, including the first incorrect state change or side effect. A failing status code alone is a symptom.
- **Callers and impact:** trace callers, entry points, workers/callbacks, shared helpers and contracts; identify affected tests, fixtures, configuration and documentation. Fix the shared cause where appropriate, within approved scope.
- **Invariants:** name what must remain true for stored state, valid transitions, authorization, ownership and side effects. For stateful behavior, use the existing domain source to describe `before → event/precondition → after`, failure and recovery. Add a focused transition table there only when needed; do not invent a second domain owner.

Proceed when the expected result, cause, impact and preservation conditions are explicit enough to test. Escalate material scope, contract or architecture changes for approval.

## 2. Prove the regression, then fix

Before the implementation change, add or reuse a focused regression test and run it against the unfixed revision. Confirm it fails for the reported behavior, rather than a broken fixture, missing dependency or unrelated exception. Preserve the command, revision, test change and failure output. Use an isolated checkout when replaying an older revision; preserve other work.

Make the smallest complete fix, run the same test to green, and run relevant existing checks for affected callers and flows. Assertions must inspect the returned result, persisted state and externally visible side effects where applicable, including what must remain unchanged on failure. A response code or mock call alone does not prove the operation is correct.

Choose additional cases from the actual risk:

| Risk | Evidence to inspect |
|---|---|
| Partial failure | Failure between writes or before an external effect; consistent stored state and a defined recovery path |
| Retry or repeated delivery | Retry after failure succeeds; duplicate requests/events preserve identity and do not repeat effects; distinct transactions are not mistaken for duplicates |
| Authorization/ownership | Unauthenticated, wrong-role and wrong-owner requests fail without state changes or data exposure |
| Expiry (TTL) | Boundary time, expiry cleanup, stale references and late callbacks; use controlled time rather than waiting |
| Concurrency | Overlapping requests, contention and the actual atomicity/uniqueness boundary; in-process sequential tests do not prove multi-process safety |

Mark each relevant risk as checked, not applicable with a reason, or unverified with the limitation. Restore test environment, clock and doubles after failure as well as success. Use real persistence/concurrency checks when that is the claim; fixtures or in-memory stores establish only their tested boundary. Call real providers only with authorization.

If a failing baseline cannot be reproduced, report that gap and investigate; do not describe the regression as proven or close the finding as verified.

## 3. Implementer self-check and reviewer check

Before handoff, the implementer reads the complete affected flow, checks the original failure and adjacent branches against the invariants, and inspects the final diff for consequences outside the edited lines. Report commands, actual results and remaining gaps.

The reviewer independently traces that flow and its callers, verifies the original finding, and looks for regressions introduced by the fix. Review tests for missing state/side-effect assertions and review documentation against the implementation. Do not stop at matching the old finding to a changed line, or require a quota of new findings.

Classify each new finding as an unresolved original defect, a regression from the fix, or previously existing behavior newly discovered. A missing business decision is a separate owner question, not an invented defect or new acceptance criterion.

**After two fix/review rounds expose the same defect family, pause further patches in that family.** Re-examine the state model, invariant, root cause, shared callers and failure boundary; record the revised explanation and test strategy before a third patch. Seek approval if the correction changes scope or architecture. Continue unrelated approved work.

## 4. Close findings at the tested revision

Use this compact record in the Issue/PR:

```text
Finding and classification:
Expected behavior / accepted source and version:
Root cause / callers / invariants / impact:
Before fix: base SHA + regression test diff/reference, command, observed failure:
Fix: diff and full commit SHA:
After fix: full tested SHA, command, actual result and evidence link:
Related risks checked / not applicable / unverified and why:
Reviewer conclusion / remaining limits / owner decisions still open:
```

Close a finding as verified only when its required evidence is tied to the exact reviewed commit SHA. If testing uses an uncommitted diff, label that evidence provisional and rerun the required checks on the committed revision before verified closure. On a later change, revalidate evidence affected by that change; an earlier green run is not proof for a new SHA.

Report these separately: code implemented, automated tests passed, runtime observed, owner acceptance, merged, and deployed. One does not imply the next. Missing runtime access remains an explicit gap; reviewer approval does not grant merge/deploy authority.

## 5. Keep contracts and documents aligned

Update the existing owner of any changed behavior together with the code: API request/response/error and authorization contracts, schemas/types, examples, domain transitions and recovery guidance as affected. Check consumers and contract tests where applicable. If code contradicts an accepted contract, surface the discrepancy and resolve it within the approved decision; do not rewrite the contract merely to match a bug.

Keep undecided product rules explicitly open, with the question and decision owner. Preserve the distinction between current implementation, proposed behavior and accepted behavior. Promote only reusable, verified closeout knowledge to its existing durable owner; historical logs and task state remain linked from the Issue/PR.

## 6. Verify adoption separately from compliance

Repository integrity checks establish file distribution, routing and link validity. They do not establish that an agent loaded this standard or followed it.

For a behavioral trial, use a fresh session and an isolated fixture with a verifiable defect. Give the task and normal repository entrypoint without coaching the solution. Observe the implementation and independent review, including red/green evidence and a related risk branch the reviewer chooses. Retain the inputs, source revision, session/tool identity, outputs and scoring limits in the Issue/PR evidence. Report each agent separately; an unavailable session is unverified. A small trial does not establish general reliability or a reduction in review rounds.
