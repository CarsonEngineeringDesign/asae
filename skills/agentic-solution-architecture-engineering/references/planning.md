# Planning

Read before writing or revising `.info/PLAN.md`. There is one plan file per project. Revisions edit it; they never create a second file.

## Choose the format first

Ask which before writing:

- **Lean, one page**: internal validation and rapid testing. Each section is a short paragraph or a table.
- **Traditional, 15 to 25 pages**: pitching institutional investors or applying for bank loans. Each section is developed with sourced figures.

Default to lean when the user hasn't said. Confirm rather than guess.

## The six sections

Use these headings, in this order, always.

### 1. Executive Summary
One page maximum. The core problem, the target audience, the monetization model, and the funding requirement. Written last, read first.

### 2. Product & Tech Stack
Features, the unique value proposition, and the underlying architecture, cloud hosting, data stores, third-party APIs, and how it scales. Name the actual services and versions, not categories.

### 3. Market & Competitor Analysis
Total Addressable Market (TAM, the full revenue opportunity if every possible buyer bought), ideal buyer personas, and the concrete differentiation from named competitors. "Better UX" is not a differentiator; name the capability.

### 4. Go-to-Market Strategy
Customer acquisition channels, inbound marketing, pricing tiers (subscription levels and what gates each), and estimated Customer Acquisition Cost (CAC, the spend required to win one paying customer).

### 5. Operations & Infrastructure
Recurring costs: cloud infrastructure, third-party and model API dependencies, developer time or salaries, support. Separate fixed from per-user costs, because only the second one scales with growth.

### 6. Financial Projections
Three to five years. Gross margin, burn rate, and break-even analysis. Show the assumptions as a table, so each one can be attacked individually.

## Rules

**Model margins honestly.** Early software margins compress when the product leans on expensive third-party AI or LLM calls, sometimes to around 40%, against the 70 to 85% mature software eventually reaches. Show the compressed early figure and the path to the mature one. A plan that opens at 80% margin on day one reads as unserious to anyone who has seen an inference bill.

**Use benchmarks, never invented numbers.** Pre-revenue means no history, which is expected. Cite comparable industry benchmarks explicitly as proxies, and label them: "conversion 2.1%, SaaS freemium median, benchmark not own data." An unlabeled made-up number destroys the credibility of every real number beside it.

**Treat it as living.** Financial projections get reviewed quarterly; core growth assumptions get reviewed annually. Record each review in the document's changelog even when nothing changed.

**Every number has a source.** Own data, a named benchmark, or a stated assumption. Three kinds, never mixed silently.

## Research

Verify rather than recall. Market sizes, competitor pricing, and API costs all drift.

Check what is available, then use it:
- A research subagent or parallel agent: delegate, ask for bullets with sources.
- An external CLI agent such as `gemini`, `codex`, or `claude -p`, useful for breadth and second opinions. Confirm it is installed before relying on it.
- Web search or documentation fetch: for specific lookups.
- None available: state what needs verifying and ask the user to confirm it. Do not fill the gap with a guess.

Report conclusions, not transcripts: three bullets and a link.

## Changelog

`PLAN.md` ends with the standard changelog table. Quarterly financial reviews and annual assumption reviews are logged there.
