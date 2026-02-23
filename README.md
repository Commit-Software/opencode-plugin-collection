# opencode-plugin-collection

A collection of OpenCode plugins and commands.

## Installation

```bash
npm install -g opencode-plugin-collection
# or
bun add -g opencode-plugin-collection
```

## Usage

Add the plugin to your `opencode.json`:
```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": ["opencode-plugin-collection"]
}
```

This loads all plugins in the collection.

## Included Plugins

### `/code-simplifier`

Simplifies and refines code for clarity, consistency, and maintainability while preserving functionality.

```
/code-simplifier src/utils.ts
/code-simplifier src/components/Button.tsx src/hooks/useAuth.ts
```

**What it does:**
- Preserves functionality while improving code structure
- Applies project coding standards (ES modules, explicit types, etc.)
- Enhances clarity by reducing complexity and improving naming
- Maintains balance to avoid over-simplification

## Adding New Plugins

To add a new plugin to this collection:

1. Create a new plugin function in `index.ts`:

```typescript
const MyNewPlugin: Plugin = async (ctx) => {
  return {
    config: async (config) => {
      if (!config.command) config.command = {}
      config.command["my-command"] = {
        template: "Your prompt template with $ARGUMENTS",
        description: "What this command does",
        agent: "build",
      }
    },
  }
}
```

2. Add it to the `plugins` array in `PluginCollection`:

```typescript
const plugins = [CodeSimplifierPlugin, MyNewPlugin]
```

3. Export it:

```typescript
export { CodeSimplifierPlugin, MyNewPlugin }
```

## Requirements
- OpenCode v1.0.0 or later
- Bun (used by OpenCode for plugin installation)
## Development

```bash
bun install       # Install dependencies
bun run build     # Build
bun run typecheck # Type check
```

## License

Apache License 2.0 - See [LICENSE](LICENSE) for details.

## Credits

- `/code-simplifier` based on [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-simplifier)