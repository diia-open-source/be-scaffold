---
to:  <%= serviceName %>/src/deps/types.ts
---

import { AppConfig } from '#configs/config.types.js'

export type AppDeps = {
    config: AppConfig
}
