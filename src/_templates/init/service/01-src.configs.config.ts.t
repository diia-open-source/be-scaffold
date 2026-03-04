---
to:  <%= serviceName %>/src/configs/config.ts
---

import { BaseConfig } from '@diia-inhouse/diia-app'

import { EnvService } from '@diia-inhouse/env'
<%if (h.isOptionSelected(selectedDependencies, ['redis'])) {%>
import { RedisOptions } from '@diia-inhouse/redis'
<%}%>
<%if (h.isOptionSelected(selectedDependencies, ['internal', 'external'])) {%>
import { QueueConnectionType, QueueTypes } from '@diia-inhouse/diia-queue'

import serviceRulesConfig from '@src/configs/queue'
<%}%>

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export default async (<%= h.isOptionSelected(selectedDependencies, ['database', 'internal', 'external']) ? "envService: EnvService, " : '' %> <%= h.isOptionSelected(selectedDependencies, ['internal', 'external']) ? "serviceName: string" : '' %>) => ({
    healthCheck: {
        isEnabled: EnvService.getVar('HEALTH_CHECK_IS_ENABLED', 'boolean'),
        port: EnvService.getVar('HEALTH_CHECK_IS_PORT', 'number', 4545),
    },

    metrics: {
        custom: {
            disabled: EnvService.getVar('METRICS_CUSTOM_DISABLED', 'boolean', false),
            port: EnvService.getVar('METRICS_CUSTOM_PORT', 'number', 3030),
            disableDefaultMetrics: EnvService.getVar('METRICS_CUSTOM_DISABLE_DEFAULT_METRICS', 'boolean', false),
            defaultLabels: EnvService.getVar('METRICS_CUSTOM_DEFAULT_LABELS', 'object', {}),
            pushGateway: {
                isEnabled: EnvService.getVar('METRICS_PUSH_GATEWAY_IS_ENABLED', 'boolean', false),
                url: EnvService.getVar('METRICS_PUSH_GATEWAY_URL', 'string', null),
                intervalMs: EnvService.getVar('METRICS_PUSH_GATEWAY_INTERVAL_MS', 'number', null),
            },
        },
    },

    grpcServer: {
        isEnabled: EnvService.getVar('GRPC_SERVER_ENABLED', 'boolean', false),
        port: EnvService.getVar('GRPC_SERVER_PORT', 'number', 5000),
        services: EnvService.getVar('GRPC_SERVICES', 'object'),
        isReflectionEnabled: EnvService.getVar('GRPC_REFLECTION_ENABLED', 'boolean', false),
        maxReceiveMessageLength: EnvService.getVar('GRPC_SERVER_MAX_RECEIVE_MESSAGE_LENGTH', 'number', 1024 * 1024 * 4),
    },

    grpc: {},

    <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
        db: {
            database: EnvService.getVar('MONGO_DATABASE', 'string'),
            replicaSet: EnvService.getVar('MONGO_REPLICA_SET', 'string'),
            user: await envService.getSecret('MONGO_USER', { accessor: 'username', nullable: true }),
            password: await envService.getSecret('MONGO_PASSWORD', { accessor: 'password', nullable: true }),
            authSource: EnvService.getVar('MONGO_AUTH_SOURCE', 'string', null),
            port: EnvService.getVar('MONGO_PORT', 'number'),
            replicaSetNodes: EnvService
                .getVar('MONGO_HOSTS', 'string')
                .split(',')
                .map((replicaHost: string) => ({ replicaHost })),
            readPreference: EnvService.getVar('MONGO_READ_PREFERENCE', 'string'),
            metrics: {
                enabled: EnvService.getVar('MONGO_METRICS_ENABLED', 'boolean'),
            },
        },
    <%}%>

    <%if (h.isOptionSelected(selectedDependencies, 'redis')) {%>
        store: {
            readWrite: EnvService.getVar('STORE_READ_WRITE_OPTIONS', 'object') as RedisOptions,
            readOnly: EnvService.getVar('STORE_READ_ONLY_OPTIONS', 'object') as RedisOptions,
        },
    <%}%>

    <%if (h.isOptionSelected(selectedDependencies, ['internal', 'external'])) {%>
    rabbit: {
        serviceRulesConfig,
        <%if (h.isOptionSelected(selectedDependencies, 'internal')) {%>
        [QueueConnectionType.Internal]: {
                connection: {
                    hostname: EnvService.getVar('RABBIT_HOST', 'string'),
                    port: EnvService.getVar('RABBIT_PORT', 'number'),
                    username: await envService.getSecret('RABBIT_USERNAME', { accessor: 'username' }),
                    password: await envService.getSecret('RABBIT_PASSWORD', { accessor: 'password' }),
                    heartbeat: EnvService.getVar('RABBIT_HEARTBEAT', 'number'),
                },
                socketOptions: {
                    clientProperties: {
                        applicationName: `${serviceName} Service`,
                    },
                },
                reconnectOptions: {
                    reconnectEnabled: true,
                },
                listenerOptions: {
                    prefetchCount: EnvService.getVar('RABBIT_QUEUE_PREFETCH_COUNT', 'number', 10),
                },
                declareOptions: {
                    assertQueues: EnvService.getVar('RABBIT_ASSERT_QUEUES', 'boolean'),
                    assertExchanges: EnvService.getVar('RABBIT_ASSERT_EXCHANGES', 'boolean'),
                    queuesOptions: {
                        type: QueueTypes.Quorum,
                        options: {
                            durable: true,
                        },
                    },
                },
                // Uncomment if listening to scheduled tasks needed
                // scheduledTaskQueueName: ScheduledTaskQueueName.,
                // Uncomment if listening to internal bus events needed
                // queueName: InternalQueueName.,
            },
        <%}%>
        <%if (h.isOptionSelected(selectedDependencies, 'external')) {%>
        [QueueConnectionType.External]: {
            connection: {
                hostname: EnvService.getVar('EXTERNAL_RABBIT_HOST', 'string'),
                port: EnvService.getVar('EXTERNAL_RABBIT_PORT', 'number'),
                username: await envService.getSecret('EXTERNAL_RABBIT_USERNAME', { accessor: 'username' }),
                password: await envService.getSecret('EXTERNAL_RABBIT_PASSWORD', { accessor: 'password' }),
                heartbeat: EnvService.getVar('EXTERNAL_RABBIT_HEARTBEAT', 'number'),
            },
            socketOptions: {
                clientProperties: {
                    applicationName: `${serviceName} Service`,
                },
            },
            reconnectOptions: {
                reconnectEnabled: true,
            },
            listenerOptions: {
                prefetchCount: EnvService.getVar('EXTERNAL_RABBIT_QUEUE_PREFETCH_COUNT', 'number', 1),
            },
            declareOptions: {
                assertQueues: EnvService.getVar('EXTERNAL_RABBIT_ASSERT_QUEUES', 'boolean'),
                assertExchanges: EnvService.getVar('EXTERNAL_RABBIT_ASSERT_EXCHANGES', 'boolean'),
                queuesOptions: {
                    type: QueueTypes.Quorum,
                    options: {
                        durable: true,
                    },
                },
            },
            custom: {
                responseRoutingKeyPrefix: EnvService.getVar('EXTERNAL_RABBIT_RESPONSE_ROUTING_KEY_PREFIX', 'string', null),
            },
        },
        <%}%>
    },
    <%}%>
}) satisfies BaseConfig & Record<string, unknown>
