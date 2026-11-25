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

## Added 25 November 2026

894 skills from four repositories, the first copy kept where a name repeats, and none replacing a skill already here:

- [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) at `ea7b5ab`: MIT
- [borghei/Claude-Skills](https://github.com/borghei/Claude-Skills) at `0337fda`: MIT with the Commons Clause
- [wshobson/agents](https://github.com/wshobson/agents) at `c96b5f6`: MIT
- [w95/awesome-claude-corporate-skills](https://github.com/w95/awesome-claude-corporate-skills) at `78dbc7c`: MIT

**The Commons Clause (borghei/Claude-Skills) forbids selling those skills or a service whose value comes substantially from them.** Using them inside ShrotiHost is fine; reselling them is not. Each skill folder carries its repository's LICENSE. Their agent definitions are in `../external-agents/`.

| Skill | What it does | Licence file |
|---|---|---|
| `3-statements` | Complete, populate and fill out 3-statement financial model templates (Income Statement, Balance Sheet, Cash Flow Statement) . Use when aske | LICENSE |
| `a11y-audit` | Use for any accessibility audit or a11y fix (WCAG 2.2 A/AA, color contrast, compliance report, CI check) in React, Next.js, Vue, Angular, Sv | LICENSE |
| `ab-test-setup` | Use before planning or launching any A/B, split or multivariate test, or when asked if a result is significant. Sizes the test with sample_s | LICENSE |
| `access-lifecycle` | Use when preparing or running a user access review, checking that leavers lost their access, finding orphaned or ownerless service accounts, | LICENSE |
| `accessibility-compliance` | Implement WCAG 2.2 compliant interfaces with mobile accessibility, inclusive design patterns, and assistive technology support. Use when aud | LICENSE |
| `account-executive` | Sales execution across pipeline, discovery, demos, negotiation, and closing. Use when qualifying opportunities, running MEDDIC discovery, bu | LICENSE |
| `account-research` | Research a company using Common Room data. Triggers on 'research [company]', 'tell me about [domain]', 'pull up signals for [account]', 'wha | LICENSE |
| `activation-funnel` | Designs and analyzes activation funnels: stage conversion, drop-off, bottlenecks and the aha event that predicts retention. Use when a funne | LICENSE |
| `ad-creative` | Use for any ad copy request (RSA headlines, Meta, LinkedIn or TikTok ads, bulk variations), before writing. Checks every line against platfo | LICENSE |
| `adversarial-reviewer` | Tough, critical review of a diff or PR before merge, through hostile reviewer personas that catch shared blind spots. Use whenever the user  | LICENSE |
| `aeo` | Use when content should be cited by ChatGPT, Perplexity, Claude or Gemini (answer engine optimization), before rewriting it. Scores E-E-A-T  | LICENSE |
| `agent-decision-receipts` | Use when an autonomous agent takes a side-effecting action (deploy, delete, pay, grant access) that may need proving later, or for EU AI Act | LICENSE |
| `agent-designer` | Design multi-agent systems (supervisor, swarm, pipeline) and tool schemas; find bottlenecks in run logs. Use whenever agents split work or a | LICENSE |
| `agent-harness` | Use when an agent should drive a goal in one of this repo's domains to a verified close, before starting the work. Compiles the goal into a  | LICENSE |
| `agent-launcher-orchestrator` | Use when someone wants to build, launch, grade or schedule a Claude Managed Agent in their own Anthropic account ('build me an agent', 'run  | LICENSE |
| `agent-memory` | Use when an agent keeps relearning the same correction, CLAUDE.md has grown unreadable, or you need to trace where a remembered rule came fr | LICENSE |
| `agent-protocol` | Use when C-suite advisor agents need to call each other or run a multi-role meeting. Defines invocation syntax, loop prevention, isolation a | LICENSE |
| `agent-regression-evals` | Use before shipping any agent, prompt, model or tool change, or when a pass-rate drop needs a verdict. Runs repeated trials, gates candidate | LICENSE |
| `agent-run-forensics` | Use when asked why an agent did something, what a past session or run changed, whether tests really passed, or to verify a session summary.  | LICENSE |
| `agent-workflow-designer` | Use when architecting a multi-step LLM or agent pipeline, choosing single vs multi-agent, or fixing context bloat and broken handoffs. Scaff | LICENSE |
| `agenthub` | Run several agents on one task in parallel and keep the best result: faster code, copy variants, research angles. Use whenever the user want | LICENSE |
| `agentic-evaluation-framework` | Builds LLM and agent evals: weighted rubrics, LLM-as-judge design, inter-rater agreement and pairwise ranking (Elo, Bradley-Terry) from scor | LICENSE |
| `agents-in-the-team` | Run delivery when AI coding and ops agents take tickets. Use when setting agent delegation policy, writing agent-ready tickets, planning rev | LICENSE |
| `agile-coach` | Expert agile coaching: framework selection, maturity assessment, retrospective facilitation, transformation roadmaps. Use when selecting an  | LICENSE |
| `agile-product-owner` | Use for backlog work: writing user stories and acceptance criteria, splitting epics, estimating or prioritizing for a sprint. Generates stor | LICENSE |
| `ai-act-readiness` | EU AI Act readiness: risk tier, duties, deadlines. Load whenever AI ships in the EU or the user asks if the Act applies. | LICENSE |
| `ai-content-disclosure` | Check AI-generated marketing content and reviews for required disclosures under the EU AI Act, FTC rules and platform AI-label policies. Use | LICENSE |
| `ai-debt-detector` | Use after generating code, after accepting AI suggestions, or when reviewing AI-written modules. Also use when code works but feels brittle, | LICENSE |
| `ai-decision-authority` | Use before letting AI or an agent act on a marketing or GTM task without human review, or when writing an AI review policy. Places each work | LICENSE |
| `ai-feature-prd` | Extends a PRD with model choice, eval and safety plan, guardrails, cost model and rollout gates for an AI or ML feature. Use when specifying | LICENSE |
| `ai-prototyping` | Idea to AI-generated prototype to customer validation to engineering handoff. Use when deciding prototype vs spec, choosing fidelity, briefi | LICENSE |
| `ai-security` | Use when assessing an AI/ML system or LLM agent for prompt injection, jailbreaks, model inversion, data poisoning or tool abuse. Maps findin | LICENSE |
| `aims-audit` | ISO 42001 AI readiness check. Use before a stage 1 or internal audit, or /compliance-os:aims-audit. | LICENSE |
| `airflow-dag-patterns` | Build production Apache Airflow DAGs with best practices for operators, sensors, testing, and deployment. Use when creating data pipelines,  | LICENSE |
| `analytics-engineer` | Analytics engineering across data modeling, dbt, transformation, and semantic layers. Use when building dbt models, designing star schemas,  | LICENSE |
| `analytics-tracking` | Use for any GA4, Google Tag Manager, event-tracking or conversion-tracking setup, audit or broken-event debug, before touching tags. Generat | LICENSE |
| `andreessen` | Blunt market-first verdict on an idea, venture or career bet, leading with the strongest counterargument, or a 3x5-card daily plan. Use when | LICENSE |
| `angular-migration` | Migrate from AngularJS to Angular using hybrid mode, incremental component rewriting, and dependency injection updates. Use when upgrading A | LICENSE |
| `ansoff-matrix` | Classifies growth bets into the four Ansoff quadrants and checks the investment mix against the company's stage. Use when prioritising growt | LICENSE |
| `anti-reversing-techniques` | Understand anti-reversing, obfuscation, and protection techniques encountered during software analysis. Use this skill when analyzing malwar | LICENSE |
| `api-design-principles` | Master REST and GraphQL API design principles to build intuitive, scalable, and maintainable APIs that delight developers. Use when designin | LICENSE |
| `api-design-reviewer` | Use for any PR or spec that adds or changes REST endpoints, before approving it. Lints conventions with api_linter.py, detects breaking chan | LICENSE |
| `api-test-suite-builder` | Use when asked to write API, integration or contract tests for REST endpoints. Builds the suite from the routes: happy paths, auth, validati | LICENSE |
| `app-store-optimization` | Use for any App Store or Google Play listing, keyword, ranking or review question, before writing metadata. Scores the listing with aso_scor | LICENSE |
| `apple-hig-expert` | Use when designing or reviewing iOS, macOS, watchOS or visionOS UI against Apple's Human Interface Guidelines, including Liquid Glass, contr | LICENSE |
| `ar-loop` | Use for /ar-loop, or to run an autoresearch experiment on a schedule (10 min to monthly) with CronCreate. | LICENSE |
| `ar-resume` | Use for /ar-resume, or to continue a paused autoresearch experiment from its branch and results history. | LICENSE |
| `ar-run` | Use for /ar-run, or to run one manual autoresearch iteration: edit, evaluate, keep or discard. | LICENSE |
| `ar-status` | Show autoresearch results and progress. Use when asked how an experiment runs, or /ar-status. | LICENSE |
| `architecture-decision-records` | Write and maintain Architecture Decision Records (ADRs) following best practices for technical decision documentation. Use when documenting  | LICENSE |
| `architecture-patterns` | Implement proven backend architecture patterns including Clean Architecture, Hexagonal Architecture, and Domain-Driven Design. Use this skil | LICENSE |
| `arquiteto-de-empresa` | Use when a founder wants to document or design a whole company as version-controlled markdown (company as code, a company wiki agents can re | LICENSE |
| `async-python-patterns` | Master Python asyncio, concurrent programming, and async/await patterns for high-performance applications. Use when building async APIs, con | LICENSE |
| `atlassian-admin` | Use for Atlassian org administration: Jira or Confluence users and groups, permissions, SSO, marketplace apps or security policy. Audits per | LICENSE |
| `atlassian-templates` | Use when creating or changing Jira or Confluence templates, blueprints or page layouts for reuse across the org. Scaffolds them with templat | LICENSE |
| `attack-tree-construction` | Build comprehensive attack trees to visualize threat paths. Use when mapping attack scenarios, identifying defense gaps, or communicating se | LICENSE |
| `auth-implementation-patterns` | Master authentication and authorization patterns including JWT, OAuth2, session management, and RBAC to build secure, scalable access contro | LICENSE |
| `autoresearch-agent` | Make a file measurably better by trial: faster code, smaller bundle, higher pass rate or prompt score. Use whenever the user wants something | LICENSE |
| `avoid-ai-writing` | Audit and rewrite prose so it stops reading as machine-generated. Use this skill when asked to remove AI-isms, clean up AI writing, edit a d | LICENSE |
| `aws-solution-architect` | Use when designing or costing an AWS architecture (serverless, Lambda, API Gateway, DynamoDB, ECS, Aurora, CloudFormation, migration to AWS) | LICENSE |
| `azure-cloud-architect` | Use when designing or costing an Azure architecture (AKS, App Service, Functions, Cosmos DB, Bicep or ARM, Azure DevOps, migration to Azure) | LICENSE |
| `backlog-refinement` | Grade stories against INVEST, split them vertically or as tracer bullets, and enforce Definition of Ready and Done. Use when refining a back | LICENSE |
| `backtesting-frameworks` | Build robust backtesting systems for trading strategies with proper handling of look-ahead bias, survivorship bias, and transaction costs. U | LICENSE |
| `bash-defensive-patterns` | Master defensive Bash programming techniques for production-grade scripts. Use when writing robust shell scripts, CI/CD pipelines, or system | LICENSE |
| `batch-api-orchestrator` | Decides batch vs realtime for bulk LLM work, prices both, and plans chunking, idempotency keys and partial-failure retries. Use when running | LICENSE |
| `bats-testing-patterns` | Master Bash Automated Testing System (Bats) for comprehensive shell script testing. Use when writing tests for shell scripts, CI/CD pipeline | LICENSE |
| `bazel-build-optimization` | Optimize Bazel builds for large-scale monorepos. Use when configuring Bazel, implementing remote execution, or optimizing build performance  | LICENSE |
| `before-you-build` | Pre-build product and feature risk review for founders, product managers, and AI-assisted builders. Use this skill when the user is about to | LICENSE |
| `behuman` | Reply like a real person, direct and warm, without lists or hedging. Use whenever the user says you sound robotic, asks you to be real or ta | LICENSE |
| `beta-program` | Plan and run a closed beta: cohorts, exit gates agreed before recruiting, weekly cadence and a Greenlight/Extend/Pivot/Kill memo. Use when r | LICENSE |
| `billing-automation` | Build automated billing systems for recurring payments, invoicing, subscription lifecycle, and dunning management. Use when implementing sub | LICENSE |
| `binary-analysis-patterns` | Master binary analysis patterns including disassembly, decompilation, control flow analysis, and code pattern recognition. Use when analyzin | LICENSE |
| `block-no-verify-hook` | Configure a PreToolUse hook to prevent AI agents from skipping git pre-commit hooks with --no-verify and other bypass flags. Use when settin | LICENSE |
| `board` | Use to post or read messages on the AgentHub coordination board between competing agents. | LICENSE |
| `board-deck-builder` | Use when building a board deck, investor update or QBR from all C-suite perspectives. Structures the narrative and how to deliver bad news. | LICENSE |
| `board-meeting` | Use for /c-level-agents:boardroom or a strategic question that needs a structured multi-executive deliberation. Runs six phases: context, is | LICENSE |
| `board-meeting-prep` | ACTIVATE when preparing for board meetings, creating board decks, drafting board materials, developing executive summaries for directors, wr | LICENSE |
| `board-prep` | Use before a board meeting, investor update or fundraising pitch where the numbers will be challenged. Drills numbers cold, anticipates the  | LICENSE |
| `boardroom` | Use for /c-level-agents:boardroom, or a decision spanning several executive domains (a pricing change, raise vs cut). Runs a 6-phase C-suite | LICENSE |
| `book-to-skill` | Use when turning a book, docs folder or spec collection (PDF, EPUB, DOCX, HTML, Markdown) into an agent skill, before summarizing it by hand | LICENSE |
| `boost-asio-pro` | Use for any C++ networking code with Boost.Asio or standalone Asio (TCP/UDP, SSL, timers, strands, io_context, co_spawn, awaitable, completi | LICENSE |
| `brainstorm-experiments` | Designs cheap experiments with a pre-set pass bar (at least X% of Y will do Z) and picks the method. Use when validating an idea before buil | LICENSE |
| `brainstorm-ideas` | Generates product ideas from PM, design and engineering angles, ties each to an opportunity and ranks the top five. Use when brainstorming f | LICENSE |
| `brainstorm-okrs` | Draft and score quarterly OKRs: a qualitative objective, measurable key results and a counter-metric. Use when setting or reviewing a team's | LICENSE |
| `brand-landingpage` | Brand-first landing page designer — runs a brand-identity interview (colors, typography, shape language), then generates and iterates on a p | LICENSE |
| `brand-strategist` | Brand strategy covering positioning, identity, brand architecture, messaging frameworks, and governance. Use when developing brand positioni | LICENSE |
| `brand-voice-enforcement` | This skill applies brand guidelines to content creation. It should be used when the user asks to "write an email", "draft a proposal", "crea | LICENSE |
| `brief` | Use for /c-level-agents:brief, or to frame a strategic question (options, assumptions, success criteria) as a one-page brief before delibera | LICENSE |
| `browser-automation` | Automate a browser: scrape websites, fill forms, pull structured data from web pages. Use whenever the user wants to grab data from a site,  | LICENSE |
| `browserstack` | Use when running Playwright tests on BrowserStack or across a browser matrix ('browserstack', 'cross-browser', 'test on safari or firefox',  | LICENSE |
| `bug-diagnosis` | Find the root cause of hard bugs with a fast pass/fail repro, ranked falsifiable hypotheses and bisection. Use when a bug resists quick fixe | LICENSE |
| `business-case-builder` | Build business cases with cost-benefit analysis, ROI calculations, risk assessment, implementation timeline, and stakeholder analysis | LICENSE |
| `business-growth-skills` | Use when a growth request needs routing between customer-success-manager, sales-engineer, revenue-operations, contract-and-proposal-writer a | LICENSE |
| `business-intelligence` | Business intelligence across dashboard design, visualization, and reporting automation. Use when designing dashboards, building KPI framewor | LICENSE |
| `business-investment-advisor` | Use when deciding whether a capital expense is worth it (equipment, property, an acquisition, hiring, technology), or for ROI, IRR, NPV, pay | LICENSE |
| `business-model-canvas` | Builds and audits a nine-block Business Model Canvas, tracing each segment through value, channel and revenue and naming the riskiest assump | LICENSE |
| `business-name-fit` | Use when naming a company, brand or product, or checking whether a name works abroad, before committing to one. Tests a culturally rooted na | LICENSE |
| `business-operations-skills` | Route internal operations requests to the right BizOps skill: process, vendors, capacity, internal comms, SOPs, procurement. Use whenever th | LICENSE |
| `buyer-list` | Build and organize a universe of potential acquirers for sell-side M&A processes. Identifies strategic and financial buyers, assesses fit, a | LICENSE |
| `c-level-agents` | Use when the founder wants a virtual executive team or a /c-level-agents command. Lists the 13 C-suite agents and 21 commands and routes mul | LICENSE |
| `c-level-skills` | Find which C-level advisor fits a question: 14 C-suite roles, board meetings, culture, M&A. Use whenever the user asks which advisor to use. | LICENSE |
| `caio-review` | Use for /c-level-agents:caio-review, or to challenge a plan involving AI (no eval set, API vs fine-tune vs self-host, EU AI Act class). | LICENSE |
| `calendar-prep` | Generate one-page meeting briefings from structured input (attendees, prior context, decisions needed). Use before customer calls, board mee | LICENSE |
| `call-prep` | Prepare for a customer or prospect call using Common Room signals. Triggers on 'prep me for my call with [company]', 'prepare for a meeting  | LICENSE |
| `campaign-analytics` | Analyze campaign performance on the user's numbers: ROAS, CPA, ROI, multi-touch attribution and funnel drop-off. Use whenever the user asks  | LICENSE |
| `campaign-planner` | Plan comprehensive marketing campaigns from strategy through execution. Develop campaign briefs, select optimal channels, create timelines,  | LICENSE |
| `canned-responses` | Generate templated responses for common legal inquiries and identify when situations require individualized attention. Use when responding t | LICENSE |
| `capa-officer` | Use for CAPA work in a medical device QMS: root cause analysis (5-Why, fishbone), corrective action plans, effectiveness checks or CAPA metr | LICENSE |
| `capacity-planner` | Size an ops or support team and plan headcount: Erlang C queue models, utilization risk, hiring order. Use whenever the user asks how many a | LICENSE |
| `capture` | Use whenever the user unloads a messy brain dump of ideas, tasks and plans ('capture this', 'brain dump', a long unstructured paste) and wan | LICENSE |
| `catalyst-calendar` | Build and maintain a calendar of upcoming catalysts across a coverage universe — earnings dates, conferences, product launches, regulatory d | LICENSE |
| `caveman` | Terse mode: drop filler, articles and pleasantries, keep technical accuracy, about 75% fewer tokens, and stay in it. Load whenever the user  | LICENSE |
| `cco-review` | Challenge a churn, retention, segment or CS hiring plan. Use whenever asked or /c-level-agents:cco-review. | LICENSE |
| `ccpa-cpra-privacy-expert` | CCPA and CPRA California privacy compliance. Use for CCPA/CPRA readiness assessments, personal information data mapping, consumer rights han | LICENSE |
| `cdo-review` | Use for /c-level-agents:cdo-review, or to challenge a plan touching training-data rights, data architecture or data monetization. | LICENSE |
| `ceo-advisor` | Advice for a CEO or founder on running the company: board and investor trouble, raise or cut, strategy bets, org and culture. Load whenever  | LICENSE |
| `cfo-advisor` | Startup finance: runway and burn, unit economics (LTV, CAC, payback), fundraising and dilution. Load whenever the user asks how long the cas | LICENSE |
| `cfo-review` | Challenge a plan that spends real money: hiring wave, raise, channel budget. Use whenever asked or /c-level-agents:cfo-review. | LICENSE |
| `challenge` | Pre-mortem a plan: assume it failed in 12 months and work back to the assumptions, dependencies and execution risks. Use whenever the user w | LICENSE |
| `change-management` | Use when rolling out a reorg, pivot, tool switch, leadership change or product kill. Plans it with ADKAR, communication templates and resist | LICENSE |
| `changelog-automation` | Automate changelog generation from commits, PRs, and releases following Keep a Changelog format. Use when setting up release workflows, gene | LICENSE |
| `changelog-generator` | Write release notes and CHANGELOG.md from commits and pick the next semver version. Use whenever the user is cutting a release, asks what ch | LICENSE |
| `channel-economics` | Use for a direct vs partner channel review: fully loaded cost to serve, channel ROI and the best channel mix under constraints. Runs cost_to | LICENSE |
| `chaos-engineering` | Use before running a chaos experiment, gameday or fault injection, or after one to write it up. Designs it with steady state and abort crite | LICENSE |
| `check-model` | Debug and audit financial models for errors — circular references, broken formulas, hardcoded overrides, balance sheet imbalances, cash flow | LICENSE |
| `checkpoint-promotion` | Gate fine-tuned checkpoints with drift budgets, paired comparison, and forgetting checks before promotion. Use after a training run produces | LICENSE |
| `chief-ai-officer-advisor` | Use for AI strategy decisions: API vs fine-tune vs build, EU AI Act or US state risk classification, when self-hosting pays off, or AI hirin | LICENSE |
| `chief-customer-officer-advisor` | Use for retention strategy, customer segmentation or CS team sizing decisions (GRR vs NRR, churn causes, pooled vs named CSMs). Runs retenti | LICENSE |
| `chief-data-officer-advisor` | Use for data strategy decisions: training models on customer data, warehouse vs lakehouse vs mesh, valuing data for a raise or M&A, or data  | LICENSE |
| `chief-of-staff` | Use when a founder question needs routing to the right C-suite advisor, or a cross-functional decision needs a board meeting convened. Loads | LICENSE |
| `chro-advisor` | People strategy: hiring plans, comp bands, org structure, performance, retention. Use whenever the user asks who to hire, what to pay, how t | LICENSE |
| `churn-analysis` | Analyze customer churn patterns, identify at-risk accounts, create retention playbooks, and build early warning systems | LICENSE |
| `churn-prevention` | Use when designing a cancel flow, save offers, exit surveys or dunning emails, or cutting failed-payment churn. Sizes the revenue at stake w | LICENSE |
| `ci-cd-pipeline-builder` | Generate a CI/CD workflow for a repo from its detected stack: lint, test, build, deploy. Load whenever the user says the repo has no CI, wan | LICENSE |
| `cim-builder` | Structure and draft a Confidential Information Memorandum for sell-side M&A processes. Organizes company information into a professional, in | LICENSE |
| `cinematic-shot-prompting` | Use when creating camera movement, cinematic angles, or motion prompts for AI video generators like Runway Gen-3, Kling, and Luma. Compiles  | LICENSE |
| `ciso-advisor` | Use for security leadership decisions: a security program, budget justification in dollars, SOC 2 vs ISO 27001 vs HIPAA roadmap, or board se | LICENSE |
| `ciso-review` | Challenge a plan touching customer data, compliance or prod access. Use when asked or /c-level-agents:ciso-review. | LICENSE |
| `claude-coach` | Use when the user wants to get better at using Claude ('coach me', 'teach me Claude tricks', 'make me a power user'). Rates their prompts wi | LICENSE |
| `claude-code-mastery` | Optimizes CLAUDE.md files, scaffolds skills and subagents, wires hooks and measures context budget for Claude Code. Use when writing or trim | LICENSE |
| `client-report` | Generate professional client-facing performance reports with portfolio returns, allocation breakdowns, and market commentary. Suitable for q | LICENSE |
| `client-review` | Prepare for client review meetings with portfolio performance summary, allocation analysis, talking points, and action items. Pulls together | LICENSE |
| `climate-tech-advisor` | Strategic advisory for climate-tech founders on carbon markets, GHG accounting, climate regulation, and funding. Use when scoping a climate- | LICENSE |
| `clinical-research` | Use when designing a prospective clinical study: choosing primary and secondary endpoints, estimating sample size and power, or scoring feas | LICENSE |
| `cloud-finops` | Use for any cloud cost question on AWS, Azure or Google Cloud - a bill that jumped or one service that spiked (NAT gateway, egress, storage) | LICENSE |
| `cloud-security` | Use when checking AWS, Azure or GCP for security misconfigurations: IAM privilege escalation, public buckets, open security groups, IaC gaps | LICENSE |
| `cmmc-readiness` | Use when a defense contractor or subcontractor is preparing for a CMMC 2.0 Level 2 self-assessment or C3PAO assessment, calculating or check | LICENSE |
| `cmo-advisor` | Marketing leadership: positioning, product-led vs sales-led vs community-led growth, budget split across channels, marketing team design. Us | LICENSE |
| `cmo-review` | Use for /c-level-agents:cmo-review, or to challenge positioning, ICP, messaging or channel mix before a launch. | LICENSE |
| `code-review` | Review code for bugs, security vulnerabilities, performance issues, and maintainability. Trigger with "review this code", "check this PR", " | LICENSE |
| `code-review-excellence` | Master effective code review practices to provide constructive feedback, catch bugs early, and foster knowledge sharing while maintaining te | LICENSE |
| `code-reviewer` | Use for any code review: a pull request, a diff, a commit, or a pasted function, handler or file in TypeScript, JavaScript, Python, Go, Swif | LICENSE |
| `code-to-prd` | Use when asked to write a PRD or product spec from an existing codebase (reverse-engineer requirements, document pages, fields, routes and e | LICENSE |
| `code-tour` | Use when asked for a CodeTour .tour file or a step-by-step code walkthrough (onboarding, architecture, PR review, how X works). Writes perso | LICENSE |
| `codebase-onboarding` | Explain an unfamiliar repo: architecture brief and onboarding docs. Use whenever someone is new to a codebase, asks how a project is structu | LICENSE |
| `codex-cli-specialist` | Converts Claude Code skills to OpenAI Codex format (agents/openai.yaml), checks dual-platform compatibility and builds a skills index. Use w | LICENSE |
| `coding-agent-rollout` | Roll out Claude Code to a team: shared or managed settings, MCP and plugin approval, layered CLAUDE.md, adoption. Use whenever the user sets | LICENSE |
| `cold-email` | Use for any cold outreach or SDR email or follow-up sequence to prospects who did not opt in, before drafting. Scores the sequence for lengt | LICENSE |
| `collab-proof` | Use for /collab-proof or a session retrospective on what Claude contributed versus what the user drove. Builds an evidence-backed split of t | LICENSE |
| `commercial-forecaster` | Use when building a bookings, ARR, pipeline or NRR forecast, or a commit, best-case and pipeline board number. Forecasts with bookings_forec | LICENSE |
| `commercial-policy` | Use when writing or revising discount rules: discount matrix, approver thresholds, exception flows and the deal framework sales works under. | LICENSE |
| `commercial-skills` | Use when a commercial request needs routing (pricing, deal review, discounts, partners, channels, policy, RFPs, forecasts): 'review this dea | LICENSE |
| `commit-craft` | Turn a mix of changes into clean, reviewable commits with good messages, blocking staged secrets and .env files. Use whenever the user says  | LICENSE |
| `company-os` | Use when choosing or setting up how the company runs: EOS, Scaling Up or OKRs, accountability chart, scorecard, meeting rhythm, quarterly ro | LICENSE |
| `compensation-benchmarking` | TRIGGER THIS when researching market salaries, building compensation strategies, creating salary bands, analyzing pay equity, conducting sal | LICENSE |
| `competitive-ads-extractor` | Extracts and analyzes competitors' ads from ad libraries (Facebook, LinkedIn, etc.) to understand what messaging, problems, and creative app | LICENSE |
| `competitive-analysis` | Framework for competitive landscape analysis across any industry. Use when creating competitor analysis, market positioning assessments, inv | LICENSE |
| `competitive-intel` | Use for competitor analysis, battlecards, win/loss review or positioning against alternatives. Builds a tracking system that feeds positioni | LICENSE |
| `competitive-intelligence` | Research your competitors and build an interactive battlecard. Outputs an HTML artifact with clickable competitor cards and a comparison mat | LICENSE |
| `competitive-landscape` | Analyze competition, identify differentiation opportunities, and develop winning market positioning strategies using Porter's Five Forces, B | LICENSE |
| `competitive-teardown` | Deep competitor teardown: pricing, reviews, hiring, SEO, UX, scored across 12 dimensions with SWOT and positioning maps. Use whenever the us | LICENSE |
| `competitor-alternatives` | Use when creating an 'X vs Y', '[product] alternative' or comparison page, before drafting. Builds the comparison matrix with comparison_mat | LICENSE |
| `compliance` | Navigate privacy regulations (GDPR, CCPA), review DPAs, and handle data subject requests. Use when reviewing data processing agreements, res | LICENSE |
| `compliance-os` | Use when running several compliance frameworks at once: which apply, where controls overlap, a mock audit or one evidence checklist. Runs fr | LICENSE |
| `compliance-readiness` | Use for /compliance-os:compliance-readiness, or before adding a framework or planning the annual audit calendar. | LICENSE |
| `compliance-tracking` | Track compliance requirements and audit readiness. Trigger with "compliance", "audit prep", "SOC 2", "ISO 27001", "GDPR", "regulatory requir | LICENSE |
| `compose-outreach` | Generate personalized outreach messages using Common Room signals. Triggers on 'draft outreach to [person]', 'write an email to [name]', 'co | LICENSE |
| `computer-use-automation` | Decides when a GUI-driving (computer-use) agent beats an API and lints planned screen actions for missing confirmation, verification and gro | LICENSE |
| `confluence-expert` | Use when building or restructuring a Confluence space: page hierarchy, permissions, templates, Jira macros or a content audit. Generates str | LICENSE |
| `connectivity-triage` | Use this skill when debugging active macOS connectivity failures, when an API or MCP service times out or disconnects, when DNS resolution i | LICENSE |
| `contact-research` | Research a specific person using Common Room data. Triggers on 'who is [name]', 'look up [email]', 'research [contact]', 'is [name] a warm l | LICENSE |
| `content-creator` | Use when someone asks for 'content creator' by name. Deprecated alias: hands writing to content-production and planning to content-strategy. | LICENSE |
| `content-humanizer` | Make a draft sound less like AI: fix generic, robotic text with rhythm, specifics, personality and brand voice. Use whenever the user says c | LICENSE |
| `content-production` | Write a blog post, article or guide end to end: research, outline, draft, SEO pass and quality gates. Use whenever the user asks to write a  | LICENSE |
| `content-research-writer` | Assists in writing high-quality content by conducting research, adding citations, improving hooks, iterating on outlines, and providing real | LICENSE |
| `context-driven-development` | Creates and maintains project context artifacts (product.md, tech-stack.md, workflow.md, tracks.md) in a `conductor/` directory. Scaffolds n | LICENSE |
| `context-engine` | Use when starting a C-suite advisor session, when company context is missing or older than 90 days, or before company data goes to an extern | LICENSE |
| `contract-and-proposal-writer` | Use when drafting a freelance contract, proposal, SOW, NDA or MSA for US, EU, UK or DACH jurisdictions. Writes structured Markdown with docx | LICENSE |
| `contract-negotiation` | Prepare for contract negotiations with term analysis, BATNA preparation, negotiation playbooks, and comparison frameworks | LICENSE |
| `contract-review` | Contract review assistant analyzing agreements against playbooks. GREEN/YELLOW/RED severity. Use when reviewing vendor contracts, SaaS agree | LICENSE |
| `conversational-ads` | Plan, write and measure ads inside AI assistants and AI search (ChatGPT Ads, Google AI Overviews and AI Mode, Microsoft Copilot). Use when t | LICENSE |
| `coo-advisor` | Use for operations leadership: process design, OKR execution, operating cadence, bottlenecks or scaling playbooks. Tracks OKRs with okr_trac | LICENSE |
| `copy-editing` | Edit, proofread and tighten existing marketing copy in focused passes: clarity, voice, proofreading, specificity, readability and AI tells.  | LICENSE |
| `cost-optimization` | Optimize cloud costs across AWS, Azure, GCP, and OCI through resource rightsizing, tagging strategies, reserved instances, and spending anal | LICENSE |
| `coverage` | Find what is not tested: map untested pages and flows and coverage gaps. Use whenever the user asks what needs tests, about missing tests or | LICENSE |
| `cpo-advisor` | Product leadership: PMF measurement, product vision, portfolio investment, product org design, board product reporting. Use whenever the use | LICENSE |
| `cpo-review` | Challenge a roadmap, PMF claim or feature kill. Use whenever asked or /c-level-agents:cpo-review. | LICENSE |
| `cqrs-implementation` | Implement Command Query Responsibility Segregation for scalable architectures. Use when separating read and write models, optimizing query p | LICENSE |
| `cra-readiness` | Use when a company that sells software, connected devices or firmware in the EU asks whether the Cyber Resilience Act (CRA, Regulation 2024/ | LICENSE |
| `create-an-asset` | Generate tailored sales assets (landing pages, decks, one-pagers, workflow demos) from your deal context. Describe your prospect, audience,  | LICENSE |
| `create-prd` | Write an 8-section product requirements document, framing the problem before the solution. Use when specifying a new product or a large feat | LICENSE |
| `cro-advisor` | Use for B2B revenue leadership: forecasting, quotas, sales model, NRR and churn, pricing or sales capacity. Forecasts with revenue_forecast_ | LICENSE |
| `cro-review` | Challenge a forecast, win-rate drop or sales hires. Use whenever asked or /c-level-agents:cro-review. | LICENSE |
| `cross-eval` | Use for /c-level-agents:cross-eval, or when a high-stakes memo needs independent review by several models before the boardroom. | LICENSE |
| `cs-onboard` | Use when setting up the C-suite advisors for the first time, or when company context is missing or stale after a raise or pivot. Interviews  | LICENSE |
| `csv-data-summarizer` | Analyzes CSV files, generates summary stats, and plots quick visualizations using Python and pandas. | LICENSE |
| `cto-advisor` | CTO decisions: tech debt, architecture direction, scaling the engineering team, technology evaluation, DORA metrics. Use whenever the user a | LICENSE |
| `cto-review` | Challenge an architecture bet, 10x scaling plan or rebuild vs buy. Use whenever asked or /c-level-agents:cto-review. | LICENSE |
| `culture-architect` | Use when defining company values, turning them into behaviors, assessing culture health or designing rituals. Treats culture as operating be | LICENSE |
| `customer-feedback-triage` | Cluster, score and route inbound feature requests from support, sales, NPS and exec asks, and draft honest replies. Use when a feedback queu | LICENSE |
| `customer-interview-script` | Writes and times a customer interview script that collects past-behavior stories, not opinions. Use when preparing a discovery, solution-val | LICENSE |
| `customer-research` | Research customer questions by searching across documentation, knowledge bases, and connected sources, then synthesize a confidence-scored a | LICENSE |
| `customer-success-manager` | Use when reviewing customer accounts for health, churn risk or expansion. Scores health with health_score_calculator.py, churn with churn_ri | LICENSE |
| `cycle-time-analyzer` | Compute lead time, cycle time, throughput, WIP, aging WIP and a cumulative flow diagram from issue status history. Use when diagnosing slow  | LICENSE |
| `daci-framework` | Assign Driver, Approver, Contributor and Informed roles for the decisions that keep stalling, then roll the chart out. Use when decisions th | LICENSE |
| `daily-briefing` | Start your day with a prioritized sales briefing. Works standalone when you tell me your meetings and priorities, supercharged when you conn | LICENSE |
| `data-analyst` | Data analysis across SQL, visualization, statistics, and reporting. Use when writing SQL queries, building dashboards, performing cohort or  | LICENSE |
| `data-breach-response` | Data breach incident response with ENISA severity scoring, notification timelines, and compliance tracking. Use for breach assessment and re | LICENSE |
| `data-context-extractor` | Generate or improve a company-specific data analysis skill by extracting tribal knowledge from analysts. BOOTSTRAP MODE - Triggers: "Create  | LICENSE |
| `data-exploration` | Profile and explore datasets to understand their shape, quality, and patterns before analysis. Use when encountering a new dataset, assessin | LICENSE |
| `data-quality-auditor` | Use before analysis or model training on any dataset, or when asked to profile data or hunt missing values and outliers. Profiles it with da | LICENSE |
| `data-quality-frameworks` | Implement data quality validation with Great Expectations, dbt tests, and data contracts. Use when building data quality pipelines, implemen | LICENSE |
| `data-scientist` | Data science across machine learning, statistical modeling, and experimentation. Use when selecting ML algorithms, engineering features, des | LICENSE |
| `data-storytelling` | Transform data into compelling narratives using visualization, context, and persuasive structure. Use when presenting analytics to stakehold | LICENSE |
| `data-validation` | QA an analysis before sharing with stakeholders — methodology checks, accuracy verification, and bias detection. Use when reviewing an analy | LICENSE |
| `data-visualization` | Create effective data visualizations with Python (matplotlib, seaborn, plotly). Use when building charts, choosing the right chart type for  | LICENSE |
| `database-designer` | Design a database schema: tables, relationships, indexes, normalization, SQL vs NoSQL, migration plans. Use whenever the user asks how to st | LICENSE |
| `database-migration` | Execute database migrations across ORMs and platforms with zero-downtime strategies, data transformation, and rollback procedures. Use when  | LICENSE |
| `database-schema-designer` | Use when asked for an ERD, table relationships, normalization or a schema migration plan. Produces the ERD and normalized DDL with migration | LICENSE |
| `datapack-builder` | Build professional financial services data packs from various sources including CIMs, offering memorandums, SEC filings, web search, or MCP  | LICENSE |
| `dataset-curation` | Prepare, format, and validate datasets for supervised fine-tuning and preference training. Use when converting raw data into training format | LICENSE |
| `dbt-transformation-patterns` | Master dbt (data build tool) for analytics engineering with model organization, testing, documentation, and incremental strategies. Use when | LICENSE |
| `dcf-model` | Real DCF (Discounted Cash Flow) model creation for equity valuation. Retrieves financial data from SEC filings and analyst reports, builds c | LICENSE |
| `dd-checklist` | Generate and track comprehensive due diligence checklists tailored to the target company's sector, deal type, and complexity. Covers all maj | LICENSE |
| `dd-meeting-prep` | Prepare for due diligence meetings — management presentations, expert network calls, customer references, and advisor sessions. Generates ta | LICENSE |
| `ddd:software-architecture` | Guide for quality focused software architecture. This skill should be used when users want to write code, design architecture, analyze code, | LICENSE |
| `deal-desk` | Use before closing a deal that needs a discount beyond AE authority, has a redlined MSA or unclear per-deal economics. Scores it with deal_s | LICENSE |
| `deal-screening` | Quickly screen inbound deal flow — CIMs, teasers, and broker materials — against the fund's investment criteria. Extracts key deal metrics,  | LICENSE |
| `deal-sourcing` | PE deal sourcing workflow — discover target companies, check CRM for existing relationships, and draft personalized founder outreach emails. | LICENSE |
| `deal-tracker` | Track multiple live deals with milestones, deadlines, action items, and status updates. Maintains a deal pipeline view and surfaces upcoming | LICENSE |
| `debugging-strategies` | Master systematic debugging techniques, profiling tools, and root cause analysis to efficiently track down bugs across any codebase or techn | LICENSE |
| `decide` | Use for /c-level-agents:decide, or right after the founder approves a boardroom memo, to log it as a durable decision. | LICENSE |
| `decision-logger` | Use when logging a decision after a board meeting, reviewing past decisions or checking overdue actions. Keeps raw transcripts and approved  | LICENSE |
| `decision-questionnaire` | Turn a blocked decision into an async questionnaire a stakeholder can answer without a meeting. Use when you need someone else's input to de | LICENSE |
| `deep-learning-book` | Use when studying or applying Goodfellow, Bengio and Courville's Deep Learning, or asking if its advice still holds. Indexes all 20 chapters | LICENSE |
| `deep-module-design` | Design deep modules with small interfaces and rank shallow, pass-through or leaky code for deepening. Use when designing a module interface, | LICENSE |
| `deep-research` | Execute autonomous multi-step research using Google Gemini Deep Research Agent. Use for: market analysis, competitive landscaping, literatur | LICENSE |
| `deep-work` | Use when someone wants to plan a deep work day, time-block their calendar or task list, budget or cut shallow work, protect focus hours, tra | LICENSE |
| `deepread` | Use when the user asks to deeply read a book, article, PDF, or document set; extract claims and evidence; build a knowledge map; or learn th | LICENSE |
| `defi-protocol-templates` | Implement DeFi protocols with production-ready templates for staking, AMMs, governance, and flash loans. Use when building decentralized fin | LICENSE |
| `dei-strategy` | TRIGGER THIS when building DEI strategy, creating diversity goals, designing inclusive programs, building equity analyses, developing traini | LICENSE |
| `delivery-manager` | Plans releases, picks deployment strategies, runs incidents and tracks DORA metrics and error budgets. Use when preparing a Go/No-Go, choosi | LICENSE |
| `demo-video` | Use when asked for a demo video, product walkthrough, feature showcase or GIF from screenshots or scene descriptions. Orchestrates playwrigh | LICENSE |
| `dependency-auditor` | Audit project dependencies for CVEs and licenses and plan safe upgrades. Use whenever the user asks if their packages are safe, before a rel | LICENSE |
| `dependency-map` | Track cross-team dependencies in one JSON file and get a risk-ranked blocker list, the longest hand-off chain and a Mermaid graph. Use when  | LICENSE |
| `dependency-upgrade` | Manage major dependency version upgrades with compatibility analysis, staged rollout, and comprehensive testing. Use when upgrading framewor | LICENSE |
| `deployment-pipeline-design` | Design multi-stage CI/CD pipelines with approval gates, security checks, and deployment orchestration. Use this skill when designing zero-do | LICENSE |
| `design-auditor` | Grade a UI (Design, AI-slop and Accessibility, A-F) and gate it in CI: batch WCAG contrast, token compliance, slop detection. Use when asked | LICENSE |
| `design-direction` | Turns a product brief into a design-system spec: style direction, contrast-checked palette, type pairing, tokens, UX rules and chart choices | LICENSE |
| `design-qa` | Use when a UI screen, page or component is about to be called done, handed off or shipped, or when generated UI looks generic or half-finish | LICENSE |
| `design-system` | Use when setting up brand settings before the first markdown-to-HTML conversion, or changing them. Runs a 10-question onboarding with onboar | LICENSE |
| `design-system-lead` | Design systems leadership across component libraries, design tokens, and design-dev collaboration. Use when architecting a token system, bui | LICENSE |
| `design-system-patterns` | Build scalable design systems with design tokens, theming infrastructure, and component architecture patterns. Use when creating design toke | LICENSE |
| `developer-growth-analysis` | Analyzes your recent Claude Code chat history to identify coding patterns, development gaps, and areas for improvement, curates relevant lea | LICENSE |
| `devops-workflow-engineer` | Generate and optimize GitHub Actions CI/CD workflows. Use when designing workflows, planning multi-environment deployments, optimizing pipel | LICENSE |
| `discover-brand` | This skill orchestrates autonomous discovery of brand materials across enterprise platforms (Notion, Confluence, Google Drive, Box, SharePoi | LICENSE |
| `distributed-tracing` | Implement distributed tracing with Jaeger and Tempo to track requests across microservices and identify performance bottlenecks. Use when de | LICENSE |
| `doc-drift-detector` | Detect documentation drift against code changes, score staleness, validate API docs via AST parsing, and audit link integrity. Use when docs | LICENSE |
| `docker-development` | Use for any Dockerfile or docker-compose file to write, optimize or review, before editing it. Checks layers, caching, size and security wit | LICENSE |
| `documentation` | Write and maintain technical documentation. Trigger with "write docs for", "document this", "create a README", "write a runbook", "onboardin | LICENSE |
| `docx-toolkit` | Audit Microsoft Word (.docx) documents for heading hierarchy, comments, tracked changes, and style consistency. Use when reviewing a contrac | LICENSE |
| `domain-modeling` | Keep a project glossary of domain terms and lightweight decision records, and catch banned synonyms in docs and code. Use when terms are use | LICENSE |
| `domain-name-brainstormer` | Generate and score candidate brand, product, and domain names for memorability and pronounceability. Use when naming a new product, company, | LICENSE |
| `dora-compliance-expert` | DORA (EU 2022/2554) digital operational resilience compliance for financial entities, covering all 5 pillars. Use for DORA readiness assessm | LICENSE |
| `dora-readiness` | Use when a bank, payment or e-money institution, investment firm, insurer, crypto-asset service provider or fund manager in the EU faces DOR | LICENSE |
| `dossier` | Use for diligence or meeting prep on a specific company, person or organization ('prep me for a meeting with X', 'due diligence on Y'). Test | LICENSE |
| `dotnet-backend-patterns` | Master C#/.NET backend development patterns for building robust APIs, MCP servers, and enterprise applications. Covers async/await, dependen | LICENSE |
| `dpia-assessment` | GDPR Art. 35 Data Protection Impact Assessment with threshold checking, risk registers, and EDPB criteria scoring. Use for DPIA evaluations. | LICENSE |
| `draft-outreach` | Research a prospect then draft personalized outreach. Uses web research by default, supercharged with enrichment and CRM. Trigger with "draf | LICENSE |
| `e2e-testing-patterns` | Master end-to-end testing with Playwright and Cypress to build reliable test suites that catch bugs, improve confidence, and enable fast dep | LICENSE |
| `earnings-analysis` | Create professional equity research earnings update reports (8-12 pages, 3,000-5,000 words) analyzing quarterly results for companies alread | LICENSE |
| `earnings-preview` | Build pre-earnings analysis with estimate models, scenario frameworks, and key metrics to watch. Use before a company reports quarterly earn | LICENSE |
| `earnings-preview-single` | Generate a concise 4-5 page equity research earnings preview for a single company. Analyzes the most recent earnings transcript, competitor  | LICENSE |
| `ecommerce-advisor` | Strategic advisory for e-commerce founders on unit economics, fulfillment models, payments, and channel strategy. Use when evaluating an eco | LICENSE |
| `edtech-advisor` | Strategic advisory for edtech founders on FERPA/COPPA compliance, K-12 vs higher-ed vs L&D dynamics, district sales, and pricing. Use when s | LICENSE |
| `email-marketing` | Create and optimize email marketing campaigns including sequences, newsletters, drip campaigns. Design subject line strategies, develop segm | LICENSE |
| `email-sequence` | Use for any drip, nurture, onboarding, welcome or re-engagement email sequence to opted-in users, before writing emails. Plans timing, trigg | LICENSE |
| `email-template-builder` | Use when adding or reworking transactional email (React Email templates, Resend, Postmark, SendGrid or SES, preview, i18n, dark mode, delive | LICENSE |
| `email-triage` | Classify a batch of emails into action categories (reply now, reply later, archive, delete, unsubscribe) and surface unsubscribe candidates. | LICENSE |
| `embedded-iot-mentor` | Use for any embedded or IoT hardware project (ESP32, STM32, Arduino, Pico, firmware, PCB, MQTT, Home Assistant, sensor dashboards), before b | LICENSE |
| `embedding-strategies` | Select and optimize embedding models for semantic search and RAG applications. Use when choosing embedding models, implementing chunking str | LICENSE |
| `employee-engagement-survey` | TRIGGER THIS when designing employee engagement surveys, analyzing employee feedback, creating action plans based on survey results, trackin | LICENSE |
| `employee-handbook-builder` | TRIGGER THIS when creating or updating employee handbooks, documenting HR policies, developing code of conduct, building benefits guides, or | LICENSE |
| `employment-contract-templates` | Create employment contracts, offer letters, and HR policy documents following legal best practices. Use when drafting employment agreements, | LICENSE |
| `engineering-advanced-skills` | Pick the right advanced engineering skill: agents, RAG, MCP, CI/CD, databases, observability, release. Use whenever the user asks which skil | LICENSE |
| `engineering-skills` | Find which engineering skill fits a task: architecture, frontend, backend, QA, DevOps, security, AI/ML, data, cloud. Use whenever the user i | LICENSE |
| `enrich-lead` | Instant lead enrichment. Drop a name, company, LinkedIn URL, or email and get the full contact card with email, phone, title, company intel, | LICENSE |
| `env-secrets-manager` | Use when auditing .env files, planning credential rotation, chasing a missing env var in production or hardening a repo against leaked secre | LICENSE |
| `eol-communication` | Plan and write end-of-life announcements with dated milestones, a working migration path and per-segment messages. Use when sunsetting a pro | LICENSE |
| `epic-design` | Use for any landing page, hero section or scroll-driven web design that should feel cinematic (parallax, scrollytelling, overlapping section | LICENSE |
| `error-handling-patterns` | Master error handling patterns across languages including exceptions, Result types, error propagation, and graceful degradation to build res | LICENSE |
| `escalation` | Structure and package support escalations for engineering, product, or leadership with full context, reproduction steps, and business impact | LICENSE |
| `eu-ai-act-specialist` | Use for EU AI Act (Regulation 2024/1689) compliance work: classifying an AI system's risk tier, planning the Art. 43 conformity route and An | LICENSE |
| `eval` | Rank finished AgentHub agents by metric or judge. Use when asked which agent won. | LICENSE |
| `eval-harness-first` | Build the evaluation harness that gates every fine-tuning run — golden sets, per-failure-mode graders, judge calibration, and base-model bas | LICENSE |
| `evaluation-methodology` | PluginEval quality methodology, covering dimensions, rubrics, and scoring formulas. Use this skill when understanding how plugin quality is  | LICENSE |
| `event-store-design` | Design and implement event stores for event-sourced systems. Use when building event sourcing infrastructure, choosing event store technolog | LICENSE |
| `execute` | Use for /c-level-agents:execute, or to turn an approved decision into a 90-day plan with weekly milestones and owners. | LICENSE |
| `executive-communication` | ACTIVATE when drafting all-hands speeches, investor updates, quarterly letters to stakeholders, press statements, CEO announcements, crisis  | LICENSE |
| `executive-mentor` | Use when a founder or executive needs a plan stress-tested, a dreaded decision made, a hard board meeting prepared or an honest post-mortem. | LICENSE |
| `experiment-designer` | Plan A/B tests and product experiments: hypotheses, sample size, priority, reading results. Use whenever the user asks if a test won, how lo | LICENSE |
| `extended-thinking-architect` | Recommend a reasoning-effort level or thinking budget for an LLM task, or a cheaper model plus a better prompt, and split effort across agen | LICENSE |
| `extract` | Turn a fix or pattern that keeps coming up into a reusable skill with SKILL.md, reference docs and examples. Use whenever the user runs /si: | LICENSE |
| `fable-goal` | Use when the user wants a /goal prompt rather than the build itself ('/fable-goal', 'turn this into a goal prompt', 'write the prompt that b | LICENSE |
| `fastapi-templates` | Create production-ready FastAPI projects with async patterns, dependency injection, and comprehensive error handling. Use when building new  | LICENSE |
| `fda-consultant-specialist` | Use for FDA medical device questions: 510(k) vs De Novo vs PMA, predicates and substantial equivalence, QMSR (21 CFR 820), HIPAA or device c | LICENSE |
| `fda-qsr-audit-prep` | Use for /compliance-os:fda-qsr-audit-prep, or before an FDA inspection, QMSR internal audit or Form 483 response. | LICENSE |
| `feature-flag-strategy` | Plan a flag-gated rollout: classify the flag, pick a rollout shape, set kill-switch thresholds and retire the flag. Use when planning a phas | LICENSE |
| `feature-flags-architect` | Use before adding, rolling out or retiring a feature flag or kill switch, or when flag debt piles up. Plans the rollout with rollout_planner | LICENSE |
| `feature-spec` | Write detailed feature specifications with functional requirements, edge cases, data models, API contracts, and UX flows. Create comprehensi | LICENSE |
| `file-conversion` | Use when the user needs a local file converted between common image, audio, video, document, or data formats. Select installed tools, preser | LICENSE |
| `file-organizer` | Intelligently organizes your files and folders across your computer by understanding context, finding duplicates, suggesting better structur | LICENSE |
| `finance-skills` | Pick the right finance skill: ratios, DCF, forecasts (financial-analyst), ARR, churn, CAC, LTV (saas-metrics-coach), month-end-close. Use wh | LICENSE |
| `financial-analyst` | Analyze financial statements, value a company with a DCF, explain budget variance, build rolling forecasts. Use whenever the user asks what  | LICENSE |
| `financial-plan` | Build or update a comprehensive financial plan covering retirement projections, education funding, estate planning, and cash flow analysis.  | LICENSE |
| `finetuning-method-selection` | Decide whether to fine-tune at all, and route to the right method (SFT, DPO/ORPO/KTO, GRPO/RLVR, continued pretraining) and base model. Use  | LICENSE |
| `fintech-advisor` | Strategic advisory for fintech founders on US/EU regulatory triggers, license-vs-partner, KYC/AML, and embedded finance. Use when scoping a  | LICENSE |
| `fix` | Diagnose and fix a failing or flaky Playwright test. Use whenever a test fails, passes only sometimes, breaks intermittently or needs fixing | LICENSE |
| `focused-fix` | Use when a whole feature or module is broken and needs fixing end to end ('make X work', 'the Y module is broken'). Maps every file and depe | LICENSE |
| `form-cro` | Use when a lead, contact, demo or checkout form is underperforming or being designed, before changing fields. Scores field friction with for | LICENSE |
| `founder-coach` | Use when a founder is the bottleneck, can't delegate, is burning out or is moving from IC to CEO. Covers delegation, energy and calendar aud | LICENSE |
| `founder-mode` | Use for /c-level-agents:founder-mode, or any founder strategy question that hasn't been routed yet. Sends it to the right C-suite advisor or | LICENSE |
| `free-tool-strategy` | Use when considering a free calculator, grader, checker or generator as a marketing asset, before building it. Estimates traffic, leads and  | LICENSE |
| `freeze` | Use for /c-level-agents:freeze, or to put a cooling-off lock on an irreversible decision made under pressure. | LICENSE |
| `fsi-comps-analysis` | Build institutional-grade comparable company analyses with operating metrics, valuation multiples, and statistical benchmarking in Excel/spr | LICENSE |
| `fsi-strip-profile` | Creates professional investment banking strip profiles (company profiles) for pitch books, deal materials, and client presentations. Generat | LICENSE |
| `full-page-screenshot` | Use when asked for a full-page or long screenshot of a web page. Captures SPA scroll containers, lazy images and very tall pages through Chr | LICENSE |
| `funding-digest` | Generate a polished one-page PowerPoint slide summarizing key takeaways from recent funding rounds and notable capital markets activity acro | LICENSE |
| `game-universe-studio` | Use when building a browser game prototype (Canvas, WebGL, Three.js, PixiJS, Babylon) and its character turnaround sheet, sprite set, proced | LICENSE |
| `gc-review` | Use for /c-level-agents:gc-review, or to challenge a term sheet, customer MSA, IP assignment or regulatory exposure before signing. | LICENSE |
| `gcp-cloud-architect` | Design, deploy and cut the cost of Google Cloud setups: Cloud Run, GKE, Functions, Cloud SQL, BigQuery, moving to GCP. Use whenever the user | LICENSE |
| `gdpr-audit-prep` | Use for /compliance-os:gdpr-audit-prep, or before a GDPR review, post-breach audit or DPA investigation. | LICENSE |
| `gdpr-data-handling` | Implement GDPR-compliant data handling with consent management, data subject rights, and privacy by design. Use when building systems that p | LICENSE |
| `gdpr-dsgvo-expert` | Use for GDPR or DSGVO work: scanning a codebase for privacy risks, writing a DPIA or tracking data subject requests against the Art. 12(3) d | LICENSE |
| `general-counsel-advisor` | Legal review of contracts and term sheets (MSA, SaaS, NDA, DPA, employment), IP strategy and regulatory exposure (HIPAA, GDPR, FDA, fintech) | LICENSE |
| `generate` | Use when asked to write Playwright or e2e tests for a page, component or feature ('write tests', 'add tests for', 'e2e test'). | LICENSE |
| `git-advanced-workflows` | Master advanced Git workflows including rebasing, cherry-picking, bisect, worktrees, and reflog to maintain clean history and recover from a | LICENSE |
| `git-guardrails` | Install a hook that blocks destructive git commands before an AI agent runs them. Use when an agent force-pushed or ran reset --hard, when a | LICENSE |
| `git-worktree-manager` | Use when running several branches or agents in parallel on one repo. Creates worktrees with isolated ports and env via worktree_manager.py a | LICENSE |
| `github-actions-templates` | Create production-ready GitHub Actions workflows for automated testing, building, and deploying applications. Use when setting up CI/CD with | LICENSE |
| `gitlab-ci-patterns` | Build GitLab CI/CD pipelines with multi-stage workflows, caching, and distributed runners for scalable automation. Use when implementing Git | LICENSE |
| `gitops-workflow` | Implement GitOps workflows with ArgoCD and Flux for automated, declarative Kubernetes deployments with continuous reconciliation. Use when i | LICENSE |
| `go-concurrency-patterns` | Master Go concurrency with goroutines, channels, sync primitives, and context. Use when building concurrent Go applications, implementing wo | LICENSE |
| `godot-gdscript-patterns` | Master Godot 4 GDScript patterns including signals, scenes, state machines, and optimization. Use when building Godot games, implementing ga | LICENSE |
| `google-workspace-cli` | Use for Google Workspace admin or automation from the gws CLI (Gmail, Drive, Sheets, Calendar, Docs, Chat, Tasks). Sets up auth with auth_se | LICENSE |
| `grade-iterate` | Use when a launched managed agent needs grading against a rubric and improving ('grade my agent', 'is it good enough'). Builds the outcome w | LICENSE |
| `grafana-dashboards` | Create and manage production Grafana dashboards for real-time visualization of system and application metrics. Use when building monitoring  | LICENSE |
| `grants` | Use for any NIH funding question ('find grants for my research', 'which NIH institute'). Maps the idea to institutes, study sections and NOS | LICENSE |
| `grill-me` | Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use  | LICENSE |
| `grill-with-docs` | Use when a plan should be stress-tested against the project's own docs (CONTEXT.md glossary, docs/adr decisions), or the user says 'grill wi | LICENSE |
| `grounded-vault` | Use when maintaining a durable Markdown knowledge store that agents compile from sources, when every number or quote in a wiki page must tra | LICENSE |
| `growth-marketer` | Growth marketing covering experimentation, funnel optimization, acquisition channels, retention, and viral growth. Use when designing A/B ex | LICENSE |
| `grpo-rlvr-training` | Train reasoning and verifiable-task behavior with GRPO and reinforcement learning from verifiable rewards (RLVR). Use when task success is a | LICENSE |
| `gtm-strategy` | Builds and audits a go-to-market plan: beachhead, motion matched to ACV, funded channels, tested messaging, owned metrics and a T-90 launch  | LICENSE |
| `guideline-generation` | This skill generates, creates, or builds brand voice guidelines from source materials. It should be used when the user asks to "generate bra | LICENSE |
| `hads` | Use when writing technical documentation that needs to be readable by both humans and AI models, converting existing docs to HADS format, va | LICENSE |
| `handoff` | Compact the current conversation into a handoff document for another agent to pick up, referencing existing artifacts (PRDs, plans, ADRs, is | LICENSE |
| `hard-call` | Use for a decision where every option hurts (layoff vs down round, killing a loved product). Runs 10/10/10 and regret minimization. | LICENSE |
| `healthtech-advisor` | Strategic advisory for digital health founders on HIPAA scope, FDA SaMD classification, EHR integration, and payor/provider GTM. Use when sc | LICENSE |
| `helm-chart-builder` | Use for any Helm chart to create, review or harden (values.yaml, templates, subcharts, RBAC, pod security), before editing it. Analyzes the  | LICENSE |
| `helm-chart-scaffolding` | Design, organize, and manage Helm charts for templating and packaging Kubernetes applications with reusable configurations. Use when creatin | LICENSE |
| `hermes-tweet` | Install and operate Hermes Tweet, a Hermes Agent plugin for X/Twitter research, timeline reading, tweet analysis, and approval-gated private | LICENSE |
| `hivemind` | Use when delegating grunt work to free opencode workers instead of spending Claude tokens: one worker or a scout, coder and tester swarm in  | LICENSE.txt |
| `hr-business-partner` | HR business partnership across talent strategy, org development, and employee relations. Use when building workforce plans, designing perfor | LICENSE |
| `hub-init` | Use for /hub-init, or to start an AgentHub competition: task, agent count and evaluation criteria. | LICENSE |
| `hub-run` | Use for /hub-run, or to run a whole AgentHub competition end to end: init, baseline, spawn, eval and merge. | LICENSE |
| `hub-status` | Use for /hub-status, or to check AgentHub agent progress, branches and DAG state. | LICENSE |
| `human-gate` | Use before shipping anything that needs human sign-off (a plan, spec, report, page, migration or irreversible action). Builds a review page  | LICENSE |
| `human-step-wizard` | Generate an interactive, resumable bash wizard that walks a person through steps only a human can do. Use when a task needs dashboard creden | LICENSE |
| `hybrid-cloud-networking` | Configure secure, high-performance connectivity between on-premises infrastructure and cloud platforms using VPN and dedicated connections.  | LICENSE |
| `hybrid-search-implementation` | Combine vector and keyword search for improved retrieval. Use when implementing RAG systems, building search engines, or when neither approa | LICENSE |
| `i18n-localization` | Use when adding UI text, adding or shipping a language, reviewing translation files, or building i18n into an app. Checks missing keys, plac | LICENSE |
| `ic-memo` | Draft a structured investment committee memo for PE deal approval. Synthesizes due diligence findings, financial analysis, and deal terms in | LICENSE |
| `idea-generation` | Systematic stock screening and investment idea sourcing. Combines quantitative screens, thematic research, and pattern recognition to surfac | LICENSE |
| `ideal-customer-profile` | Defines which accounts to sell to across eight dimensions with explicit exclusions, then scores real accounts against that profile. Use when | LICENSE |
| `identify-assumptions` | Surfaces the assumptions behind a product bet, scores impact against confidence and picks the few to test first. Use when an idea feels righ | LICENSE |
| `inbox-setup` | Use when setting up email triage for the first time, before inbox-triage, or when priorities change. Interviews the user one question at a t | LICENSE |
| `inbox-triage` | Use when the user wants their inbox processed ('triage my inbox', 'check my email'). Classifies recent mail with the inbox-setup knowledge b | LICENSE |
| `incident-commander` | Use when declaring or running a production incident or outage, or writing its post-incident review. Classifies severity with incident_classi | LICENSE |
| `incident-postmortem` | Write blameless incident postmortems with timeline reconstruction, root cause analysis, action items, and preventive measures | LICENSE |
| `incident-response` | Handle a suspected security breach: triage, SEV1-SEV4 severity, escalation and forensic evidence, per NIST SP 800-61. Use whenever the user  | LICENSE |
| `incident-runbook-templates` | Create structured incident response runbooks with step-by-step procedures, escalation paths, and recovery actions. Use this skill when build | LICENSE |
| `information-security-manager-iso27001` | Use when designing or running an ISO 27001 ISMS in HealthTech or MedTech: risk assessment, control implementation, certification or security | LICENSE |
| `infrastructure-compliance-auditor` | Cross-framework infrastructure security audit across cloud, network, and CI/CD. Use for infrastructure and cloud security audits, security p | LICENSE |
| `initiating-coverage` | Create institutional-quality equity research initiation reports through a 5-task workflow. Tasks must be executed individually with verified | LICENSE |
| `interaction-design` | Design and implement microinteractions, motion design, transitions, and user feedback patterns. Use when adding polish to UI interactions, i | LICENSE |
| `interactive-dashboard-builder` | Build self-contained interactive HTML dashboards with Chart.js, dropdown filters, and professional styling. Use when creating dashboards, bu | LICENSE |
| `interface-refinement` | Refine an existing interface with named commands (critique, polish, distill, typeset, colorize ...), a product and design context file, and  | LICENSE |
| `internal-narrative` | Use when preparing an all-hands, investor update, recruiting pitch or crisis message, or when stories told to different audiences drift apar | LICENSE |
| `interview` | Use when someone has an agent idea to scope before launch ('help me scope an agent'). Interviews them about the one job and writes a build s | LICENSE |
| `interview-kit-builder` | TRIGGER THIS when preparing interviews, planning hiring processes, creating interview questions, building evaluation frameworks, developing  | LICENSE |
| `interview-mapper` | Use when coding or making sense of one interview transcript (customer, JTBD, expert, usability, exit). Extracts verbatim-grounded nuggets wi | LICENSE |
| `interview-synthesis` | Turns customer interview notes into evidenced themes, an opportunity tree and follow-up questions. Use when you have just run interviews, ne | LICENSE |
| `interview-system-designer` | Use when designing a hiring loop, competency matrix, scoring rubric or question bank, or checking interviewer calibration. Plans the loop pe | LICENSE |
| `intl-expansion` | Use when expanding to a new country: market selection, entry mode, localization, regulation and regional go-to-market. | LICENSE |
| `inventory-forecasting` | Forecast inventory needs using demand analysis, safety stock calculations, reorder point optimization, and seasonal adjustment | LICENSE |
| `investment-proposal` | Create professional investment proposals for prospective clients. Covers the firm's approach, proposed allocation, expected outcomes, and fe | LICENSE |
| `investor-update-generator` | Validate a monthly investor update against a rubric of strong-update sections (transparency, decision-relevance, specific asks). Use before  | LICENSE |
| `invoice-organizer` | Categorize invoices and receipts by vendor, expense, and tax bucket, detect duplicates, and produce a tax-ready monthly summary. Use during  | LICENSE |
| `isms-audit-expert` | Use for ISO 27001 audit work: internal or surveillance audits, Annex A control evidence, Statement of Applicability, nonconformities, Stage  | LICENSE |
| `iso13485-audit-prep` | Use for /compliance-os:iso13485-audit-prep, or before an ISO 13485 internal audit or DHF closure. | LICENSE |
| `iso27001-audit-prep` | Use for /compliance-os:iso27001-audit-prep, or before an ISO 27001 internal, surveillance or stage 1 audit. | LICENSE |
| `iso42001-ai-management` | ISO 42001 AI Management System (AIMS) compliance. Use for ISO 42001 readiness assessments, AI governance planning, AI impact assessments, An | LICENSE |
| `iso42001-specialist` | Use for ISO/IEC 42001 AI management system work: gap analysis against Clauses 4-10, the AI risk register and Annex A controls, or the intern | LICENSE |
| `issue-triage` | Move engineering issues and external PRs through a triage state machine and write agent-ready briefs. Use when clearing a triage queue, deci | LICENSE |
| `istio-traffic-management` | Configure Istio traffic management including routing, load balancing, circuit breakers, and canary deployments. Use when implementing servic | LICENSE |
| `javascript-testing-patterns` | Implement comprehensive testing strategies using Jest, Vitest, and Testing Library for unit tests, integration tests, and end-to-end testing | LICENSE |
| `jira-expert` | Jira setup and queries: JQL, workflows, custom fields, automation, dashboards. Use whenever the user needs a Jira search, filter, dashboard  | LICENSE |
| `job-description-writer` | TRIGGER THIS when crafting job descriptions, posting new roles, defining position requirements, creating hiring briefs, updating JDs, or str | LICENSE |
| `job-stories` | Write When/Want/So backlog stories from observed user situations, gated on INVEST and outcome-focused acceptance criteria. Use when writing  | LICENSE |
| `jtbd-workshop` | Plans and runs a 2, 4 or 8-hour Jobs-To-Be-Done workshop: switch interviews, forces of progress, scored outcome statements. Use when you nee | LICENSE |
| `k8s-manifest-generator` | Create production-ready Kubernetes manifests for Deployments, Services, ConfigMaps, and Secrets following best practices and security standa | LICENSE |
| `k8s-security-policies` | Implement Kubernetes security policies including NetworkPolicy, PodSecurityPolicy, and RBAC for production-grade security. Use when securing | LICENSE |
| `kaizen:kaizen` | Use when Code implementation and refactoring, architecturing or designing systems, process and workflow improvements, error handling and val | LICENSE |
| `karpathy-coder` | Check a diff for overbuilt code: hidden assumptions, needless abstraction, non-surgical changes, unverified goals (Karpathy's four principle | LICENSE |
| `knowledge-management` | Write and maintain knowledge base articles from resolved support issues. Use when a ticket has been resolved and the solution should be docu | LICENSE |
| `knowledge-ops` | Use when writing, checking or cleaning up SOPs and runbooks. Generates them with sop_generator.py, checks 5W2H completeness and links with r | LICENSE |
| `knowledge-synthesis` | Combines search results from multiple sources into coherent, deduplicated answers with source attribution. Handles confidence scoring based  | LICENSE |
| `kpi-dashboard` | ACTIVATE when building executive dashboards, tracking business metrics, creating executive scorecards, monitoring organizational KPIs, setti | LICENSE |
| `kpi-dashboard-design` | Design effective KPI dashboards with metrics selection, visualization best practices, and real-time monitoring patterns. Use this skill when | LICENSE |
| `kubernetes-operator` | Use when building a Kubernetes operator or CRD (controller-runtime, kubebuilder, operator-sdk, KOPF), before writing the controller. Validat | LICENSE |
| `landing` | Use when asked for a premium single-file HTML landing page with 3D CSS, GSAP scroll effects and parallax. Locks positioning in a short intak | LICENSE |
| `landing-page-generator` | Use when asked for a landing, marketing or campaign page as a Next.js TSX component with Tailwind. Scaffolds it with landing_page_scaffolder | LICENSE |
| `langchain-architecture` | Design LLM applications using LangChain 1.x and LangGraph for agents, memory, and tool integration. Use when building LangChain applications | LICENSE |
| `langsmith-fetch` | Debug LangChain and LangGraph agents by fetching execution traces from LangSmith Studio. Use when debugging agent behavior, investigating er | LICENSE |
| `launch-economics` | Pre-launch unit economics, year-one cash model and a computed go/not-yet verdict for a new business. Use when asking "is this profitable", f | LICENSE |
| `launch-playbook` | Coordinate a launch from T-30 to T+30: owners, run-of-show, internal and external comms, rollback and retro. Use when a feature goes GA afte | LICENSE |
| `launch-strategy` | Plan a product or feature launch: readiness score and a phased plan by channel. Use whenever the user is launching soon, planning a Product  | LICENSE |
| `lbo-model` | This skill should be used when completing LBO (Leveraged Buyout) model templates in Excel for private equity transactions, deal materials, o | LICENSE |
| `lead-research-assistant` | Identifies high-quality leads for your product or service by analyzing your business, searching for target companies, and providing actionab | LICENSE |
| `lead-researcher` | Qualify and prioritize sales leads against an ICP, score lead lists, and draft personalized outreach hooks. Use when building a target accou | LICENSE |
| `lean-canvas` | Sketches a one-page startup model as testable hypotheses: problem, early adopters, value proposition, unfair advantage, riskiest assumptions | LICENSE |
| `learning-workspace` | Set up and run a multi-session study workspace with mission, curriculum, lessons and spaced review. Use when learning a topic over weeks, re | LICENSE |
| `legal-canned-responses` | Generate templated responses for common legal inquiries with escalation detection. Use when drafting legal responses. | LICENSE |
| `legal-meeting-briefing` | Prepare structured briefings for meetings with legal relevance and track action items. Use when prepping legal meetings. | LICENSE |
| `legal-red-team` | Adversarial verification for AI-generated legal content. Use when fact-checking legal documents, validating citations, detecting hallucinati | LICENSE |
| `legal-risk-assessment` | Structured legal risk assessment with 5x5 Severity x Likelihood matrix. Use for risk scoring, risk registers, escalation decisions, and risk | LICENSE |
| `linear-expert` | Administers Linear teams, cycles, projects and triage, and writes GraphQL API calls. Use when setting up or fixing a Linear workspace, scrip | LICENSE |
| `linkedin-analytics` | Use when someone asks why their LinkedIn reach dropped, which posts worked, whether a pattern is real or how to test one. Analyzes posts wit | LICENSE |
| `linkedin-comment-writer` | Drafts comments on other people's LinkedIn posts that add a specific the post lacked, then gates them offline. Use when commenting on a post | LICENSE |
| `linkedin-content` | Write, edit or review a LinkedIn post: story, how-to, carousel, video script or poll. Use whenever the user wants a LinkedIn post, asks if t | LICENSE |
| `linkedin-content-planner` | Builds a weekly or monthly LinkedIn publishing plan from content pillars, a posting cadence and a format mix, with a founder-oriented pillar | LICENSE |
| `linkedin-content-repurposer` | Turns something made for another channel (a thread, a video or talk transcript, a blog post, a newsletter) into a post that reads as native  | LICENSE |
| `linkedin-employee-advocacy` | Designs and runs an employee advocacy programme: who posts what and how often, review rules, and what is never scripted. Use when getting a  | LICENSE |
| `linkedin-engagement` | Use for LinkedIn comments, connection notes, DMs or outreach plans, or checking outreach volume is safe. Plans targets with comment_target_p | LICENSE |
| `linkedin-engagement-analytics` | Segments who reacted to and commented on a post from a CSV or JSON export, and says whether it reached the intended audience. Use when revie | LICENSE |
| `linkedin-hook-analyzer` | Extracts and classifies the opening-line pattern of LinkedIn posts the user pastes or saves, and turns each into a reusable slot template wi | LICENSE |
| `linkedin-humanizer` | Audits and rewrites LinkedIn drafts to remove machine-sounding patterns: tiered tell catalogue, emoji-pattern scoring, rule explanations, an | LICENSE |
| `linkedin-post-writer` | Drafts LinkedIn posts from a brief: picks an angle and opening pattern the author's real material supports, structures the body, and gates t | LICENSE |
| `linkedin-profile` | Use when auditing or rewriting a LinkedIn profile (headline, About, experience, Featured). Scores the headline with headline_scorer.py, audi | LICENSE |
| `linkedin-profile-optimizer` | Audits and rewrites a LinkedIn profile from pasted text: headline, About, experience, skills, Featured, banner and photo. Use when reviewing | LICENSE |
| `linkedin-reply-manager` | Triages a pasted LinkedIn comment section and drafts replies: which comments to answer, in what order, which to ignore. Use when answering c | LICENSE |
| `linkedin-skills` | Use for any organic LinkedIn growth request (strategy, profile, posts, cadence, outreach, analytics). Checks it against LinkedIn's rules wit | LICENSE |
| `linkedin-story-interviewer` | Interviews a person to surface what they actually have to say, and keeps the answers in a local story bank file that later LinkedIn drafts d | LICENSE |
| `linkedin-strategy` | Build a LinkedIn plan rather than a post: content pillars, positioning, a sustainable cadence, whether to start a newsletter. Use whenever t | LICENSE |
| `linkedin-thread-tracker` | Keeps a local log of LinkedIn comments you left, records who replied, and reports follow-ups due, overdue, or dead. Use when logging a comme | LICENSE |
| `linkerd-patterns` | Implement Linkerd service mesh patterns for lightweight, security-focused service mesh deployments. Use when setting up Linkerd, configuring | LICENSE |
| `litreview` | Use when starting a literature review or a literature-based project. Plans the search (PICO, SPIDER) with framework_recommender.py, searches | LICENSE |
| `llm-cost-optimizer` | Use whenever an LLM feature is being built or its costs come up (model choice, prompt caching, token limits, per-feature spend). Sets routin | LICENSE |
| `llm-evaluation` | Implement comprehensive evaluation strategies for LLM applications using automated metrics, human feedback, and benchmarking. Use when testi | LICENSE |
| `llm-wiki` | Use when building or maintaining an Obsidian second brain that an LLM keeps up to date, or when ingesting a paper, article or book into it.  | LICENSE |
| `local-seo-manager` | Use for any local business's Google Business Profile, Maps ranking, service-area pages, citations or review replies, before writing. Checks  | LICENSE |
| `loop-library` | Discover, find, compare, audit, repair, adapt, and design repeatable AI-agent loops with explicit triggers, actions, verification, stopping  | LICENSE |
| `lora-qlora-recipes` | Configure LoRA and QLoRA supervised fine-tuning with current best-practice hyperparameters. Use when writing or reviewing a LoRA/QLoRA train | LICENSE |
| `ma-due-diligence` | ACTIVATE when evaluating acquisition targets, conducting M&A due diligence, planning integration strategy, analyzing synergies, preparing sa | LICENSE |
| `ma-playbook` | Buy a company or sell yours: diligence, valuation, terms, integration. Use whenever M&A or an exit comes up. | LICENSE |
| `markdown-html-orchestrator` | Use when the user wants a markdown file turned into a single-file interactive HTML page (document, code review or slide deck). Classifies it | LICENSE |
| `market-research` | Use for market sizing (TAM, SAM, SOM both top-down and bottom-up), survey sample sizes or segment scoring. Runs market_sizer.py, sample_size | LICENSE |
| `market-sizing-analysis` | Calculate TAM/SAM/SOM for market opportunities using top-down, bottom-up, and value theory methodologies. Use this skill when sizing markets | LICENSE |
| `marketing-analyst` | Marketing analytics covering campaign analysis, attribution and marketing mix modeling, ROI measurement, and performance reporting. Use when | LICENSE |
| `marketing-context` | Use at the start of any marketing project, or when ICP, positioning or brand voice are missing, before other marketing skills. Writes the sh | LICENSE |
| `marketing-demand-acquisition` | Use when planning demand generation, paid acquisition across Google, LinkedIn and Meta, or a marketing budget, before allocating spend. Comp | LICENSE |
| `marketing-ideas` | Use when asked for marketing or growth ideas for a SaaS or software product. Picks from 139 tactics by stage, budget and channel instead of  | LICENSE |
| `marketing-ops` | Use when a marketing request spans several skills (a campaign across content, SEO, CRO and channels) or it is unclear which skill fits. Rout | LICENSE |
| `marketing-site-builder` | Build company, product and landing sites that do not look generic: one system, plain copy, real imagery, restrained motion, a static finish  | LICENSE |
| `marketing-skills` | Use when looking for which of the 44 marketing skills fits a task. Lists them by pod and routes to one; does no marketing work itself. | LICENSE |
| `marketing-strategy-pmm` | Use for product positioning, ICP, competitive battlecards or a go-to-market plan, before drafting. Applies April Dunford's positioning metho | LICENSE |
| `marketplace-advisor` | Strategic advisory for two-sided marketplace founders on chicken-and-egg, take rates, liquidity, and network effects. Use when scoping a mar | LICENSE |
| `mcp-oauth-triage` | Use when an MCP connector that used to authenticate now fails (tool calls 401 after a good token exchange, breaks after refresh, returns ano | LICENSE |
| `mcp-server-builder` | Use when exposing an API as an MCP server or scaffolding a new MCP server in Python or TypeScript, before hand-writing tool wrappers. Genera | LICENSE |
| `md-document` | Use when converting long-form markdown (spec, RFC, report, plan) into a single-file HTML page with sticky TOC, search and code-copy. Parses  | LICENSE |
| `md-review` | Use when converting a markdown code review with diff blocks and severity callouts into a two-column HTML review. Parses diffs with diff_pars | LICENSE |
| `md-slides` | Turn a markdown file into a single-file HTML slide deck with keyboard navigation, presenter notes and print-to-PDF. Use whenever the user wa | LICENSE |
| `mdr-745-specialist` | Use for EU MDR 2017/745 work: device classification under Annex VIII, technical file gaps (Annex II/III), clinical evaluation, PMS and PSUR  | LICENSE |
| `mediation-analysis` | Dispute analysis and mediation preparation framework. Use when preparing for mediation, analyzing disputes, calculating settlement ranges, m | LICENSE |
| `medical-device-software` | Use for any question about the software inside a medical device, SaMD or regulated health app - which IEC 62304 safety class (A/B/C) it is a | LICENSE |
| `meeting-analyzer` | Use when the user shares meeting transcripts (.vtt, .srt, .txt, Otter, Granola, Zoom) or asks how they come across in meetings. Measures spe | LICENSE |
| `meeting-briefing` | Prepare structured briefings for meetings with legal relevance and track resulting action items. Use when preparing for contract negotiation | LICENSE |
| `meeting-insights` | Analyze meeting transcripts to extract decisions, action items, owners, due dates, open questions, and risks. Use after recorded meetings, s | LICENSE |
| `meeting-insights-analyzer` | Analyzes meeting transcripts and recordings to uncover behavioral patterns, communication insights, and actionable feedback. Identifies when | LICENSE |
| `meetings` | Use when someone wants to decide whether a meeting is worth calling, price a meeting in dollars, build a timeboxed agenda with desired outco | LICENSE |
| `memory-engineering` | Use before adding memory to an agent or when a memory store keeps growing (long context vs RAG vs graph vs agentic memory, what to expire).  | LICENSE |
| `memory-forensics` | Master memory forensics techniques including memory acquisition, process analysis, and artifact extraction using Volatility and related tool | LICENSE |
| `memory-management` | Two-tier memory system that makes Claude a true workplace collaborator. Decodes shorthand, acronyms, nicknames, and internal language so Cla | LICENSE |
| `memory-review` | Review what the agent has learned in auto-memory: what to promote to permanent rules, stale entries to prune, duplicates to merge. Use whene | LICENSE |
| `memory-safety-patterns` | Implement memory-safe programming with RAII, ownership, smart pointers, and resource management across Rust, C++, and C. Use when writing sa | LICENSE |
| `memory-status` | Health check of agent auto-memory: line counts, topic files, capacity, stale entries and what to prune. Use whenever the user asks how full  | LICENSE |
| `merge` | Use to land the winning AgentHub branch, archive the others and clean up worktrees. | LICENSE |
| `merger-model` | Build accretion/dilution analysis for M&A transactions. Models pro forma EPS impact, synergy sensitivities, and purchase price allocation. U | LICENSE |
| `meta-research` | Use when a wrong answer is expensive: strategy research, comparing several products or markets, validating a hypothesis with outside data. F | LICENSE |
| `metrics-dashboard` | Designs a product metrics dashboard in four layers (North Star, inputs, guardrails, operational) with owners, comparisons and cadence, and a | LICENSE |
| `microservices-patterns` | Design microservices architectures with service boundaries, event-driven communication, and resilience patterns. Use when building distribut | LICENSE |
| `migrate` | Use when moving tests from Cypress or Selenium to Playwright ('migrate tests', 'convert tests', 'replace selenium'). | LICENSE |
| `migration-architect` | Plan a migration with zero or minimal downtime: phased plan, compatibility check, rollback scripts, for schemas, databases and services. Loa | LICENSE |
| `minimalist` | Write the least code: no over-engineering, fewer dependencies. Use whenever the user wants it simpler; applies a ladder first: YAGNI, reuse, | LICENSE |
| `ml-ops-engineer` | MLOps across model deployment, ML pipelines, monitoring, and feature stores. Use when deploying models to production, building training pipe | LICENSE |
| `ml-pipeline-workflow` | Build end-to-end MLOps pipelines from data preparation through model training, validation, and production deployment. Use when creating ML p | LICENSE |
| `mobile-android-design` | Master Material Design 3 and Jetpack Compose patterns for building native Android apps. Use when designing Android interfaces, implementing  | LICENSE |
| `mobile-ios-design` | Master iOS Human Interface Guidelines and SwiftUI patterns for building native iOS apps. Use when designing iOS interfaces, implementing Swi | LICENSE |
| `mobile-release` | Use when shipping an iOS or Android app update to the App Store or Google Play - Apple or Google rejected or warned about a build (ITMS-9105 | LICENSE |
| `model-update` | Update financial models with new data — quarterly earnings, management guidance, macro changes, or revised assumptions. Adjusts estimates, r | LICENSE |
| `modern-javascript-patterns` | Master ES6+ features including async/await, destructuring, spread operators, arrow functions, promises, modules, iterators, generators, and  | LICENSE |
| `monetize` | Use when someone asks how to earn more from their own experience: side income, side hustle, monetizing a skill, salary ceiling, career lever | LICENSE |
| `monorepo-management` | Master monorepo management with Turborepo, Nx, and pnpm workspaces to build efficient, scalable multi-package repositories with optimized bu | LICENSE |
| `monorepo-navigator` | Use for Turborepo, Nx, pnpm-workspace or Lerna setup, affected-only builds, remote caching or a multi-repo to monorepo move. Maps packages a | LICENSE |
| `month-end-close` | Use when running, planning or speeding up a month-end (or quarter-end) close — building or reviewing the close checklist and calendar, recon | LICENSE |
| `morning-note` | Draft concise morning meeting notes summarizing overnight developments, trade ideas, and key events for coverage stocks. Designed for the 7a | LICENSE |
| `ms365-tenant-manager` | Use for Microsoft 365 tenant administration (Entra ID users, Exchange Online, Teams, licenses, Conditional Access, compliance reports). Plan | LICENSE |
| `mtls-configuration` | Configure mutual TLS (mTLS) for zero-trust service-to-service communication. Use when implementing zero-trust networking, certificate manage | LICENSE |
| `multi-cloud-architecture` | Design multi-cloud architectures using a decision framework to select and integrate services across AWS, Azure, GCP, and OCI. Use when build | LICENSE |
| `multi-reviewer-patterns` | Coordinate parallel code reviews across multiple quality dimensions with finding deduplication, severity calibration, and consolidated repor | LICENSE |
| `named-persona-adversarial-review` | Use when a PR has architectural or UX impact, or automated review feels generic, and you want it reviewed through named engineers' documente | LICENSE |
| `nda-review` | Deep clause-by-clause NDA review from Recipient or Discloser perspective. Produces issue log with redlines, fallbacks, rationales, owners, d | LICENSE |
| `nda-triage` | Rapid NDA screening with GREEN/YELLOW/RED classification. 10-point checklist for incoming NDAs. Use when triaging NDAs, screening non-disclo | LICENSE |
| `nextjs-app-router-patterns` | Master Next.js 14+ App Router with Server Components, streaming, parallel routes, and advanced data fetching. Use when building Next.js appl | LICENSE |
| `nft-standards` | Implement NFT standards (ERC-721, ERC-1155) with proper metadata handling, minting strategies, and marketplace integration. Use when creatin | LICENSE |
| `nis2-directive-specialist` | NIS2 Directive (EU 2022/2555) compliance for critical infrastructure entities, covering the 10 minimum security measures. Use for NIS2 compl | LICENSE |
| `nis2-readiness` | Use when a cyberattack, ransomware or outage hits a hospital, utility, transport, digital-infrastructure or other EU company and it must rep | LICENSE |
| `nist-csf-specialist` | NIST Cybersecurity Framework 2.0 implementation, assessment, and compliance management. Use for CSF 2.0 gap analysis, cybersecurity risk man | LICENSE |
| `nodejs-backend-patterns` | Build production-ready Node.js backend services with Express/Fastify, implementing middleware patterns, error handling, authentication, data | LICENSE |
| `north-star-metric` | Pick the one metric that tracks customer value, decompose it into inputs with leading indicators and guardrail metrics. Use when defining th | LICENSE |
| `notebooklm` | Use for anything in Google NotebookLM: querying notebooks, adding sources, generating Audio or Video Overviews, reports, flashcards or slide | LICENSE |
| `notion-pm` | Designs Notion databases, views and page structure for PRDs, OKRs, roadmaps and decisions, and writes REST API calls. Use when asked to "des | LICENSE |
| `nx-workspace-patterns` | Configure and optimize Nx monorepo workspaces. Use when setting up Nx, configuring project boundaries, optimizing build caching, or implemen | LICENSE |
| `observability-designer` | Use when adding metrics, logs and traces to a service, fixing noisy alerts or designing dashboards. Designs SLIs with slo_designer.py, tunes | LICENSE |
| `offer-design` | Build an offer from the buyer's obstacles: component stack, value drivers, an affordable guarantee and honest urgency, scored before launch. | LICENSE |
| `office-hours` | Founder advice after six YC-style questions. Use whenever a founder is stuck or unsure what to ask, or /c-level-agents:office-hours. | LICENSE |
| `on-call-handoff-patterns` | Master on-call shift handoffs with context transfer, escalation procedures, and documentation. Use this skill when transitioning on-call res | LICENSE |
| `onboard` | Use for /cs-onboard, or when the virtual C-suite lacks company context. Interviews the founder and writes ~/.claude/company-context.md. | LICENSE |
| `onboarding-cro` | Use when activation, time-to-value or a first-run experience after signup needs work, before redesigning it. Finds the activation drop-off w | LICENSE |
| `onboarding-planner` | TRIGGER THIS when preparing for new hires, planning first-day/week/month activities, creating onboarding schedules, building 30-60-90 day pl | LICENSE |
| `onboarding-playbook` | Design customer onboarding playbooks with milestone tracking, training plans, health checks, and success criteria | LICENSE |
| `openapi-spec-generation` | Generate and maintain OpenAPI 3.1 specifications from code, design-first specs, and validation patterns. Use when creating API documentation | LICENSE |
| `operations-manager` | Operations management across process optimization, efficiency, and continuous improvement. Use when designing workflows, building capacity p | LICENSE |
| `opportunity-solution-tree` | Maps one outcome to customer opportunities, 3+ solutions each and assumption tests, then audits the tree. Use when prioritizing discovery wo | LICENSE |
| `org-health-diagnostic` | Use for a whole-company health check before a board review or when functions seem at risk. Scores 8 dimensions on a traffic light with healt | LICENSE |
| `outcome-roadmap` | Turn a feature-list roadmap into outcome statements placed in Now/Next/Later, and check each has a measure. Use when converting a feature-li | LICENSE |
| `page-cro` | Fix a page that is not converting: section by section audit with fixes ranked by impact. Use whenever a homepage, landing, pricing or featur | LICENSE |
| `paid-ads` | Use for paid campaign strategy on Google, Meta, LinkedIn or X: structure, targeting, bids, retargeting and budgets. Scores account health wi | LICENSE |
| `parallel-debugging` | Debug complex issues using competing hypotheses with parallel investigation, evidence collection, and root cause arbitration. Use this skill | LICENSE |
| `parallel-feature-development` | Coordinate parallel feature development with file ownership strategies, conflict avoidance rules, and integration patterns for multi-agent i | LICENSE |
| `partnerships-architect` | Use when deciding whether to sign a partner, at which tier (referral, reseller, OEM, SI, alliance), with what joint GTM and revshare. Runs p | LICENSE |
| `passive-deal-screener` | Use when a passive investor shares a private deal (syndication, preferred equity, bridge fund, private credit) to screen as an LP. Stress-te | LICENSE |
| `patent` | Use for prior-art search, freedom-to-operate, patent landscape, acquisition diligence or litigation prior art. Picks the use case with sub_u | LICENSE |
| `paypal-integration` | Integrate PayPal payment processing with support for express checkout, subscriptions, and refund management. Use when implementing PayPal pa | LICENSE |
| `paywall-upgrade-cro` | Use when designing or fixing an in-app paywall, upgrade modal, feature gate or trial-expiry screen. Applies upgrade-moment patterns for user | LICENSE |
| `pci-compliance` | Implement PCI DSS compliance requirements for secure handling of payment card data and payment systems. Use when securing payment processing | LICENSE |
| `pci-dss-specialist` | PCI DSS v4.0 payment card data security compliance, assessment, and implementation. Use for PCI DSS scoping, cardholder data environment (CD | LICENSE |
| `pdf-toolkit` | Audit PDF files for metadata leakage, page count, encryption, JavaScript, embedded files, and version. Use before sending a PDF externally,  | LICENSE |
| `people-analytics` | People analytics across workforce metrics, predictive modeling, and employee insights. Use when building turnover models, analyzing engageme | LICENSE |
| `performance-profiler` | Use for a slow endpoint, memory leak, CPU spike, large bundle or performance budget in Node.js, Python or Go, before optimizing. Measures be | LICENSE |
| `performance-review-assistant` | TRIGGER THIS when conducting performance reviews, writing manager feedback, creating self-assessments, building peer feedback, developing PI | LICENSE |
| `pitch-deck` | Populates investment banking pitch deck templates with data from source files. Use when: user provides a PowerPoint template to fill in, use | LICENSE |
| `pitch-deck-reviewer` | Score a pitch deck's structure and content against YC, Sequoia, and a16z heuristics. Use before sending a deck to investors, practicing a pi | LICENSE |
| `plan-grilling` | Interrogate a plan, design or idea one round of questions at a time until every decision is settled. Use when stress-testing a plan before b | LICENSE |
| `playwright-pro` | End-to-end testing with Playwright: test generation, page objects, locator strategy, flaky- test diagnosis, visual regression, and CI integr | LICENSE |
| `pm-1on1s` | Builds 1:1 agendas and kickoff scripts for a PM's manager, EM, designer, reports and cross-functional partners. Use when starting a new 1:1, | LICENSE |
| `pm-career-ladder` | Scores a PM against level rubrics from APM to VP/CPO, then builds a gap analysis, 6-month growth plan or promotion packet. Use when preparin | LICENSE |
| `pm-interview-prep` | Plans PM interview prep across product sense, execution, strategy, behavioral and technical rounds, calibrated to level. Use when a PM loop  | LICENSE |
| `pm-onboarding` | Builds a new PM's 30-60-90 day plan from a situation diagnosis: stakeholder map, 1:1 questions, early wins and a first PRD. Use when startin | LICENSE |
| `pm-skills` | Router for project-management skills: sprints, portfolio health, Jira, Confluence, stakeholder comms, plus a delivery loop. Use whenever a d | LICENSE |
| `popup-cro` | Use when creating or fixing a popup, modal, exit-intent, slide-in or banner meant to convert. Sets trigger, frequency, offer and copy rules  | LICENSE |
| `porters-five-forces` | Rates the five competitive forces of one precisely defined industry with evidence and turns the dominant forces into moves. Use when weighin | LICENSE |
| `portfolio-monitoring` | Track and analyze portfolio company performance against plan. Ingests monthly/quarterly financial packages (Excel, PDF), extracts KPIs, flag | LICENSE |
| `portfolio-rebalance` | Analyze portfolio allocation drift and generate rebalancing trade recommendations across accounts. Considers tax implications, transaction c | LICENSE |
| `post-mortem` | Use for /c-level-agents:post-mortem, or when a decision hits its 90-day review or kill criteria. Scores it against the original assumptions  | LICENSE |
| `postgres` | Execute read-only SQL queries against multiple PostgreSQL databases. Use when: (1) querying PostgreSQL databases, (2) exploring database sch | LICENSE |
| `postgresql-table-design` | Use this skill when designing or reviewing a PostgreSQL-specific schema. Covers best-practices, data types, indexing, constraints, performan | LICENSE |
| `postmortem` | Use after a failed launch, missed quarter or bad hire. Runs a blameless 5-Whys with a change register. | LICENSE |
| `postmortem-writing` | Write effective blameless postmortems with root cause analysis, timelines, and action items. Use when conducting incident reviews, writing p | LICENSE |
| `pptx-deck-context` | Use when preparing the narrative, sources, and design context for a new editable PPTX deck. | LICENSE |
| `pptx-quality-gates` | Use when validating or repairing an editable PPTX deck for geometry, accessibility, native editability, source lineage, and OOXML package in | LICENSE |
| `pptx-reference-deck-analysis` | Use when analyzing a reference PPTX for read-only structure, theme, typography, layout rhythm, diagnostics, derived template catalogs, or sa | LICENSE |
| `pptx-slide-specification` | Use when authoring or repairing a coordinate-explicit JSON specification for an editable PPTX deck. | LICENSE |
| `pptx-toolkit` | Audit PowerPoint (.pptx) decks for slide count, text density, embedded images and fonts, hidden slides, speaker notes, and animation density | LICENSE |
| `pptx-visual-assets` | Use when selecting and placing approved supporting icons, images, SVGs, diagrams, or infographics in an editable PPTX deck. | LICENSE |
| `pr-description-writer` | Write PR descriptions with evidence, verification steps and a one-way/two-way merge-risk call. Use when opening a PR, when asked to write or | LICENSE |
| `pr-review-expert` | File-by-file pull request review for bugs, security and quality, with a merge verdict. Load whenever the user asks to review, look over or c | LICENSE |
| `prd-writer` | Write comprehensive Product Requirements Documents with user stories, acceptance criteria, technical specifications, wireframe descriptions, | LICENSE |
| `pre-mortem` | Runs a pre-mortem that sorts launch risks into evidenced tigers, paper tigers and unspoken elephants, each with an owner. Use when a big lau | LICENSE |
| `preference-optimization` | Align a fine-tuned model with preference data using DPO, ORPO, KTO, or SimPO. Use when preference pairs or thumbs-up/down feedback exist, wh | LICENSE |
| `prfaq` | Write a Working Backwards press release with internal and external FAQs before anything is built. Use when a funding or go/no-go decision ne | LICENSE |
| `pricing-prd` | Write the PRD for a pricing change: model and packaging, experiment design, grandfathering, communication and rollback thresholds. Use when  | LICENSE |
| `pricing-strategist` | Use when choosing or revisiting pricing: seat, usage, value-based, freemium or hybrid, Van Westendorp willingness-to-pay analysis, or Good/B | LICENSE |
| `pricing-strategy` | Use for SaaS pricing tiers, value metric, packaging, a pricing page or a price increase, before proposing numbers. Models revenue across tie | LICENSE |
| `prioritization-frameworks` | Pick a prioritization method and rank a backlog: RICE, ICE, opportunity, MoSCoW and weighted scoring, plus four reference-only methods. Use  | LICENSE |
| `privacy-compliance` | Multi-regulation privacy compliance navigator. Use for GDPR, CCPA, LGPD, POPIA, PIPEDA, PDPA, Privacy Act, PIPL, UK GDPR compliance assessme | LICENSE |
| `privacy-notice-generator` | Draft GDPR-compliant privacy notices for EU/EEA jurisdictions. Supports 6 notice types, 9 jurisdictions, multi-layer compliance verification | LICENSE |
| `process-letter` | Draft process letters and bid instructions for sell-side M&A processes. Covers initial indication of interest (IOI) instructions, final bid  | LICENSE |
| `process-mapper` | Use when documenting an end-to-end business process (procurement, onboarding, handoffs) and finding where work waits. Maps it with process_d | LICENSE |
| `process-optimization` | Analyze and improve business processes. Trigger with "this process is slow", "how can we improve", "streamline this workflow", "too many ste | LICENSE |
| `procurement-optimizer` | Cut spend on software and suppliers: SaaS audit, category spend review, slow purchasing cycles, supplier consolidation. Use whenever the use | LICENSE |
| `product-analytics` | Use when defining product KPIs, building metric dashboards, running cohort or retention analysis, or interpreting feature adoption trends ac | LICENSE |
| `product-designer` | Turns user research into design decisions: journey maps with gap checks, SUS and task scoring, and heuristic design critique. Use when mappi | LICENSE |
| `product-discovery` | Validate product ideas: map assumptions, plan discovery sprints, test problem-solution fit. Use whenever the user asks if an idea is worth b | LICENSE |
| `product-launch-playbook` | Comprehensive product launch planning including GTM strategy, launch checklists, stakeholder communication, beta testing plans, and post-lau | LICENSE |
| `product-manager-toolkit` | PM toolkit: RICE prioritization, customer interview synthesis, PRDs and go-to-market. Use whenever the user asks what to build next, to rank | LICENSE |
| `product-research` | Use when planning or synthesizing user research: choosing the method, deciding how many participants, or turning coded notes into insights.  | LICENSE |
| `product-skills` | Use when a product request needs routing across the product-team skills (prioritization, OKRs, UX research, experiments, discovery, roadmaps | LICENSE |
| `product-strategist` | Head of Product: quarterly OKRs cascaded from company to team, product vision, roadmap, team structure. Use whenever the user asks to set OK | LICENSE |
| `product-vision` | Write the 5-10 year product vision as a vision board, narrative or elevator pitch, and stress-test it. Use when setting or refreshing long-r | LICENSE |
| `productboard-expert` | Sets up Productboard workspaces, insight triage, driver scoring, releases and roadmaps, and writes v2 REST API calls. Use when administering | LICENSE |
| `program-manager` | Runs multi-project programs: charters, governance, cross-project dependencies, benefits tracking and steering-committee reporting. Use when  | LICENSE |
| `programmatic-seo` | Use when building many SEO pages from a template and data (location, integration, comparison or directory pages), before generating them. De | LICENSE |
| `project-status-report` | Generate project status reports with RAG status, milestones, risks, blockers, resource utilization, and executive summaries | LICENSE |
| `projection-patterns` | Build read models and projections from event streams. Use when implementing CQRS read sides, building materialized views, or optimizing quer | LICENSE |
| `prometheus-configuration` | Set up Prometheus for comprehensive metric collection, storage, and monitoring of infrastructure and applications. Use when implementing met | LICENSE |
| `promote` | Graduate a proven pattern from auto-memory (MEMORY.md) to CLAUDE.md or .claude/rules/ for permanent enforcement. Use when the user runs /si: | LICENSE |
| `prompt-engineer-toolkit` | Use when a marketing team's AI prompts need testing, versioning or governance, before shipping a prompt. A/B tests prompts against cases wit | LICENSE |
| `prompt-engineering-patterns` | This skill should be used when the user asks to "optimize a prompt", "improve prompt performance", "design a prompt template", "write better | LICENSE |
| `prompt-governance` | Use when prompts run in production and need versioning, a registry, A/B tests, regression checks or an eval pipeline. Sets up the release pr | LICENSE |
| `proptech-advisor` | Strategic advisory for proptech founders on real-estate segments, MLS/brokerage models, licensing, and business models. Use when scoping a p | LICENSE |
| `prospect` | Full ICP-to-leads pipeline. Describe your ideal customer in plain English and get a ranked table of enriched decision-maker leads with email | LICENSE |
| `protect-mcp-setup` | Configure Cedar policy enforcement and Ed25519 signed receipts for Claude Code tool calls. Use when setting up projects that need cryptograp | LICENSE |
| `protocol-reverse-engineering` | Master network protocol reverse engineering including packet analysis, protocol dissection, and custom protocol documentation. Use when anal | LICENSE |
| `pulse` | Use for what people are saying right now about a topic (trends, sentiment, complaints, tool comparisons) across Reddit, Hacker News and the  | LICENSE |
| `pw` | Use for any Playwright or end-to-end browser testing work: writing tests, fixing flaky ones, migrating from Cypress or Selenium, CI setup, T | LICENSE |
| `pw-init` | Use when setting up Playwright in a project ('set up playwright', 'add e2e tests', 'configure playwright', 'init playwright'). | LICENSE |
| `pw-review` | Use when reviewing Playwright tests for quality ('review tests', 'audit tests', 'playwright best practices check'). | LICENSE |
| `python-anti-patterns` | Use this skill when reviewing Python code for common anti-patterns to avoid. Use as a checklist when reviewing code, before finalizing imple | LICENSE |
| `python-background-jobs` | Python background job patterns including task queues, workers, and event-driven architecture. Use when implementing async task processing, j | LICENSE |
| `python-code-style` | Python code style, linting, formatting, naming conventions, and documentation standards. Use when writing new code, reviewing style, configu | LICENSE |
| `python-configuration` | Python configuration management via environment variables and typed settings. Use when externalizing config, setting up pydantic-settings, m | LICENSE |
| `python-design-patterns` | Python design patterns including KISS, Separation of Concerns, Single Responsibility, and composition over inheritance. Use this skill when  | LICENSE |
| `python-error-handling` | Python error handling patterns including input validation, exception hierarchies, and partial failure handling. Use when implementing valida | LICENSE |
| `python-observability` | Python observability patterns including structured logging, metrics, and distributed tracing. Use when adding logging, implementing metrics  | LICENSE |
| `python-packaging` | Create distributable Python packages with proper project structure, setup.py/pyproject.toml, and publishing to PyPI. Use when packaging Pyth | LICENSE |
| `python-performance-optimization` | Profile and optimize Python code using cProfile, memory profilers, and performance best practices. Use when debugging slow Python code, opti | LICENSE |
| `python-project-structure` | Python project organization, module architecture, and public API design. Use when setting up new projects, organizing modules, defining publ | LICENSE |
| `python-resilience` | Python resilience patterns including automatic retries, exponential backoff, timeouts, and fault-tolerant decorators. Use when adding retry  | LICENSE |
| `python-resource-management` | Python resource management with context managers, cleanup patterns, and streaming. Use when managing connections, file handles, implementing | LICENSE |
| `python-testing-patterns` | Implement comprehensive testing strategies with pytest, fixtures, mocking, and test-driven development. Use when writing Python tests, setti | LICENSE |
| `python-type-safety` | Python type safety with type hints, generics, protocols, and strict type checking. Use when adding type annotations, implementing generic cl | LICENSE |
| `qa-browser-automation` | Live browser QA through Chrome MCP plus Python tools for health scoring, static WCAG checks, screenshot baselines and reports. Use when runn | LICENSE |
| `qbr-builder` | Create Quarterly Business Reviews with account health scores, usage analytics, ROI analysis, expansion opportunities, and risk mitigation | LICENSE |
| `qms-audit-expert` | Use for ISO 13485 internal audits: planning the program, running an audit, classifying findings or preparing for an external audit. Optimize | LICENSE |
| `quality-documentation-manager` | Use for QMS document control: numbering, versioning, change control or 21 CFR Part 11 e-signatures. Validates documents with document_valida | LICENSE |
| `quality-manager-qmr` | Use for QMR duties under ISO 13485 5.5.2: management review, quality policy and objectives, quality KPIs and cost of quality. Tracks reviews | LICENSE |
| `quality-manager-qms-iso13485` | Build or maintain an ISO 13485 medical device QMS: design, documentation, CAPA, audit prep. Use whenever the user faces a 13485 certificatio | LICENSE |
| `quantized-export` | Export a promoted fine-tuned model in the right deployment format — merged safetensors, LoRA-only, GGUF with imatrix, or FP8. Use after a ch | LICENSE |
| `quarterly-planning` | Run the meetings around a quarter's OKRs: homework and kickoff, weekly check-ins, the week-6 carry/kill/pivot review and the close retro. Us | LICENSE |
| `ra-qm-skills` | Router for regulatory and quality skills: ISO 13485, MDR, FDA, ISO 14971, CAPA, ISO 27001, ISO 42001, EU AI Act, GDPR, SOC 2. Use whenever a | LICENSE |
| `rag-architect` | Design a RAG pipeline: chunk size, embedding model, vector database and retrieval quality metrics. Use whenever the user builds search over  | LICENSE |
| `rag-implementation` | Build Retrieval-Augmented Generation (RAG) systems for LLM applications with vector databases and semantic search. Use when implementing kno | LICENSE |
| `react-modernization` | Upgrade React applications to latest versions, migrate from class components to hooks, and adopt concurrent features. Use when modernizing R | LICENSE |
| `react-native-architecture` | Build production React Native apps with Expo, navigation, native modules, offline sync, and cross-platform patterns. Use when developing mob | LICENSE |
| `react-native-design` | Master React Native styling, navigation, and Reanimated animations for cross-platform mobile development. Use when building React Native app | LICENSE |
| `react-state-management` | Master modern React state management with Redux Toolkit, Zustand, Jotai, and React Query. Use when setting up global state, managing server  | LICENSE |
| `readme-polish` | Use when an existing README must be upgraded, audited, or made scannable: polish/美化/升级/优化/打磨 README, add badges, mermaid, callouts, or colla | LICENSE |
| `recsys-pipeline-architect` | Design composable recommendation, ranking, and feed pipelines using the six-stage Source→Hydrator→Filter→Scorer→Selector→SideEffect framewor | LICENSE |
| `red-green-proof` | Turns a suspected bug into a proven one. Verify the cause against reality before claiming it, write a test that FAILS on the current code, a | LICENSE |
| `red-team` | Use when planning or running an authorized red team engagement or attack path analysis. Plans the kill chain with engagement_planner.py: MIT | LICENSE |
| `referral-program` | Use when designing or fixing a referral, affiliate or ambassador program, before setting rewards. Models payout and ROI with referral_roi_ca | LICENSE |
| `reflect` | Use when the user says 'step back', 'zoom out', 'are we on track' or 'sanity check this', or work has gone deep into details without a check | LICENSE |
| `regulatory-affairs-head` | Use for medical device market access strategy: FDA 510(k), De Novo or PMA packages, CE marking under MDR, pre-sub meetings, agency deficienc | LICENSE |
| `release-manager` | Turns conventional-commit logs into a changelog and SemVer bump, and scores a release plan for readiness, rollback and comms. Use when you h | LICENSE |
| `release-notes` | Turn tickets, changelogs and git logs into user-facing notes grouped by type, breaking changes first. Use when announcing a product release, | LICENSE |
| `release-orchestrator` | Gates a release from a live git checkout: preflight checks, secret scan, tag-based SemVer bump, changelog and GO/NO-GO score. Use when cutti | LICENSE |
| `remember` | Save something important to auto-memory with a timestamp and context. Use whenever the user says remember this, note it for next time or don | LICENSE |
| `report` | Summarize Playwright results. Use whenever the user asks how tests went, for a test report or status. | LICENSE |
| `research` | Use for any research request that doesn't clearly match a research specialist ('research X', 'look into Y'). Routes with classifier.py to pu | LICENSE |
| `research-finance` | Use for R&D program money: multi-period budgets with indirect cost split, burn and runway against milestones, or capitalize vs expense routi | LICENSE |
| `research-ops-skills` | Use when an enterprise research request needs routing (clinical study design, R&D finance, market sizing, user research): 'what sample size' | LICENSE |
| `research-summarizer` | Use when summarizing a research paper, article or report, comparing several sources or extracting citations into a brief. Formats with forma | LICENSE |
| `resource-planning` | Plan and optimize resource allocation. Trigger with "resource planning", "capacity", "utilization", "staffing plan", "who should work on wha | LICENSE |
| `response-drafting` | Draft professional, empathetic customer-facing responses adapted to the situation, urgency, and channel. Use when responding to customer tic | LICENSE |
| `responsive-design` | Implement modern responsive layouts using container queries, fluid typography, CSS Grid, and mobile-first breakpoint strategies. Use when bu | LICENSE |
| `resume-tailor` | Tailor a resume to a job description by extracting keywords, scoring match, and rewriting bullets for impact. Use when applying to a role, o | LICENSE |
| `returns-analysis` | Build quick IRR/MOIC sensitivity tables for PE deal evaluation. Models returns across entry multiple, leverage, exit multiple, growth, and h | LICENSE |
| `revenue-operations` | Check sales pipeline and forecasts: pipeline coverage, forecast accuracy, magic number, CAC payback. Use whenever the user asks if pipeline  | LICENSE |
| `review-agent-setup` | Configure human-in-the-loop gating for AI agent review actions in Claude Code. Use when setting up a project where an agent may post PR revi | LICENSE |
| `rfp-builder` | Create Request for Proposals with requirements specifications, evaluation criteria, scoring rubrics, timelines, and compliance requirements | LICENSE |
| `rfp-responder` | Use when an RFP, RFI, RFQ or security or vendor questionnaire arrives. Parses mandatory vs weighted requirements with rfp_parser.py, drafts  | LICENSE |
| `risk-assessment` | Identify, assess, and mitigate operational risks. Trigger with "what are the risks", "risk assessment", "risk register", "what could go wron | LICENSE |
| `risk-management-specialist` | Use for ISO 14971 medical device risk management: hazard analysis, FMEA, fault trees, risk controls, benefit-risk or residual risk. Runs fme | LICENSE |
| `risk-metrics-calculation` | Calculate portfolio risk metrics including VaR, CVaR, Sharpe, Sortino, and drawdown analysis. Use when measuring portfolio risk, implementin | LICENSE |
| `roadmap-builder` | Build product roadmaps with quarterly planning, feature prioritization, dependency mapping, and stakeholder alignment. Create actionable roa | LICENSE |
| `roadmap-communication` | Produce executive, customer and internal versions of one roadmap with consistent framing and the right detail and risk language for each. Us | LICENSE |
| `roadmap-communicator` | Write roadmap narratives, release notes, changelogs, stakeholder updates. Use whenever the user explains plans to execs, engineers or custom | LICENSE |
| `roast` | Roast an idea: a 5-angle panel (Critic, Champion, Analyst, Investigator, Customer) attacks it, then a Judge returns one GO / RESHAPE / KILL  | LICENSE |
| `run-without-you` | Use when a graded managed agent should run on a schedule, on an event trigger or on demand ('run it every morning'). Validates cron with cro | LICENSE |
| `runbook-generator` | Use when a service needs runbooks for deploy, incident response, maintenance or rollback, before launch. Generates them per environment with | LICENSE |
| `rust-async-patterns` | Master Rust async programming with Tokio, async traits, error handling, and concurrent patterns. Use when building async Rust applications,  | LICENSE |
| `saas-metrics-coach` | Use when someone shares SaaS revenue or customer numbers, or asks about ARR, MRR, churn, LTV, CAC, NRR or how their SaaS is doing. Computes  | LICENSE |
| `saas-scaffolder` | Use when starting a new SaaS app with auth, database, Stripe billing and a dashboard (Next.js App Router, TypeScript, Tailwind, shadcn/ui, D | LICENSE |
| `saga-orchestration` | Implement saga patterns for distributed transactions and cross-aggregate workflows. Use this skill when implementing distributed transaction | LICENSE |
| `sales-engineer` | Use for pre-sales work: RFP coverage gaps, competitive feature matrices or planning and scoring a proof of concept. Runs rfp_response_analyz | LICENSE |
| `sales-operations` | Sales operations across CRM, analytics, territory planning, and compensation. Use when building pipeline reports, designing territories, set | LICENSE |
| `sample-text-processor` | Reference BASIC-tier skill used as a fixture by skill-tester. Counts words and characters and applies basic text transformations. Use when v | LICENSE |
| `sast-configuration` | Configure Static Application Security Testing (SAST) tools for automated vulnerability detection in application code. Use when setting up se | LICENSE |
| `scan` | Scans the codebase to generate project-doc.md and AGENTS.md. Use when bootstrapping a new agent-driven repo, refreshing project documentatio | LICENSE |
| `scenario-war-room` | Use for compound what-if questions ('what if X and Y both happen?') with major downside across functions. Models cascading scenarios with sc | LICENSE |
| `schema-markup` | Use for any JSON-LD, schema.org, rich-result or structured-data request, before writing markup. Validates the markup with schema_validator.p | LICENSE |
| `screen-reader-testing` | Test web applications with screen readers including VoiceOver, NVDA, and JAWS. Use when validating screen reader compatibility, debugging ac | LICENSE |
| `scrum-master` | Use for sprint and team analytics: velocity forecasts, sprint health, retrospectives, burndown or blockers. Forecasts with velocity_analyzer | LICENSE |
| `search-strategy` | Query decomposition and multi-source search orchestration. Breaks natural language questions into targeted searches per source, translates q | LICENSE |
| `secrets-management` | Implement secure secrets management for CI/CD pipelines using Vault, AWS Secrets Manager, or native platform solutions. Use when handling se | LICENSE |
| `secrets-vault-manager` | Use when setting up HashiCorp Vault, AWS Secrets Manager, Azure Key Vault or GCP Secret Manager, rotating secrets or auditing secret access. | LICENSE |
| `sector-overview` | Create comprehensive industry and sector landscape reports covering market dynamics, competitive positioning, key players, and thematic tren | LICENSE |
| `security-audit` | Multi-agent source security audit with a coverage ledger, independently verified findings, and machine-checked records. Use when asked to au | LICENSE |
| `security-guidance` | Use when installing or tuning the PreToolUse security hook that warns before Claude writes command injection, XSS, SQL injection, unsafe des | LICENSE |
| `security-pen-testing` | Authorized penetration testing of an app or API: vulnerability scans, OWASP Top 10 checks, dependency audits and a pentest report. Use whene | LICENSE |
| `security-requirement-extraction` | Derive security requirements from threat models and business context. Use when translating threats into actionable requirements, creating se | LICENSE |
| `self-eval` | Grade finished work honestly on two axes with a devil's-advocate pass against inflation. Use whenever the user asks how well a task went, to | LICENSE |
| `self-improving-agent` | Curate what the agent has learned into durable project knowledge. Reviews Claude Code auto-memory (MEMORY.md and its topic files) for learni | LICENSE |
| `senior-architect` | System architecture decisions with a written rationale: monolith vs microservices, database choice, scaling limits, ADRs, Mermaid diagrams.  | LICENSE |
| `senior-backend` | Build and fix backend services: REST or GraphQL APIs, auth, microservices, PostgreSQL queries, migrations and load tests. Use whenever the u | LICENSE |
| `senior-cloud-architect` | Cloud architecture decisions across AWS, GCP and Azure: topology, DR tier by RTO/RPO, commitment mix, IAM and network posture. Use when desi | LICENSE |
| `senior-computer-vision` | Computer vision models: object detection, segmentation, training a custom model, and optimizing or deploying inference (YOLO, DETR, SAM, ONN | LICENSE |
| `senior-data-engineer` | Data pipelines: Airflow DAGs, Spark, dbt, Kafka, ETL/ELT, data quality checks. Load whenever a DAG or batch job times out or fails, data arr | LICENSE |
| `senior-data-scientist` | Design experiments and analyze tabular data: A/B tests, causal inference, feature engineering, model evaluation. Use whenever the user asks  | LICENSE |
| `senior-devops` | Set up CI/CD pipelines, infrastructure as code, containers and deployments on AWS, GCP or Azure. Use whenever the user needs a build or depl | LICENSE |
| `senior-frontend` | Build and review React, Next.js, TypeScript or Tailwind frontends: components, scaffolding, performance and bundle size. Use whenever the us | LICENSE |
| `senior-fullstack` | Start a fullstack project or audit a codebase: pick a stack (Next.js, FastAPI, MERN, Django), scaffold it and score code quality. Use whenev | LICENSE |
| `senior-ml-engineer` | Use for putting ML models or LLM features into production: deployment, MLOps, drift monitoring, RAG pipelines, LLM API cost and retries. Dep | LICENSE |
| `senior-mobile` | Mobile development across SwiftUI, Jetpack Compose, React Native (Expo) and Flutter: scaffolding, feature architecture, static performance c | LICENSE |
| `senior-pm` | Project and portfolio management for multi-workstream programs: plans, status reports, risk registers, capacity, executive reporting. Use wh | LICENSE |
| `senior-prompt-engineer` | Improve prompts and measure LLM quality: fix inconsistent prompts, build eval sets, score RAG retrieval, check agent tool configs. Use whene | LICENSE |
| `senior-qa` | Write and improve tests for React or Next.js apps: Jest, React Testing Library, MSW mocks, Playwright E2E, coverage gaps. Use whenever the u | LICENSE |
| `senior-secops` | Find and fix application security problems: security reviews, CVE remediation, hardening, secrets and auth, SOC 2, PCI-DSS, HIPAA and GDPR c | LICENSE |
| `senior-security` | Check if a design or code is secure: STRIDE threat model, DREAD risk scores, leaked secret scan. Use whenever the user asks what could be at | LICENSE |
| `seo-content-optimizer` | Optimize website content for search engine visibility and user engagement. Conduct keyword research, implement on-page SEO tactics, analyze  | LICENSE |
| `seo-specialist` | SEO covering technical SEO, content optimization, link building, keyword research, and search analytics. Use when auditing technical SEO, re | LICENSE |
| `sequence-load` | Find leads matching criteria and bulk-add them to an Apollo outreach sequence. Handles enrichment, contact creation, deduplication, and enro | LICENSE |
| `service-mesh-observability` | Implement comprehensive observability for service meshes including distributed tracing, metrics, and visualization. Use when setting up mesh | LICENSE |
| `session-guard` | Use when working on complex multi-step tasks, when a session is getting long (40+ tool calls), when the agent starts ignoring rules it follo | LICENSE |
| `session-handoff` | Write a handoff document so a fresh session or another agent can pick up exactly where this one left off: goal, current state, decisions, ne | LICENSE |
| `session-retro` | Review a coding-agent session and turn its failures and waste into ranked fixes to the agent's environment. Use when a session went slow or  | LICENSE |
| `setup` | Use for /autoresearch-agent:setup, or to start a new autoresearch experiment: target, eval command, metric, direction, evaluator. | LICENSE |
| `shellcheck-configuration` | Master ShellCheck static analysis configuration and usage for shell script quality. Use when setting up linting infrastructure, fixing code  | LICENSE |
| `ship-gate` | Use before deploying or going live ('am I ready to ship', 'can I deploy', 'preflight check'). Scans the codebase with ship_gate_scanner.py a | LICENSE |
| `signed-audit-trails-recipe` | Step-by-step cookbook for setting up cryptographically signed audit trails on Claude Code tool calls. Use when explaining, evaluating, or de | LICENSE |
| `signup-flow-cro` | Use when signup, registration or trial-start conversion is low or a signup flow is being designed. Finds the drop-off step with funnel_drop_ | LICENSE |
| `similarity-search-patterns` | Implement efficient similarity search with vector databases. Use when building semantic search, implementing nearest neighbor queries, or op | LICENSE |
| `skill-retro` | Use when the user wants their skills graded from real session history, asks which installed skills actually work, or wants evidence-backed s | LICENSE |
| `skill-router` | This skill should be used when the user has a vague or cross-domain request and asks "which skill should I use", "is there a skill for this" | LICENSE |
| `skill-security-auditor` | Use before installing any skill or plugin from an untrusted source, or when asked if a skill is safe. Scans scripts, SKILL.md and dependenci | LICENSE |
| `skill-tester` | Use when authoring or auditing a skill in this ecosystem, before release. Validates structure with skill_validator.py, runs its scripts with | LICENSE |
| `skillopt-sleep` | Use when the user wants their Claude agent to self-improve from past usage, asks about a nightly/offline 'sleep' or 'dream' cycle, memory/sk | LICENSE |
| `slack-messaging` | Guidance for composing well-formatted, effective Slack messages using mrkdwn syntax | LICENSE |
| `slack-search` | Guidance for effectively searching Slack to find messages, files, channels, and people | LICENSE |
| `slo-architect` | Use when defining or reviewing SLOs, SLIs, error budgets or burn-rate alerts. Designs SLOs with slo_designer.py, computes budgets and multi- | LICENSE |
| `slo-implementation` | Define and implement Service Level Indicators (SLIs) and Service Level Objectives (SLOs) with error budgets and alerting. Use when establish | LICENSE |
| `snowflake-development` | Use for Snowflake work: SQL, Dynamic Tables, Streams and Tasks, Cortex AI functions and agents, Snowpark Python, dbt on Snowflake, or Snowfl | LICENSE |
| `soc2-audit-prep` | Use for /compliance-os:soc2-audit-prep, or before or during a SOC 2 Type II observation period. | LICENSE |
| `soc2-compliance` | Use when the user asks to prepare for SOC 2 audits, map Trust Service Criteria, build control matrices, collect audit evidence, perform gap  | LICENSE |
| `soc2-compliance-expert` | SOC 2 Type I and Type II compliance management against the Trust Services Criteria. Use for SOC 2 readiness assessments, TSC gap analysis, a | LICENSE |
| `social-content` | Write a LinkedIn post, X thread, Instagram, TikTok or Facebook post with each platform's hook, length and format. Use whenever the user want | LICENSE |
| `social-evidence-research` | Research public discussion on social platforms and keep every report claim tied to the source material that supports it. Use when researchin | LICENSE |
| `social-media-analyzer` | Score social performance: engagement rate, reach, ROI per platform, benchmarks. Load whenever the user asks which platform performs best, if | LICENSE |
| `social-media-manager` | Plan social media: strategy, content calendar, community management, follower growth. Use whenever the user asks what to post and when, or h | LICENSE |
| `social-media-strategy` | Develop comprehensive social media strategies across multiple platforms. Create content calendars, establish posting schedules, design engag | LICENSE |
| `social-publishing` | Schedule and publish social media posts across 13 platforms (X, LinkedIn, Instagram, Facebook Pages, TikTok, Discord, Telegram, YouTube, Red | LICENSE |
| `solidity-security` | Master smart contract security best practices to prevent common vulnerabilities and implement secure Solidity patterns. Use when writing sma | LICENSE |
| `solutions-architect` | Solutions architecture for technical pre-sales. Use when running technical discovery, designing integration architectures, running security  | LICENSE |
| `sop-builder` | Create Standard Operating Procedures with step-by-step workflows, RACI matrices, process maps, approval chains, and version control | LICENSE |
| `source-audit` | Use before publishing a draft that cites links: verify that each claim is actually supported by the source it points to, link by link. Trigg | LICENSE |
| `source-management` | Manages connected MCP sources for enterprise search. Detects available sources, guides users to connect new ones, handles source priority or | LICENSE |
| `spark-environment-setup` | Set up a working ML training/inference environment on NVIDIA DGX Spark (GB10, aarch64, CUDA 13). Use when installing PyTorch/Unsloth/TRL/vLL | LICENSE |
| `spark-memory-thermal-ops` | Manage unified memory and thermals during long-running ML jobs on NVIDIA DGX Spark. Use when planning memory headroom for a training run on  | LICENSE |
| `spark-optimization` | Optimize Apache Spark jobs with partitioning, caching, shuffle optimization, and memory tuning. Use when improving Spark performance, debugg | LICENSE |
| `spark-training-gotchas` | Preflight and diagnose the ten known failure modes for ML training on NVIDIA DGX Spark. Use when a training run on DGX Spark fails to start, | LICENSE |
| `spawn` | Launch the competing agents in isolated worktrees. Use when an AgentHub session is set up. | LICENSE |
| `spec-driven-workflow` | Use when a feature should be specified before coding (acceptance criteria, spec-first, tests from specs). Writes the spec with spec_generato | LICENSE |
| `spec-to-repo` | Use when the user says 'build me an app', 'create a project from this spec', 'scaffold a new repo', 'generate a starter', 'turn this idea in | LICENSE |
| `spinning-up-deep-rl` | Learn or apply deep reinforcement learning with OpenAI Spinning Up: policy gradients, VPG, PPO, SAC, TD3, DDPG, TRPO. Use whenever an RL age | LICENSE |
| `sprint-plan` | Build and audit the plan for one iteration: goal, real capacity, commit vs stretch, dependencies, risks and definition of done. Use when pla | LICENSE |
| `sprint-planning` | Plan sprints with story point estimation, capacity planning, sprint goals, and retrospective frameworks. Organize teams for effective iterat | LICENSE |
| `sprint-retrospective` | Data-driven sprint retrospectives from git history — velocity, cycle/lead time, contributor insights, and churn hotspots. Use to run a retro | LICENSE |
| `sql-database-assistant` | Write, fix and speed up SQL: slow queries, EXPLAIN plans, indexes, ORM migrations (Prisma, Drizzle, SQLAlchemy). Load whenever a query is sl | LICENSE |
| `sql-optimization-patterns` | Master SQL query optimization, indexing strategies, and EXPLAIN analysis to dramatically improve database performance and eliminate slow que | LICENSE |
| `sql-queries` | Write correct, performant SQL across all major data warehouse dialects (Snowflake, BigQuery, Databricks, PostgreSQL, etc.). Use when writing | LICENSE |
| `stage-launch` | Use when a managed-agent build sheet is ready to launch ('launch it', 'deploy the agent'). Generates and validates API payloads with payload | LICENSE |
| `stakeholder-map` | Maps stakeholders by power, interest and stance, then plans engagement and blocker conversion so objections surface early. Use for a major i | LICENSE |
| `startup-financial-modeling` | Build comprehensive 3-5 year financial models with revenue projections, cost structures, cash flow analysis, and scenario planning for early | LICENSE |
| `startup-metrics-framework` | Track, calculate, and optimize key performance metrics for SaaS, marketplace, consumer, and B2B startups from seed through Series A, includi | LICENSE |
| `statistical-analysis` | Apply statistical methods including descriptive stats, trend analysis, outlier detection, and hypothesis testing. Use when analyzing distrib | LICENSE |
| `statistical-analyst` | Is a difference real? Significance tests, confidence intervals, sample size and test duration for A/B results. Load whenever the user asks i | LICENSE |
| `status-update-generator` | Renders a weekly executive status update (highlights, blockers, risks, asks, next) from Jira or Linear data. Use when preparing a sponsor or | LICENSE |
| `statute-analysis` | Statute and regulation interpretation framework. Use when reading statutes, classifying requirements, analyzing operative keywords, applying | LICENSE |
| `stock-analysis` | Analyze, research or value a listed stock or company (US, global, NSE or BSE) with verified data, ratios, scores and valuation. Use whenever | LICENSE |
| `story-mapping` | Builds a user story map (journey backbone, ranked tasks, release lines) to agree an MVP and release order. Use when defining an MVP, slicing | LICENSE |
| `story-splitting` | Splits oversized epics and stories into thin vertical slices with nine named patterns and a decision tree. Use when a story is too big, over | LICENSE |
| `strategic-alignment` | Use when teams pull in different directions, OKRs don't connect or departments optimize locally. Maps the strategy cascade and finds orphan  | LICENSE |
| `strategic-planning` | ACTIVATE when developing long-term strategy, setting OKRs, creating vision statements, building SWOT analyses, designing strategic framework | LICENSE |
| `stress-test` | Stress-test a plan built on untested assumptions. Use whenever the user bets on a hockey-stick model or long pilot. | LICENSE |
| `strict-api` | Use when the user says 'no hallucinations', 'verify APIs' or 'don't invent functions', or code depends on a library version you have not che | LICENSE |
| `stride-analysis-patterns` | Apply STRIDE methodology to systematically identify threats. Use when analyzing system security, conducting threat modeling sessions, or cre | LICENSE |
| `stripe-integration` | Implement Stripe payment processing for robust, PCI-compliant payment flows including checkout, subscriptions, and webhooks. Use when integr | LICENSE |
| `stripe-integration-expert` | Use for any Stripe integration: subscriptions, trials, proration, checkout, usage billing, webhooks, customer portal or invoicing in Next.js | LICENSE |
| `summarize-meeting` | Turns meeting notes or transcripts into a summary of decisions, owned and dated action items, and open questions. Use when writing up a meet | LICENSE |
| `superself` | Use when a project keeps its state in Superself (a `<!-- superself:begin` block in AGENTS.md or CLAUDE.md, or `self setup` resolves the dire | LICENSE |
| `supplier-scorecard` | Build supplier performance scorecards with KPIs, quality metrics, delivery performance, cost management, and improvement plans | LICENSE |
| `support-ops` | Use for any customer support operations question - SLA attainment and breaches (first response, resolution, business hours, weekends, ticket | LICENSE |
| `swedish-mentor` | Use when someone learning Swedish wants a learning path or YouTube clips and podcasts matched to their CEFR level and skill (SFI, Lätt Svens | LICENSE |
| `swot-analysis` | Builds and audits an evidence-backed SWOT with TOWS actions for one explicit strategic question. Use when assessing a market entry, pivot, c | LICENSE |
| `syllabus` | Use when the user shares a course syllabus or outline and wants supplementary readings. Groups topics with topic_grouper.py, finds recent pe | LICENSE |
| `synthetic-buyer-panel` | Simulated buyer panel: deal reproducible persona cards, run one agent per buyer, tally buy rates, objections and price corridors. Use when a | LICENSE |
| `system-design` | Design systems, services, and architectures. Trigger with "design a system for", "how should we architect", "system design for", "what's the | LICENSE |
| `tabular-document-review` | Extract structured data from multiple documents into comparison matrix with citations. Use for bulk document review. | LICENSE |
| `tailored-resume-generator` | Analyzes job descriptions and generates tailored resumes that highlight relevant experience, skills, and achievements to maximize interview  | LICENSE |
| `tailwind-design-system` | Build scalable design systems with Tailwind CSS v4, design tokens, component libraries, and responsive patterns. Use when creating component | LICENSE |
| `talent-acquisition` | Talent acquisition across recruiting strategy, sourcing, interviews, and hiring analytics. Use when writing job descriptions, designing inte | LICENSE |
| `task-coordination-strategies` | Decompose complex tasks, design dependency graphs, and coordinate multi-agent work with proper task descriptions and workload balancing. Use | LICENSE |
| `task-management` | Simple task management using a shared TASKS.md file. Reference this when the user asks about their tasks, wants to add/complete tasks, or ne | LICENSE |
| `tax-loss-harvesting` | Identify tax-loss harvesting opportunities across taxable accounts. Finds positions with unrealized losses, suggests replacement securities, | LICENSE |
| `tc-tracker` | Use when tracking technical changes as records, or handing work between AI sessions with a change record. Creates, updates and validates cha | LICENSE |
| `tdd-guide` | Test-first development and test generation for Jest, Pytest, JUnit, Vitest or Mocha: red-green-refactor, fixtures and mocks, coverage gaps.  | LICENSE |
| `team-communication-protocols` | Structured messaging protocols for agent team communication including message type selection, plan approval, shutdown procedures, and anti-p | LICENSE |
| `team-communications` | Use for any internal communication: 3P updates, weekly or status reports, newsletters, FAQs, incident reports, leadership updates ('write my | LICENSE |
| `team-composition-analysis` | Design optimal team structures, hiring plans, compensation strategies, and equity allocation for early-stage startups from pre-seed through  | LICENSE |
| `team-composition-patterns` | Design optimal agent team compositions with sizing heuristics, preset configurations, and agent type selection. Use this skill when deciding | LICENSE |
| `tear-sheet` | Generate professional company tear sheets using S&P Capital IQ data via the Kensho LLM-ready API MCP server. Use this skill whenever the use | LICENSE |
| `teaser` | Draft anonymous one-page company teasers for sell-side M&A processes. Creates a compelling summary without revealing the company's identity, | LICENSE |
| `tech-contract-negotiation` | Negotiation frameworks for technology services agreements, B2B contracts, and professional services deals. Use when reviewing or negotiating | LICENSE |
| `tech-debt` | Identify, categorize, and prioritize technical debt. Trigger with "tech debt", "technical debt audit", "what should we refactor", "code heal | LICENSE |
| `tech-debt-tracker` | Find, rank and track tech debt in a codebase. Use whenever the user asks what to refactor first, plans a cleanup sprint, modernizes legacy c | LICENSE |
| `tech-stack-evaluator` | Compare frameworks or tech stacks before committing: side-by-side scoring, total cost of ownership, ecosystem health and migration risk. Use | LICENSE |
| `temporal-python-testing` | Test Temporal workflows with pytest, time-skipping, and mocking strategies. Covers unit testing, integration testing, replay testing, and lo | LICENSE |
| `terraform-module-library` | Build reusable Terraform modules for AWS, Azure, GCP, and OCI infrastructure following infrastructure-as-code best practices. Use when creat | LICENSE |
| `terraform-patterns` | Use for any Terraform module, state backend, provider setup or IaC security review, before editing .tf files. Analyzes modules with tf_modul | LICENSE |
| `test-scenarios` | Writes QA cases from a feature spec across happy, edge, error, empty, concurrent, accessibility and security paths, then audits coverage. Us | LICENSE |
| `testing-strategy` | Design test strategies and test plans. Trigger with "how should we test", "test strategy for", "write tests for", "test plan", "what tests d | LICENSE |
| `testrail` | Use when syncing Playwright tests with TestRail ('testrail', 'sync test cases', 'push results to testrail', 'import from testrail'). | LICENSE |
| `thesis-tracker` | Maintain and update investment theses for portfolio positions and watchlist names. Track key data points, catalysts, and thesis milestones o | LICENSE |
| `threat-detection` | Use when hunting threats, sweeping IOCs or looking for anomalies in logs and telemetry. Ranks ATT&CK-mapped signals and z-score anomalies wi | LICENSE |
| `threat-mitigation-mapping` | Map identified threats to appropriate security controls and mitigations. Use when prioritizing security investments, creating remediation pl | LICENSE |
| `ticket-triage` | Triage incoming support tickets by categorizing issues, assigning priority (P1-P4), and recommending routing. Use when a new ticket or custo | LICENSE |
| `trace-to-training-data` | Convert evaluation traces and production logs into SFT examples and preference pairs. Use when graded traces or failure examples exist and n | LICENSE |
| `track-management` | Use this skill when creating, managing, or working with Conductor tracks - the logical work units for features, bugs, and refactors. Applies | LICENSE |
| `turborepo-caching` | Configure Turborepo for efficient monorepo builds with local and remote caching. Use when setting up Turborepo, optimizing build pipelines,  | LICENSE |
| `twitter-algorithm-optimizer` | Analyze and optimize tweets for maximum reach using Twitter's open-source algorithm insights. Rewrite and edit user tweets to improve engage | LICENSE |
| `typescript-advanced-types` | Master TypeScript's advanced type system including generics, conditional types, mapped types, template literals, and utility types for build | LICENSE |
| `ui-design-system` | Use when building a design system: tokens, component docs, responsive scales or developer handoff. Generates tokens with design_token_genera | LICENSE |
| `unit-economics` | Analyze unit economics for PE targets — ARR cohorts, LTV/CAC, net retention, payback periods, revenue quality, and margin waterfall. Essenti | LICENSE |
| `unity-ecs-patterns` | Master Unity ECS (Entity Component System) with DOTS, Jobs, and Burst for high-performance game development. Use when building data-oriented | LICENSE |
| `universal-scraping-architect` | Build a scraper or extractor for sites, PDFs or paginated APIs and validate the fields (Firecrawl or local Python). Load whenever the user w | LICENSE |
| `user-research-synthesizer` | Synthesize user research findings from interviews, surveys, and analytics. Create insight reports, customer journey maps, and actionable rec | LICENSE |
| `uv-package-manager` | Master the uv package manager for fast Python dependency management, virtual environments, and modern Python project workflows. Use when set | LICENSE |
| `ux-researcher-designer` | UX research: personas, journey maps, usability test plans, synthesis. Use whenever the user asks who their users are or why they struggle. | LICENSE |
| `value-creation-plan` | Structure post-acquisition value creation plans with revenue, cost, and operational levers mapped to an EBITDA bridge. Includes 100-day prio | LICENSE |
| `value-proposition-canvas` | Maps one segment's jobs, pains and gains against your product's relievers and creators and checks fit. Use when testing whether an offer mat | LICENSE |
| `vector-index-tuning` | Optimize vector index performance for latency, recall, and memory. Use when tuning HNSW parameters, selecting quantization strategies, or sc | LICENSE |
| `vendor-due-diligence` | Assess IT vendors and third-party partners with multi-factor risk scoring and regulatory compliance checklists. Use when evaluating technolo | LICENSE |
| `vendor-evaluation` | Evaluate vendors with comparison matrices, TCO analysis, risk assessment, reference check templates, and negotiation strategies | LICENSE |
| `vendor-management` | Use when scoring or auditing vendors: scorecards, SLA compliance and service credits, third-party risk tier or a tier-1 vendor review. Runs  | LICENSE |
| `video-animatic` | Use when building an animation, motion graphic, kinetic type, animated chart from data, or animatic with code and rendering it to MP4 frame- | LICENSE |
| `video-beat-board` | Use whenever the user asks "will this voice-over fit in 30 seconds?", "is my reel script too long?", "what should I cut?", or wants a video  | LICENSE |
| `video-conform` | Use when finishing a video for delivery - mix voice-over and music, normalize loudness, add or burn in captions, and export a checked MP4 th | LICENSE |
| `video-content-strategist` | Use for video strategy, scripts, YouTube SEO, short-form pipelines (Reels, TikTok, Shorts) or turning long content into video, before script | LICENSE |
| `video-director` | Use whenever the user asks you to make, plan or produce a whole video - a launch teaser, promo, explainer, trailer, social clip or short fil | LICENSE |
| `vision-sft` | Fine-tune vision-language models (VLMs) with supervised learning on image+text data. Use when adapting a VLM to a visual domain or task, con | LICENSE |
| `visual-design-foundations` | Apply typography, color theory, spacing systems, and iconography principles to create cohesive visual designs. Use when establishing design  | LICENSE |
| `visual-edit-precision` | Use when making UI/frontend changes guided by visual context, when the user selects elements visually, draws annotations, or provides screen | LICENSE |
| `vpe-advisor` | Use when delivery is slowing, eng hiring is broken, team structure is unclear or you need to decide when to add an eng manager. Runs deliver | LICENSE |
| `vpe-review` | Challenge a plan on delivery speed, eng hiring, team structure or on-call. Use when asked or /c-level-agents:vpe-review. | LICENSE |
| `wayfinder` | Chart work too big for one sprint as a map of decision tickets, resolve them in dependency order, then turn answers into tracer-bullet ticke | LICENSE |
| `wcag-audit-patterns` | Conduct WCAG 2.2 accessibility audits with automated testing, manual verification, and remediation guidance. Use when auditing websites for  | LICENSE |
| `web-component-design` | Master React, Vue, and Svelte component patterns including CSS-in-JS, composition strategies, and reusable component architecture. Use when  | LICENSE |
| `web3-testing` | Test smart contracts comprehensively using Hardhat and Foundry with unit tests, integration tests, and mainnet forking. Use when testing Sol | LICENSE |
| `webinar-marketing` | Use when planning, promoting or fixing a webinar or virtual event (registrations, show-up, follow-up, conversion). Scores each funnel stage  | LICENSE |
| `weekly-prep-brief` | Generate a comprehensive weekly briefing for all external calls in the next 7 days. Triggers on 'weekly prep brief', 'prepare my week', 'wha | LICENSE |
| `weekly-review` | Use when someone wants to run a weekly review, close open loops, audit stalled projects and commitments, get their system back to trusted, r | LICENSE |
| `whistleblower-compliance` | Audit whistleblower systems and draft compliant reporting policies. Use when assessing or building whistleblower programs. | LICENSE |
| `workflow-builder` | Use when writing or running a Claude Code Workflow-tool script (.js in .claude/workflows/) for fan-out, pipeline, loop or judge-panel sub-ag | LICENSE |
| `workflow-orchestration-patterns` | Design durable workflows with Temporal for distributed systems. Covers workflow vs activity separation, saga patterns, state management, and | LICENSE |
| `workflow-patterns` | Use this skill when implementing tasks according to Conductor's TDD workflow, handling phase checkpoints, managing git commits for tasks, or | LICENSE |
| `wrap-up` | Use when closing out a launched managed agent ('wrap up', 'what do I own now'). Inventories primitives with primitives_inventory.py, regener | LICENSE |
| `write-a-skill` | Create new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, build, o | LICENSE |
| `wwas` | Writes and grades Why-What-Acceptance backlog items so each one traces to an OKR and passes INVEST before a sprint. Use when writing backlog | LICENSE |
| `x-twitter-growth` | Use for growing on X/Twitter: tweets, threads, profile audit, competitors or posting plan. Audits the profile with profile_auditor.py, draft | LICENSE |
| `xlsx-toolkit` | Audit Microsoft Excel (.xlsx) workbooks for formula density, external references, named ranges, hidden sheets, and data validation. Use when | LICENSE |
| `youtube-full` | Use for any YouTube URL, video ID or @handle, or a request for transcripts, video search, channel, playlist or new-upload monitoring. Fetche | LICENSE |
| `zero-hallucination-coder` | Use before high-stakes or multi-file coding (auth, databases, migrations), or when asked to plan carefully and avoid invented APIs. Runs dis | LICENSE |
