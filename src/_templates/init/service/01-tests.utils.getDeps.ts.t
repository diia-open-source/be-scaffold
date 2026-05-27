---
to:  <%= serviceName %>/tests/utils/getDeps.ts
---

import { DepsFactoryFn, asClass } from '@diia-inhouse/diia-app'

import TestKit from '@diia-inhouse/test'

import { AppConfig } from '#configs/config.types.js'
import deps from '#deps/index.js'
import { AppDeps } from '#deps/types.js'

import { TestDeps } from '#tests/interfaces.js'

export default async (config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps & TestDeps>> => {
    return {
        ...(await deps(config)),

        testKit: asClass(TestKit).singleton(),
    }
}
