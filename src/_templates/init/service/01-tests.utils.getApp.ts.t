---
to:  <%= serviceName %>/tests/utils/getApp.ts
---

import { Application, ServiceContext, ServiceOperator } from '@diia-inhouse/diia-app'

import config from '@src/config'

import { TestDeps } from '@tests/interfaces'
import deps from '@tests/utils/getDeps'

import { AppConfig } from '@interfaces/config'
import { AppDeps } from '@interfaces/deps'

export async function getApp(): Promise<ServiceOperator<AppConfig, AppDeps & TestDeps>> {
    const app = new Application<ServiceContext<AppConfig, AppDeps & TestDeps>>('<%= h.changeCase.pascal(serviceName) %>')

    await app.setConfig(config)
    await app.setDeps(deps)

    const appOperator = await app.initialize()

    await appOperator.start()

    return appOperator
}
