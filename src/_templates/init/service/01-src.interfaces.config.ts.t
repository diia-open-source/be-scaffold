---
to:  <%= serviceName %>/src/interfaces/config.ts
---

import config from '@src/configs/config.js'

export type AppConfig = Awaited<ReturnType<typeof config>>
