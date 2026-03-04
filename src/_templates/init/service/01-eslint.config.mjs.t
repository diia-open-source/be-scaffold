---
to:  <%= serviceName %>/eslint.config.mjs
---

import diiaConfig from '@diia-inhouse/eslint-config'

/**  @type {import('eslint').Linter.Config}  */
export default [
    ...diiaConfig,
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
