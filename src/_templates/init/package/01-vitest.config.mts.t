---
to:  <%= packageName %>/vitest.config.mts
---

import { fileURLToPath } from 'node:url'

import { defineConfig } from 'vitest/config'

const timeout = 60 * 1000
const srcDir = fileURLToPath(new URL('./src', import.meta.url))

export default defineConfig({
    resolve: {
        alias: [{ find: /^#(.*)$/, replacement: `${srcDir}/$1` }],
    },
    test: {
        name: 'unit',
        env: {
            NODE_ENV: 'test',
        },
        clearMocks: true,
        restoreMocks: true,
        mockReset: true,
        globals: true,
        testTimeout: timeout,
        hookTimeout: timeout,
        exclude: ['node_modules', 'dist'],
        include: ['tests/unit/**/*.spec.ts'],
    },
})
