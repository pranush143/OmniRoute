# Autonomous Platform Blueprint

## Product direction
Evolve the existing OmniRoute gateway and orchestration platform, not a ground-up rewrite. Preserve the current dashboard/layouts, APIs, provider catalog, routing/fallback, quotas, analytics, auth, CLI, Electron desktop, PWA, MCP, A2A, multimodal capabilities, coding-agent integrations, tests and quality gates.

## Dynamic administration and CMS
Keep provider/model catalogs, routing policies, prompt templates, integrations, and feature configuration data-driven, validated, versioned, auditable, and rollback-capable. For full editorial CMS workflows, prefer an optional adapter rather than embedding an unrelated CMS in the gateway. Evaluate self-hostable Directus, Strapi, or Payload only after identifying the actual content workflows, license, maintenance, auth, API, and deployment fit.

## LMS
Treat course, lesson, enrollment, progress, assessment, and learning analytics as an optional LMS integration. Evaluate Moodle or Open edX via documented APIs/webhooks and least-privilege service accounts. Isolate LMS identities and data from gateway credentials and operational data. Do not claim LMS implementation without a working adapter and integration tests.

## Headless browser and developer tools
Reuse existing Playwright dependencies and E2E scripts. Support isolated headless Chromium for deterministic smoke tests, screenshots, accessibility checks, and authorized workflows. Use Chrome DevTools Protocol for debugging, tracing, console/network diagnostics, and performance profiling where useful. Sessions must be time-bounded, logged, permissioned, and isolated from personal/production browser profiles. Never bypass CAPTCHAs, paywalls, access controls, or rate limits.

## Open-source agent ecosystem
Build adapters over existing provider/protocol abstractions, not a hard dependency on one framework. Evaluate OpenHands, Open Interpreter, OpenCode, Aider, Continue, Cline, Roo Code, LangGraph, CrewAI, and AutoGen based on actual compatibility and maintenance. Prefer current MCP/A2A implementations; add no duplicate servers without a demonstrated gap. Every tool needs capability declarations, least-privilege permissions, timeouts, resource limits, audit events, and a disable switch.

## Handover to multiple AI assistants
Use repository-level AGENTS.md as canonical shared instructions. Maintain task state, architecture notes, setup/test commands, environment variable docs, evidence, and rollback instructions. Agents should continue safe independent work without repeated discovery prompts. Stop for user-only authorization, secrets, paid operations, external account login, or destructive decisions. Portable instructions do not mean every vendor is connected or has credentials/repository access.

## Principles
1. Extend existing systems and preserve public contracts.
2. Use modular, typed adapters with capability declarations.
3. Secure by default: least privilege, secret isolation, audit logs.
4. Add observability, health checks, traces, and actionable errors.
5. Prefer local-first development and documented portable deployment.
6. Provide backup/restore and data export for CMS/LMS integrations.
7. Feature-flag new integrations; avoid silent behavior changes.
8. Review licenses and supply-chain risk before adding dependencies.

## Delivery sequence
Inventory current features and actual gaps; strengthen quality/security/setup/CI; add browser automation using current Playwright; improve agent interoperability using existing MCP/A2A; add CMS/LMS adapters only for validated workflows; finish with deployment validation, docs, rollback, and handover evidence.

## Production exit criteria
Compilation alone is not production readiness. Require tests, authorization, secret handling, timeout/error behavior, observability, docs, migration/rollback plan where relevant, and passing CI. Live integrations additionally require authorized test credentials and a successful recorded end-to-end test.
