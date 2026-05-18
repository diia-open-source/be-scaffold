---
to:  <%= serviceName %>/oxlint.config.ts
---

import { defineConfig, base } from '@diia-inhouse/oxc-config/oxlint'

export default defineConfig({
    ...base,
    ignorePatterns: [...base.ignorePatterns, 'src/generated', 'migrate-mongo-config.ts'],
    rules: {
        ...base.rules,
        '@diia-inhouse/locale/no-hardcoded-cyrillic': 'off',
        'eslint/no-restricted-imports': 'off',
    },
    overrides: [
        ...(base.overrides ?? []),
        {
            files: ['migrations/**/*.ts'],
            rules: {
                'unicorn/filename-case': 'off',
            },
        },
    ],
})
