import { defineConfig, base } from '@diia-inhouse/oxc-config/oxlint'

export default defineConfig({
    ...base,
    ignorePatterns: [...base.ignorePatterns, 'generation-result', 'src/bin.ts'],
    rules: {
        ...base.rules,
        // this is a CLI tool: console output is the user interface
        'no-console': 'off',
    },
})
