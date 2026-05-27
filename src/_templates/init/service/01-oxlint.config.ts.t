---
to:  <%= serviceName %>/oxlint.config.ts
---

import { defineConfig, boundaries } from '@diia-inhouse/oxc-config/oxlint'

export default defineConfig({
    ...boundaries,
    ignorePatterns: [...boundaries.ignorePatterns, 'src/generated', 'migrate-mongo-config.ts', 'migrations/**'],
})
