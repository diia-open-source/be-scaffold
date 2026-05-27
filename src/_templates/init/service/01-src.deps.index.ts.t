---
to:  <%= serviceName %>/src/deps/index.ts
---

import { DepsFactoryFn } from '@diia-inhouse/diia-app'

import { AppConfig } from '#configs/config.types.js'
import { AppDeps } from '#deps/types.js'

export default async (_config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps>> => {
    return {}
}
