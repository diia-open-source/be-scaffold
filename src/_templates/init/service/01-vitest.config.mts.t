---
to:  <%= serviceName %>/vitest.config.mts
---

import { fileURLToPath } from 'node:url'

import { defineProject } from 'vitest/config'

const timeout = 60 * 1000
const srcDir = fileURLToPath(new URL('./src', import.meta.url))
const testsDir = fileURLToPath(new URL('./tests', import.meta.url))

export default defineProject({
    resolve: {
        alias: [
            { find: /^#tests\/(.*)$/, replacement: `${testsDir}/$1` },
            { find: /^#tests$/, replacement: testsDir },
            { find: /^#(.*)$/, replacement: `${srcDir}/$1` },
        ],
    },
    test: {
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
        setupFiles: ['@diia-inhouse/test/vitest'],
        projects: [
            {
                extends: true,
                test: {
                    name: 'unit',
                    include: ['tests/unit/**/*.spec.ts'],
                },
            },
            {
                extends: true,
                test: {
                    name: 'integration',
                    include: ['tests/integration/**/*.spec.ts'],
                },
            },
        ],
    },
})
