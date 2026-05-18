---
to:  <%= serviceName %>/src/deps.ts
---

import { DepsFactoryFn } from '@diia-inhouse/diia-app'

import { AppConfig } from '@interfaces/config.js'
import { AppDeps } from '@interfaces/deps.js'

export default async (_config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps>> => {
    return {}
}
