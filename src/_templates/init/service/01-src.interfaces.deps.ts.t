---
to:  <%= serviceName %>/src/interfaces/deps.ts
---

import { AppConfig } from '@src/interfaces/config'

export type AppDeps = {
    config: AppConfig
}
