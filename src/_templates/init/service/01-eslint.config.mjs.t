---
to:  <%= serviceName %>/eslint.config.mjs
---

import diiaConfig, { serviceBoundariesConfig } from '@diia-inhouse/eslint-config'

/**  @type {import('eslint').Linter.Config}  */
export default [
    ...diiaConfig,
    ...serviceBoundariesConfig,
    {
        ignores: [
            '*.js',
            '*.mjs',
            'node_modules',
            'dist',
            'coverage',
            'migrate-mongo-config.ts',
            'src/generated/**',
        ],
    },
]
