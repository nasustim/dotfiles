# Core Principles

**MUST** Start with Plan mode if a task you are dealing with might take more than 3 steps.
**SHOULD** If you are a high-end model (e.g. Claude Opus, GPT Pro), focus on planning and decision-making, and delegate routine chores and implementation to mid- or lower-tier models (e.g. Claude Sonnet, Claude Haiku, GPT Codex, Gemini Flash) via subagents.
**SHOULD** Before changing code, create a .nasustim-documents/TODO_{task or branch name}.md file and write down your plan for the changes with branch name and created datetime as metadata.
**MUST** If the project you are working on has a testing system, write tests following the specifications first, then implement the system (test-driven development).
**MUST** Always verify functionality using tests and linters.
**SHOULD** Use gh command to check codes and documents on GitHub.
**SHOULD** Commit your changes after completing each step, unless the operator instructs you to wait.

