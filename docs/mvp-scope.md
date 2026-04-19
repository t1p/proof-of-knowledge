# Protocol Attestation — MVP Scope & Semantic Framework

> Version: 0.2  
> Date: 2026-04-19 (UTC)  
> Status: Canonical semantic document for Protocol Attestation paradigm

---

## Lineage

This document describes the MVP semantics for **Protocol Attestation**, a product-focused fork of **proof-of-knowledge (PoK)**. The technical architecture remains compatible with the original PoK design; terminology has been updated to reflect the new brand positioning.

> **Legacy reference**: The current codebase retains `proof-of-knowledge` naming in contracts and code. This documentation establishes the new terminology framework for future migration.

---

## Core Semantic Model

### What is an Attestation?

An **attestation** is the system's technical output: a cryptographically signed record stating that an object conforms to a specific community protocol.

**Format**: `attestation(object, claim_list, protocol_id, community_id, validator_signatures)`

### What is a Verdict?

A **verdict** is the meaningful interpretation of an attestation by the community. It answers: *"Has the community verified that this object meets its protocol rules?"*

| Attestation | → | Verdict |
|-------------|---|---------|
| Technical signed record | → | Human/community-readable statement |
| Cryptographic proof | → | Protocol-scoped conclusion |
| "Object X conforms to protocol Y" | → | "Community Z has verified: [result]" |

**Critical distinction**: A verdict is **never** a claim of universal truth. It is always a **protocol-scoped community verdict** — valid within the rules of a specific community, not absolute fact.

---

## Terminology Alignment

| Term | PoK Legacy | Protocol Attestation | Usage |
|------|------------|----------------------|-------|
| Валидация | Validation | Attestation | System-level output |
| Проверка | Verification | Verdict | Community-level interpretation |
| Статус | Status | Проверено по протоколу | Human-facing badge |
| Результат | Result | Verdict (positive/negative) | Final outcome |

---

## Pilot Domain (MVP — Fixed)

**One domain for MVP**: documents/statements and public claims in the MTL/Montelibero ecosystem.

*Reason for fixation*: No other pilot domain is more clearly prioritized in the current repository context.

---

## Attestation Unit

- **Object**: Any artifact (text, document, page, dataset, media snapshot, etc.)
- **Claim list**: Explicit list of claims being attested
- **Verdict formation**: Based on claim list within the community's chosen protocol

---

## MVP Roles

| Role | Description |
|------|-------------|
| **Applicant** | Submits object + claim list for attestation |
| **Validator** | Verifies claims against published community protocol and issues attestation |
| **Community** | Defines protocol/rules, admits validators, stores history of verdicts |
| **Observer** | Monitors statuses and attestation history without participation in decisions |

---

## Minimal Happy Path (6 Steps)

1. Create a community
2. Publish the community's attestation protocol
3. Validator joins the community
4. Applicant submits request (object + claim list)
5. Validator(s) attest to the request per protocol
6. Finalize verdict with conformance/non-conformance status

---

## Anti-Spam / Anti-Collusion (MVP Level)

- **Deposit/fee**: Attestation request and participation require minimal economic threshold to reduce spam
- **Disputes-lite**: Simplified challenge mechanism with **challenge deposit** for disputing questionable finalizations
- **MVP-level sanctions**: Freeze / slash / exile upon confirmed abuse, without complex judicial procedure

---

## MVP Metrics & Gate Thresholds ("MVP Success")

| Metric | Threshold |
|--------|-----------|
| **Cycle time** (median "request → final") | < 72 hours |
| **Completion rate** | > 70% |
| **Dispute rate** | Measured, no threshold for MVP |
| **Validator retention** | ≥ 50% validators completed ≥ 5 attestations |
| **User value** | Average usefulness rating ≥ 4/5 |

---

## Out of Scope for MVP

- Default "atomic" semantics for all domains
- Complex expert weights/ratings and multi-factor trust models
- Advanced tokenomics and economic loops
- Full-featured appeals/multi-stage arbitration
- Claim of "universal truth" outside specific community protocol
- Production-level KYC

---

## References

- Full documentation (Russian): [`README.ru.md`](README.ru.md)
- Entry point (English): [`README.md`](README.md)
- Legacy data specification: [`docs/data.txt`](docs/data.txt) *(note: equivalent to expected `docs/data.md`)*

---

*This document serves as the canonical semantic reference for the Protocol Attestation framework. All other documentation should align with the terminology established here.*
