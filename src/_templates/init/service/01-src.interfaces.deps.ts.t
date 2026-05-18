---
to:  <%= serviceName %>/src/interfaces/deps.ts
---

import { AppConfig } from '@src/interfaces/config.js'

export type AppDeps = {
    config: AppConfig
}
