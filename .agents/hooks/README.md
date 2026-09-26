# Agent Hooks

Store repository-local hook definitions or scripts that run around agent workflows or repository events.

Typical uses include:

- pre-change safety checks;
- post-change validation;
- documentation synchronization checks;
- lightweight policy enforcement;
- integration with tool-specific hook systems.

Hooks should automate existing repository rules; they should not hide new product or architecture policy that exists nowhere else.

If a hook depends on Claude, Codex, Copilot, or another vendor-specific mechanism, keep the adapter-specific configuration in that tool's directory and keep shared behavior here when practical.
