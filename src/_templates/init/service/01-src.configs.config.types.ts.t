---
to:  <%= serviceName %>/src/configs/config.types.ts
---

import config from '#configs/config.js'

export type AppConfig = Awaited<ReturnType<typeof config>>
