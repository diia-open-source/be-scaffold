---
to:  <%= serviceName %>/tests/utils/getDeps.ts
---

import { DepsFactoryFn, asClass } from '@diia-inhouse/diia-app'

import TestKit from '@diia-inhouse/test'

import deps from '@src/deps.js'

import { TestDeps } from '@tests/interfaces.js'

import { AppConfig } from '@interfaces/config.js'
import { AppDeps } from '@interfaces/deps.js'

export default async (config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps & TestDeps>> => {
    return {
        ...(await deps(config)),

        testKit: asClass(TestKit).singleton(),
    }
}
