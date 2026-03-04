---
to:  <%= packageName %>/vitest.config.mts
---

import tsConfigPaths from 'vite-tsconfig-paths'
import { defineProject } from 'vitest/config'

const timeout = 60 * 1000

export default defineProject({
    plugins: [tsConfigPaths()],
    test: {
        name: 'unit',
        testTimeout: timeout,
        hookTimeout: timeout,
        exclude: ['node_modules', 'dist'],
        include: ['tests/unit/**/*.spec.ts'],
    },
})
