# Protocol Attestation

> community-issued verifiable verdicts

## Overview

Protocol Attestation is a product-focused fork of **proof-of-knowledge**, preserving the protocol-scoped verdict model while evolving the language, UX, and market positioning.

### What is Protocol Attestation?

Protocol Attestation is a decentralized verification ecosystem that transforms public information into validated knowledge with confirmed credibility. The system produces **attestations** — cryptographically signed statements from validators that objects conform to a specific community protocol.

### Terminology Framework

| Layer | Term | Description |
|-------|------|-------------|
| System | **Attestation** | Technical output: a signed record that an object meets the criteria defined by a community protocol |
| Community | **Verdict** | The meaningful interpretation of an attestation: "the community has verified that this object conforms to protocol X" |
| Human-facing | **Проверено по протоколу** | User-visible badge indicating that an attestation exists and is readable |

**Important distinction**: Protocol Attestation does **not** claim universal truth. It issues **protocol-scoped community verdicts** — statements valid within a specific community's rules and context, not absolute fact.

## Key Features

- **Protocol-scoped validation**: Verdict is always relative to a specific community's protocol, not universal
- **Community governance**: Each community defines its own validation rules and elects validators
- **Cryptographic attestations**: Signed records stored on-chain for transparency and verifiability
- **Multi-validator consensus**: Multiple validators independently assess claims before finalizing verdicts

## Quick Links

- [Russian documentation (Полная документация на русском)](README.ru.md)
- [MVP Scope & Semantic Framework](docs/mvp-scope.md)

## Architecture Overview

The system involves four key roles:
- **Applicant** — submits objects and claims for attestation
- **Validator** — verifies claims according to published community protocols
- **Community** — defines protocols, admits validators, stores decision history
- **Observer** — monitors statuses and attestation history without participation in decisions

## Legacy Reference

This project originates from **proof-of-knowledge (PoK)** as a product-focused fork. While the technical codebase retains legacy naming, the documentation and brand positioning now reflect the Protocol Attestation paradigm.

---

*License: CC BY-SA*  
*See also: [docs/mvp-scope.md](docs/mvp-scope.md) for detailed semantic specification*
