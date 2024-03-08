---
to:  <%= serviceName %>/tests/utils/getApp.ts
---

import { asClass } from 'awilix'

import { Application, GrpcService, MoleculerService, ServiceContext, ServiceOperator } from '@diia-inhouse/diia-app'

import { mockClass } from '@diia-inhouse/test'
import { ServiceName } from '@diia-inhouse/types'

import config from '@src/config'

import { TestDeps } from '@tests/interfaces'
import deps from '@tests/utils/getDeps'

import { AppConfig } from '@interfaces/config'
import { AppDeps } from '@interfaces/deps'

export function getApp(): ServiceOperator<AppConfig, AppDeps & TestDeps> {
    const app = new Application<ServiceContext<AppConfig, AppDeps & TestDeps>>(ServiceName.<%= h.changeCase.pascal(serviceName) %>)
        .setConfig(config)
        .setDeps(deps)
        .overrideDeps({
            moleculer: asClass(mockClass(MoleculerService)).singleton(),
            grpcService: asClass(mockClass(GrpcService)).singleton(),
        })
        .initialize()

    return app
}
