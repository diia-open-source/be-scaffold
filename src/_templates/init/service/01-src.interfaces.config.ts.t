---
to:  <%= serviceName %>/src/interfaces/config.ts
---

import config from '@src/config'

export type AppConfig = ReturnType<typeof config>
