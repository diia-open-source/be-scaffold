---
to:  <%= serviceName %>/src/bootstrap.ts
---

import { Application, ServiceContext } from '@diia-inhouse/diia-app'

import { ServiceName } from '@diia-inhouse/types'

import config from '@src/config'
import deps from '@src/deps'

import { AppConfig } from '@interfaces/config'
import { AppDeps } from '@interfaces/deps'

export async function bootstrap(serviceName: ServiceName): Promise<void> {
    const app = new Application<ServiceContext<AppConfig, AppDeps>>(serviceName).setConfig(config).setDeps(deps).initialize()

    await app.start()
}
