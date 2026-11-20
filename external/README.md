# External skills

Third-party skills stored here so any project can pull them in. **They are not covered by this repo's MIT licence** — each keeps its upstream licence (see the LICENSE file inside the skill folder where one exists, otherwise the upstream project's terms). Copy a skill folder into a project's `.claude/skills/` to use it.

| Skill | What it does | Licence file |
|---|---|---|
| `academy-guide` | > | LICENSE.txt |
| `accessibility` | Audit and improve web accessibility following WCAG 2.2 guidelines. Use when asked to "improve accessibility", "a11y audit", "WCAG compliance | — |
| `address-sanitizer` | Builds and runs code under AddressSanitizer to catch buffer overflows, use-after-free, and other memory errors during fuzzing or tests. Cove | — |
| `adjudicate-regression` | Use when deciding whether source and live reproduction evidence establish a new regression or an exclusion. | — |
| `aflpp` | Sets up and runs AFL++ for multi-core fuzzing of C/C++ projects built with afl-clang-fast or afl-gcc-fast. Covers instrumentation modes, par | — |
| `agentdb-advanced` | Master advanced AgentDB features including QUIC synchronization, multi-database management, custom distance metrics, hybrid search, and dist | — |
| `agentdb-learning` | Create and train AI learning plugins with AgentDB's 9 reinforcement learning algorithms. Includes Decision Transformer, Q-Learning, SARSA, A | — |
| `agentdb-memory-patterns` | Implement persistent memory patterns for AI agents using AgentDB. Includes session memory, long-term storage, pattern learning, and context  | — |
| `agentdb-optimization` | Optimize AgentDB performance with quantization (4-32x memory reduction), HNSW indexing (150x faster search), caching, and batch operations.  | — |
| `agentdb-vector-search` | Implement semantic vector search with AgentDB for intelligent document retrieval, similarity matching, and context-aware querying. Use when  | — |
| `agentic-actions-auditor` | Audits GitHub Actions workflows for security vulnerabilities in AI agent integrations including Claude Code Action, Gemini CLI, OpenAI Codex | — |
| `ai-seo` | When the user wants to get cited and recommended in AI answers (ChatGPT, Perplexity, AI Overviews), or asks why AI cites a competitor, which | — |
| `algorand-vulnerability-scanner` | Scans Algorand smart contracts for 11 common vulnerabilities including rekeying attacks, unchecked transaction fees, missing field validatio | — |
| `algorithmic-art` | Creating algorithmic art using p5.js with seeded randomness and interactive parameter exploration. Use this when users request creating art  | LICENSE.txt |
| `atheris` | Sets up and runs Atheris, the coverage-guided Python fuzzer built on libFuzzer. Covers TestOneInput harnesses, FuzzedDataProvider, instrumen | — |
| `audit-augmentation` | > | — |
| `audit-context-building` | Understand a codebase before looking for bugs in it - what each function assumes, what it guarantees, and what it depends on elsewhere. Use  | — |
| `audit-prep-assistant` | Prepares codebases for security review using Trail of Bits' checklist. Helps set review goals, runs static analysis tools, increases test co | — |
| `best-practices` | Apply modern web development best practices for security, compatibility, and code quality. Use when asked to "apply best practices", "securi | — |
| `brainstorming` | You MUST use this before any creative work - creating features, building components, adding functionality, modifying behavior, or planning a | — |
| `brand-guidelines` | Applies Anthropic's official brand colors and typography to any sort of artifact that may benefit from having Anthropic's look-and-feel. Use | LICENSE.txt |
| `brandkit` | Premium brand-kit image generation skill for creating high-end brand-guidelines boards, logo systems, identity decks, and visual-world prese | — |
| `browser` | Web browser automation with AI-optimized snapshots for claude-flow agents | — |
| `burpsuite-project-parser` | Searches and explores Burp Suite project files (.burp) from the command line. Use when searching response headers or bodies with regex patte | — |
| `cairo-vulnerability-scanner` | Scans Cairo/StarkNet smart contracts for 6 critical vulnerabilities including felt252 arithmetic overflow, L1-L2 messaging issues, address c | — |
| `canvas-design` | Create beautiful visual art in .png and .pdf documents using design philosophy. You should use this skill when the user asks to create a pos | LICENSE.txt |
| `cargo-fuzz` | Sets up and runs cargo-fuzz, the standard fuzzing tool for Cargo-based Rust projects. Covers cargo fuzz init, the nightly toolchain requirem | — |
| `chrome-mcp-troubleshooting` | Diagnose and fix Claude in Chrome MCP extension connectivity issues. Use when mcp__claude-in-chrome__* tools fail, return "Browser extension | — |
| `claude-api` | \|- | LICENSE.txt |
| `code-improver` | Runs an autonomous review-and-fix improvement loop over any code target — a skill, plugin, module, or directory — using a reviewer the user  | — |
| `code-maturity-assessor` | Systematic code maturity assessment using Trail of Bits' 9-category framework. Analyzes codebase for arithmetic safety, auditing practices,  | — |
| `codeql` | >- | — |
| `constant-time-analysis` | Detects timing side-channel vulnerabilities in cryptographic code. Use when implementing or reviewing crypto code, encountering division on  | — |
| `constant-time-testing` | Measures timing side channels in cryptographic implementations by running them, using dudect for statistical analysis and Timecop over Valgr | — |
| `content-strategy` | When the user wants to plan content, or asks which topic or piece to prioritize, what to write about, or why posts bring no customers: topic | — |
| `copywriting` | When the user wants to write or rewrite page copy (homepage, landing, pricing, feature), or asks which headline, promise, or message to lead | — |
| `core-web-vitals` | Optimize Core Web Vitals (LCP, INP, CLS) for better page experience using field and lab evidence. Use when asked to "improve Core Web Vitals | — |
| `cosmos-vulnerability-scanner` | Scans Cosmos SDK blockchain modules and CosmWasm contracts for consensus-critical vulnerabilities — chain halts, fund loss, state divergence | — |
| `coverage-analysis` | Measures and interprets what a fuzzing campaign actually reaches, using llvm-cov, lcov, or a fuzzer's own coverage output. Covers baselining | — |
| `c-review` | Performs comprehensive C/C++ security review for memory corruption, integer overflows, race conditions, and platform-specific vulnerabilitie | — |
| `cro` | When the user wants more conversions from a page or form, or asks why a page isn't converting, what to change first, or whether to add or re | — |
| `crypto-protocol-diagram` | Extracts protocol message flow from source code, RFCs, academic papers, pseudocode, informal prose, ProVerif (.pv), or Tamarin (.spthy) mode | — |
| `cvss-scoring` | Produces CVSS v4.0 vector strings from plain-text vulnerability descriptions by systematically evaluating base metrics. Use when scoring a v | — |
| `deploy-to-vercel` | Deploy applications and websites to Vercel. Use when the user requests deployment actions like "deploy my app", "deploy and give me the link | — |
| `design-taste-frontend` | Anti-slop frontend skill for landing pages, portfolios, and redesigns. The agent reads the brief, infers the right design direction, and shi | LICENSE |
| `design-taste-frontend-v1` | The original v1 taste-skill, preserved for projects depending on its exact behavior. The current default is `design-taste-frontend` (v2 expe | — |
| `devcontainer-setup` | Creates devcontainers with Claude Code, language-specific tooling (Python/Node/Rust/Go), and persistent volumes. Use when adding devcontaine | — |
| `diagnosing-superpowers` | Use when a superpowers session went wrong and your human partner wants to know why — repeated work, ignored plans, stumbles, poor results, a | — |
| `diagramming-code` | > | — |
| `differential-review` | Performs security-focused differential review of code changes. Adapts analysis depth to codebase size, uses git blame for context, calculate | — |
| `dimensional-analysis` | Audits code for unit and decimal-scaling bugs and annotates it with dimensional comments recording the units of each value. Use when someone | — |
| `discernment-nudge` | > | LICENSE.txt |
| `dispatching-parallel-agents` | Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies | — |
| `doc-coauthoring` | Guide users through a structured workflow for co-authoring documentation. Use when user wants to write documentation, proposals, technical s | — |
| `docx` | Use this skill whenever the user wants to create, read, edit, or manipulate Word documents (.docx files) or Word templates (.dotx files). Tr | LICENSE.txt |
| `dwarf-expert` | Analyzes DWARF debug information in compiled binaries. Use when inspecting .debug_* sections, DIE trees, or DW_TAG_/DW_AT_ entries with dwar | — |
| `entry-point-analyzer` | Analyzes smart contract codebases to identify state-changing entry points for security auditing. Detects externally callable functions that  | — |
| `executing-plans` | Use when executing an implementation plan in the current session as the implementer yourself — your human partner chose inline execution, or | — |
| `finishing-a-development-branch` | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work | — |
| `firebase-apk-scanner` | Scans Android APKs for Firebase security misconfigurations including open databases, storage buckets, authentication issues, and exposed clo | — |
| `fp-check` | Systematically verifies suspected security bugs to eliminate false positives, producing a TRUE POSITIVE or FALSE POSITIVE verdict with docum | — |
| `frontend-design` | Guidance for distinctive, intentional visual design when building new UI or reshaping an existing one. Helps with aesthetic direction, typog | LICENSE.txt |
| `full-output-enforcement` | Overrides default LLM truncation behavior. Enforces complete code generation, bans placeholder patterns, and handles token-limit splits clea | — |
| `fuzzing-dictionary` | Builds and applies fuzzing dictionaries so a fuzzer can produce the keywords, magic bytes, and tokens a target expects. Covers extracting to | — |
| `fuzzing-obstacles` | Patches past the barriers that stop a fuzzer making progress — checksum and hash verification, magic-value validation, time-based seeds, and | — |
| `genotoxic` | Graph-informed mutation testing triage. Parses codebases with Trailmark, runs mutation testing and necessist, then uses survived mutants, un | — |
| `geo-citability` | AI citability scoring and optimization. Analyzes web page content to determine how likely AI systems (ChatGPT, Claude, Perplexity, Gemini) a | — |
| `geo-content` | Content quality and E-E-A-T assessment for AI citability — evaluate experience, expertise, authoritativeness, trustworthiness, and content s | — |
| `geo-crawlers` | AI crawler access analysis. Checks robots.txt, meta tags, and HTTP headers to determine which AI crawlers can access the site. Provides a co | — |
| `geo-llmstxt` | Analyzes and generates llms.txt files -- the emerging standard for helping AI systems understand website structure and content. Can validate | — |
| `geo-platform-optimizer` | Platform-specific AI search optimization — audit and optimize for Google AI Overviews, ChatGPT, Perplexity, Gemini, and Bing Copilot individ | — |
| `geo-schema` | Schema.org structured data audit and generation optimized for AI discoverability — detect, validate, and generate JSON-LD markup | — |
| `geo-technical` | Technical SEO audit with GEO-specific checks — crawlability, indexability, security, performance, SSR, and AI crawler access | — |
| `gh-cli` | Enforces authenticated gh CLI workflows over unauthenticated curl, WebFetch, and MCP fetch patterns. Use when working with GitHub URLs, API  | — |
| `github-code-review` | Comprehensive GitHub code review with AI-powered swarm coordination | — |
| `github-multi-repo` | \| | — |
| `github-project-management` | \| | — |
| `github-release-management` | \| | — |
| `github-triage` | Triages a repository's open GitHub issues and pull requests via the gh CLI. Optionally reviews and merges ready PRs — incrementally merging  | — |
| `github-workflow-automation` | \| | — |
| `goal-prompt` | Drafts copy-paste-ready /goal commands for goal mode in Claude Code and Codex. Use when the user asks to create, write, rewrite, improve, co | — |
| `gpt-taste` | Elite UX/UI & Advanced GSAP Motion Engineer. Enforces Python-driven true randomization for layout variance, strict AIDA page structure, wide | — |
| `graph-evolution` | > | — |
| `guidelines-advisor` | Smart contract development advisor based on Trail of Bits' best practices. Analyzes codebase to generate documentation/specifications, revie | — |
| `harness-writing` | Designs and improves fuzzing harnesses for C/C++ and Rust. Covers mapping raw bytes onto a target API, generating structured inputs, avoidin | — |
| `high-end-visual-design` | Teaches the AI to design like a high-end agency. Defines the exact fonts, spacing, shadows, card structures, and animations that make a webs | — |
| `hooks-automation` | Automated coordination, formatting, and learning from Claude Code operations using intelligent hooks with MCP integration. Includes pre/post | — |
| `hunt-regressions` | Use when discovering possible regressions from a pinned change and its callers before reproduction. | — |
| `imagegen-frontend-mobile` | Elite mobile app image-generation skill for creating premium, app-native screen concepts and flows. Designed for iOS, Android, and cross-pla | — |
| `imagegen-frontend-web` | Elite frontend image-direction skill for generating premium, conversion-aware website design references. CRITICAL OUTPUT RULE — generate ONE | — |
| `image-to-code` | Elite website image-to-code skill for Codex. For visually important web tasks, it must first generate the design image(s) itself, deeply ana | — |
| `implement-patch` | Use when a confirmed local bug needs an invariant-level fix, variant search, tests, and one local commit. | — |
| `industrial-brutalist-ui` | Raw mechanical interfaces fusing Swiss typographic print with military terminal aesthetics. Rigid grids, extreme type scale contrast, utilit | — |
| `internal-comms` | A set of resources to help me write all kinds of internal communications, using the formats that my company likes to use. Claude should use  | LICENSE.txt |
| `interpreting-culture-index` | Interprets Culture Index (CI) surveys, behavioral profiles, and personality assessment data. Supports individual profile interpretation, tea | — |
| `let-fate-decide` | Draws the 12 Houses of the Zodiac Tarot spread to inject entropy into planning when prompts are vague, ambiguous, or casually delegated. Int | — |
| `libafl` | Builds custom fuzzers with LibAFL, the modular Rust fuzzing library. Covers composing observers, feedbacks, mutators, schedulers, and execut | — |
| `libfuzzer` | Sets up and runs libFuzzer, the coverage-guided fuzzer built into LLVM, on C/C++ code that compiles with Clang. Covers harness structure, -f | — |
| `marketing-psychology` | When the user wants to apply psychology to marketing, or asks why buyers behave or value things as they do, or whether a persuasion tactic i | — |
| `mcp-builder` | Guide for creating high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services through well-design | LICENSE.txt |
| `mermaid-to-proverif` | Translates Mermaid sequenceDiagrams describing cryptographic protocols into ProVerif formal verification models (.pv files). Use when genera | — |
| `minimalist-ui` | Clean editorial-style interfaces. Warm monochrome palette, typographic contrast, flat bento grids, muted pastels. No gradients, no heavy sha | — |
| `modern-cpp` | Guides C++ code toward modern idioms (C++20/23/26). Use when writing new C++ code, modernizing legacy patterns, or working on security-criti | — |
| `modern-python` | Configures Python projects with modern tooling (uv, ruff, ty). Use when creating projects, writing standalone scripts, or migrating from pip | — |
| `mutation-testing` | Configures mewt or muton campaigns, analyzes surviving mutants, and investigates bugs exposed by testing gaps. Use when setting up mutation  | — |
| `open-sourcing` | This skill should be used when the user asks to "open source this project", "prepare this repository for public release", "make this repo pu | — |
| `ossfuzz` | Enrolls a project in OSS-Fuzz, Google's free continuous fuzzing service for open source, and drives it locally. Covers project.yaml, Dockerf | — |
| `pair-programming` | AI-assisted pair programming with multiple modes (driver/navigator/switch), real-time verification, quality monitoring, and comprehensive te | — |
| `patching-bugs` | Use when a known bug or falsifiable bug hypothesis in a local codebase needs a patch commit and reviewable proof report. | — |
| `pdf` | Use this skill whenever the user wants to do anything with PDF files. This includes reading or extracting text/tables from PDFs, combining o | LICENSE.txt |
| `performance` | Optimize web performance for faster loading and better user experience. Use when asked to "speed up my site", "optimize performance", "reduc | — |
| `post-patch-validation` | > | — |
| `pptx` | Use this skill any time a .pptx or .potx file is involved in any way — as input, output, or both. This includes: creating slide decks, pitch | LICENSE.txt |
| `prepare-regression` | Use when pinning before/after sources and collecting PR or commit context for a regression investigation. | — |
| `pr-improver` | Runs an autonomous review-and-fix improvement loop over the current branch's changes until a PR review comes back clean, scoped mechanically | — |
| `property-based-testing` | Writes, reviews, and debugs property-based tests — Hypothesis, fast-check, proptest, jqwik, rapid, and Echidna or Medusa for Solidity invari | — |
| `prove-patch` | Use when a local security patch commit needs independent scoped and three-arm proof. | — |
| `reasoningbank-agentdb` | Implement ReasoningBank adaptive learning with AgentDB's 150x faster vector database. Includes trajectory tracking, verdict judgment, memory | — |
| `reasoningbank-intelligence` | Implement adaptive learning with ReasoningBank for pattern recognition, strategy optimization, and continuous improvement. Use when building | — |
| `receiving-code-review` | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - | — |
| `redesign-existing-projects` | Upgrades existing websites and apps to premium quality. Audits current design, identifies generic AI patterns, and applies high-end design s | — |
| `regression-hunt` | Use when investigating regressions in PRs or commits, coordinating a regression campaign, or resuming saved progress. | — |
| `replay-regression` | Use when independently verifying a supplied PoC against fresh live before/after deployments. | — |
| `report-regressions` | Use when assembling or refreshing an evidence-linked regression report from saved campaign decisions. | — |
| `reproduce-bug` | Use when a named runtime or compiler bug in a local repository needs independent reproduction. | — |
| `reproduce-regression` | Use when deploying before/after systems and building a live-system PoC for a regression candidate. | — |
| `requesting-code-review` | Use when completing tasks, implementing major features, or before merging to verify work meets requirements | — |
| `review-walkthrough` | Generates an interactive HTML walkthrough for reviewing code changes. Use only when explicitly called. | — |
| `rust-review` | Performs comprehensive Rust security review for safe/unsafe boundary issues, memory safety in unsafe blocks, concurrency hazards, panic-indu | — |
| `ruzzy` | Sets up and runs Ruzzy, Trail of Bits' coverage-guided Ruby fuzzer and the only production-ready one for the language. Covers harness struct | — |
| `sarif-parsing` | >- | — |
| `schema` | When the user wants to add, fix, or validate schema markup (JSON-LD), or asks which type fits a page or whether some markup is allowed: prod | — |
| `second-opinion` | Gets independent code reviews from Codex or Antigravity for uncommitted changes, branch diffs, and commits. Use when the user requests an ex | — |
| `secure-workflow-guide` | Guides through Trail of Bits' 5-step secure development workflow. Runs Slither scans, checks special features (upgradeability/ERC conformanc | — |
| `semgrep` | >- | — |
| `semgrep-rule-creator` | Creates custom Semgrep rules for detecting security vulnerabilities, bug patterns, and code patterns. Use when writing Semgrep rules or buil | — |
| `semgrep-rule-variant-creator` | Creates language variants of existing Semgrep rules. Use when porting a Semgrep rule to specified target languages. Takes an existing rule a | — |
| `seo` | Optimize for search engine visibility and ranking. Use when asked to "improve SEO", "optimize for search", "fix meta tags", "add structured  | — |
| `seo-aeo-best-practices` | SEO and AEO best practices for metadata, Open Graph, sitemaps, robots.txt, hreflang, JSON-LD structured data, EEAT, and content optimized fo | — |
| `seo-ahrefs` | Ahrefs API analyst (extension). Reads referring domains, backlinks, organic keywords, and content explorer data via the tested @ahrefs/mcp@0 | — |
| `seo-audit` | Full website SEO audit with parallel subagent delegation. Crawls up to 500 pages, detects business type, delegates to up to 15 specialists ( | LICENSE.txt |
| `seo-backlinks` | Backlink profile analysis: referring domains, anchor text distribution, toxic link detection, competitor gap analysis. Works with free APIs  | LICENSE.txt |
| `seo-bing` | Bing Webmaster Tools + IndexNow extension. Microsoft Copilot citations are fed by the Bing index; this skill makes Bing visibility, link dat | — |
| `seo-cluster` | > | — |
| `seo-competitor-pages` | > | LICENSE.txt |
| `seo-content` | > | LICENSE.txt |
| `seo-content-brief` | > | LICENSE.txt |
| `seo-dataforseo` | > | LICENSE.txt |
| `seo-drift` | > | — |
| `seo-ecommerce` | > | — |
| `seo-firecrawl` | > | LICENSE.txt |
| `seo-flow` | > | — |
| `seo-geo` | > | LICENSE.txt |
| `seo-geo-skill` | Phase 0 audit + 21 optimization phases for Claude Code. Canonical 100-pt rubric (Technical 20, On-Page 15, Schema 20, GEO 25, AEO 10, E-E-A- | LICENSE |
| `seo-google` | > | LICENSE.txt |
| `seo-hreflang` | > | LICENSE.txt |
| `seo-image-gen` | AI image generation for SEO assets: OG/social preview images, blog hero images, schema images, product photography, infographics. Powered by | LICENSE.txt |
| `seo-images` | > | LICENSE.txt |
| `seo-local` | > | LICENSE.txt |
| `seo-maps` | > | LICENSE.txt |
| `seo-page` | > | LICENSE.txt |
| `seo-plan` | > | LICENSE.txt |
| `seo-profound` | Profound LLM citation tracker (extension). Time-series brand citation rates across ChatGPT, Perplexity, and other LLMs. Pairs with seo-seran | — |
| `seo-programmatic` | > | LICENSE.txt |
| `seo-schema` | > | LICENSE.txt |
| `seo-seranking` | SE Ranking AI visibility analyst (extension). Tracks AI Share-of-Voice across ChatGPT, Gemini, Perplexity, AI Overviews, and AI Mode in a si | — |
| `seo-sitemap` | > | LICENSE.txt |
| `seo-sxo` | > | — |
| `seo-technical` | > | LICENSE.txt |
| `seo-unlighthouse` | Multi-page Lighthouse audit via the MIT-licensed Unlighthouse CLI. Free-tier alternative to running PageSpeed against every URL on a site, n | — |
| `sharp-edges` | Identifies error-prone APIs, dangerous configurations, and footgun designs that enable security mistakes. Use when reviewing API designs, co | — |
| `site-architecture` | When the user wants to plan or restructure a website, or asks which pages they need or where something belongs: hierarchy, navigation, URL s | — |
| `skill-builder` | Create new Claude Code Skills with proper YAML frontmatter, progressive disclosure structure, and complete directory organization. Use when  | — |
| `skill-creator` | Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, ed | LICENSE.txt |
| `skill-improver` | Runs an autonomous review-and-fix improvement loop over a Claude Code skill until a review comes back clean, with a cross-round findings led | — |
| `slack-gif-creator` | Knowledge and utilities for creating animated GIFs optimized for Slack. Provides constraints, validation tools, and animation concepts. Use  | LICENSE.txt |
| `slicing-code-context` | Selects bounded, graph-informed source slices with Trailmark and delegates focused code analysis or patch-proposal work to a smaller subagen | — |
| `solana-vulnerability-scanner` | Scans Solana programs for 6 critical vulnerabilities including arbitrary CPI, improper PDA validation, missing signer/ownership checks, and  | — |
| `sparc-methodology` | \| | — |
| `spec-to-code-compliance` | Check code against the documentation that specifies it - which requirements hold, which the code contradicts, which are absent, and what the | — |
| `stitch-design-taste` | Semantic Design System Skill for Google Stitch. Generates agent-friendly DESIGN.md files that enforce premium, anti-generic UI standards — s | — |
| `stream-chain` | Stream-JSON chaining for multi-agent pipelines, data transformation, and sequential workflows | — |
| `subagent-driven-development` | Use when executing implementation plans with independent tasks in the current session | — |
| `substrate-vulnerability-scanner` | Scans Substrate/Polkadot pallets for 7 critical vulnerabilities including arithmetic overflow, panic DoS, incorrect weights, and bad origin  | — |
| `supply-chain-risk-auditor` | Audits a project's dependencies for supply-chain risk: version-matched advisories for direct dependencies and the full lockfile tree, abando | — |
| `swarm-advanced` | \| | — |
| `swarm-orchestration` | Orchestrate multi-agent swarms with agentic-flow for parallel task execution, dynamic topology, and intelligent coordination. Use when scali | — |
| `systematic-debugging` | Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes | — |
| `taint-trace` | Improves taint-analysis coverage and precision by using Trailmark graphs to repair native source, sink, sanitizer, propagation, and type mod | — |
| `template-skill` | Replace with description of the skill and when Claude should use it. | — |
| `test-driven-development` | Use when implementing any feature or bugfix, before writing implementation code | — |
| `testing-handbook-generator` | Generates Claude Code skills from the Trail of Bits Testing Handbook (appsec.guide), analyzing handbook pages and emitting SKILL.md files wi | — |
| `theme-factory` | Toolkit for styling artifacts with a theme. These artifacts can be slides, docs, reportings, HTML landing pages, etc. There are 10 pre-set t | LICENSE.txt |
| `token-integration-analyzer` | Token integration and implementation analyzer based on Trail of Bits' token integration checklist. Analyzes token implementations for ERC20/ | — |
| `ton-vulnerability-scanner` | Scans TON (The Open Network) smart contracts for 3 critical vulnerabilities including integer-as-boolean misuse, fake Jetton contracts, and  | — |
| `trailmark` | Builds and queries multi-language source and binary code graphs for security analysis. Includes pre-analysis passes for blast radius, taint  | — |
| `trailmark-finding-triage` | Performs graph-assisted triage of a single security finding, SARIF result, weAudit annotation, suspicious function, or report excerpt using  | — |
| `trailmark-review-gate` | Runs a Trailmark structural review gate over a branch, pull request, fix commit, release diff, or git ref range to detect new entrypoints, n | — |
| `trailmark-structural` | Runs full Trailmark structural analysis by building a graph, running `preanalysis()`, and reporting hotspots, taint, blast radius, privilege | — |
| `trailmark-summary` | Runs a Trailmark summary analysis on a codebase. Returns auto-detected languages, entry point count, and dependency list. Use when vivisect  | — |
| `trailmark-variant-neighborhood` | Expands one confirmed or suspected vulnerability into a Trailmark graph neighborhood of variant candidates by finding sibling functions, sha | — |
| `using-git-worktrees` | Use when starting feature work that needs isolation from current workspace or before executing implementation plans - ensures an isolated wo | — |
| `using-superpowers` | Use when starting any conversation - establishes how to find and use skills, requiring skill invocation before ANY response including clarif | — |
| `v3-cli-modernization` | CLI modernization and hooks system enhancement for claude-flow v3. Implements interactive prompts, command decomposition, enhanced hooks int | — |
| `v3-core-implementation` | Core module implementation for claude-flow v3. Implements DDD domains, clean architecture patterns, dependency injection, and modular TypeSc | — |
| `v3-ddd-architecture` | Domain-Driven Design architecture for claude-flow v3. Implements modular, bounded context architecture with clean separation of concerns and | — |
| `v3-integration-deep` | Deep agentic-flow@alpha integration implementing ADR-001. Eliminates 10,000+ duplicate lines by building claude-flow as specialized extensio | — |
| `v3-mcp-optimization` | MCP server optimization and transport layer enhancement for claude-flow v3. Implements connection pooling, load balancing, tool registry opt | — |
| `v3-memory-unification` | Unify 6+ memory systems into AgentDB with HNSW indexing for 150x-12,500x search improvements. Implements ADR-006 (Unified Memory Service) an | — |
| `v3-performance-optimization` | Achieve aggressive v3 performance targets: 2.49x-7.47x Flash Attention speedup, 150x-12,500x search improvements, 50-75% memory reduction. C | — |
| `v3-security-overhaul` | Complete security architecture overhaul for claude-flow v3. Addresses critical CVEs (CVE-1, CVE-2, CVE-3) and implements secure-by-default p | — |
| `v3-swarm-coordination` | 15-agent hierarchical mesh coordination for v3 implementation. Orchestrates parallel execution across security, core, and integration domain | — |
| `validate-bug` | Use when a bug PoC package needs an independent rerun and judgment before patching. | — |
| `variant-analysis` | Hunts for the other instances of a bug already found — the variants of one root cause across a codebase. Use immediately after a vulnerabili | — |
| `vector-forge` | Mutation-driven test vector generation. Finds implementations of a cryptographic algorithm or protocol, runs mutation testing to identify es | — |
| `vercel-cli-with-tokens` | Deploy and manage projects on Vercel using token-based authentication. Use when working with Vercel CLI using access tokens rather than inte | — |
| `vercel-composition-patterns` | (no description) | — |
| `vercel-optimize` | Use for Vercel cost and performance optimization on deployed projects, especially Next.js, SvelteKit, Nuxt, and limited Astro apps. Collect  | — |
| `vercel-react-best-practices` | React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refacto | — |
| `vercel-react-native-skills` | (no description) | — |
| `vercel-react-view-transitions` | Guide for implementing smooth, native-feeling animations using React's View Transition API (`<ViewTransition>` component, `addTransitionType | — |
| `verification-before-completion` | Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and  | — |
| `verification-quality` | \| | — |
| `vulnerability-triage-brocards` | >- | — |
| `webapp-testing` | Toolkit for interacting with and testing local web applications using Playwright. Supports verifying frontend functionality, debugging UI be | LICENSE.txt |
| `web-artifacts-builder` | Suite of tools for creating elaborate, multi-component claude.ai HTML artifacts using modern frontend web technologies (React, Tailwind CSS, | LICENSE.txt |
| `web-design-guidelines` | Review UI code for Web Interface Guidelines compliance. Use when asked to "review my UI", "check accessibility", "audit design", "review UX" | — |
| `web-quality-audit` | Run an evidence-led web quality audit covering performance, accessibility, SEO, best practices, and agentic browsing. Use when asked to "aud | — |
| `writing-guidelines` | Review docs/prose for Writing Guidelines compliance. Use when asked to "review my docs", "check writing style", "audit prose", "review docs  | — |
| `writing-lean-proofs` | Writes and reviews structured Lean 4 proofs and designs Lean libraries following Mathlib conventions. Use when proving theorems in Lean, for | — |
| `writing-plans` | Use when you have a spec or requirements for a multi-step task, before touching code | — |
| `writing-skills` | Use when creating new skills, editing existing skills, or verifying skills work before deployment | — |
| `wycheproof` | Validates cryptographic implementations against Project Wycheproof's test vectors, which encode known attacks and edge cases across AES, RSA | — |
| `xlsx` | Use this skill any time a spreadsheet file is the primary input or output. This means any task where the user wants to: open, read, edit, or | LICENSE.txt |
| `yara-rule-authoring` | > | — |
| `zeroize-audit` | Detects missing zeroization of sensitive data in source code and identifies zeroization removed by compiler optimizations, with assembly-lev | — |
