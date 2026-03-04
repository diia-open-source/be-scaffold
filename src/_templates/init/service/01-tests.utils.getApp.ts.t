---
to:  <%= serviceName %>/tests/utils/getApp.ts
---

import { Application, GrpcClientFactory, ServiceContext, ServiceOperator, NodeTracerProvider, asFunction } from '@diia-inhouse/diia-app'

import config from '@src/configs/config'
import { loggerConfig } from '@src/configs/logger'
import { <%= h.changeCase.pascal(serviceName) %>Definition } from '@src/generated'

import { TestDeps } from '@tests/interfaces'
import deps from '@tests/utils/getDeps'

import { AppConfig } from '@interfaces/config'
import { AppDeps } from '@interfaces/deps'

const modules = {
    actions: import.meta.glob('/src/actions/**/*.ts'),
    services: import.meta.glob('/src/services/**/*.ts'),
}

export async function getApp(): Promise<ServiceOperator<AppConfig, AppDeps & TestDeps>> {
    const app = new Application<ServiceContext<AppConfig, AppDeps & TestDeps>>('<%= h.changeCase.pascal(serviceName) %>', new NodeTracerProvider(), loggerConfig)

    await app.setConfig(config)
    await app.setDeps(deps)

    const dynamicDeps = await app.extractDependenciesFromModules(modules, 'src')
    const appOperator = await app.initialize(dynamicDeps)
    const { grpcService } = await appOperator.start()

    appOperator.container.register({
        <%= h.changeCase.camel(serviceName) %>Client: asFunction((grpcClientFactory: GrpcClientFactory) =>
            grpcClientFactory.createGrpcClient(<%= h.changeCase.pascal(serviceName) %>Definition, `localhost:${grpcService.serverPort}`),
        ).singleton(),
    })

    return appOperator
}
