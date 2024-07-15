---
to:  <%= serviceName %>/src/config.ts
---

import { BaseConfig } from '@diia-inhouse/diia-app'

import { EnvService } from '@diia-inhouse/env'
<%if (h.isOptionSelected(selectedOptions, 'redis')) {%>
import { RedisConfig } from '@diia-inhouse/redis'
<%}%>
<%if (h.isOptionSelected(selectedOptions, ['internal', 'external'])) {%>
import {
    InternalQueueConfig,
    InternalQueueName,
    ListenerOptions,
    QueueConnectionConfig,
    QueueConnectionType,
    QueueConfig,
    ScheduledTaskQueueName,
} from '@diia-inhouse/diia-queue'
<%}%>

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export default async (envService: EnvService <%= h.isOptionSelected(selectedOptions, ['internal', 'external']) ? ", serviceName: string" : '' %>) => ({
    transporter: {
        type: envService.getVar('TRANSPORT_TYPE'),
        options: envService.getVar('TRANSPORT_OPTIONS', 'object', {}),
    },

    balancing: {
        strategy: envService.getVar('BALANCING_STRATEGY_NAME', 'string'),
        strategyOptions: envService.getVar('BALANCING_STRATEGY_OPTIONS', 'object', {}),
    },

    healthCheck: {
        isEnabled: envService.getVar('HEALTH_CHECK_IS_ENABLED', 'boolean'),
        port: envService.getVar('HEALTH_CHECK_IS_PORT', 'number', 4545),
    },

    metrics: {
        moleculer: {
            prometheus: {
                isEnabled: envService.getVar('METRICS_MOLECULER_PROMETHEUS_IS_ENABLED', 'boolean', true),
                port: envService.getVar('METRICS_MOLECULER_PROMETHEUS_PORT', 'number', 3031),
                path: envService.getVar('METRICS_MOLECULER_PROMETHEUS_PATH', 'string', '/metrics'),
            },
        },
        custom: {
            disabled: envService.getVar('METRICS_CUSTOM_DISABLED', 'boolean', false),
            port: envService.getVar('METRICS_CUSTOM_PORT', 'number', 3030),
            moleculer: {
                disabled: envService.getVar('METRICS_CUSTOM_MOLECULER_DISABLED', 'boolean', false),
                port: envService.getVar('METRICS_CUSTOM_MOLECULER_PORT', 'number', 3031),
                path: envService.getVar('METRICS_CUSTOM_MOLECULER_PATH', 'string', '/metrics'),
            },
            disableDefaultMetrics: envService.getVar('METRICS_CUSTOM_DISABLE_DEFAULT_METRICS', 'boolean', false),
            defaultLabels: envService.getVar('METRICS_CUSTOM_DEFAULT_LABELS', 'object', {}),
        },
    },

    grpcServer: {
        isEnabled: envService.getVar('GRPC_SERVER_ENABLED', 'boolean', false),
        port: envService.getVar('GRPC_SERVER_PORT', 'number', 5000),
        services: envService.getVar('GRPC_SERVICES', 'object'),
        isReflectionEnabled: envService.getVar('GRPC_REFLECTION_ENABLED', 'boolean', false),
        maxReceiveMessageLength: envService.getVar('GRPC_SERVER_MAX_RECEIVE_MESSAGE_LENGTH', 'number', 1024 * 1024 * 4),
    },

    grpc: {},

    <%if (h.isOptionSelected(selectedOptions, 'database')) {%>
        db: {
            database: envService.getVar('MONGO_DATABASE', 'string'),
            replicaSet: envService.getVar('MONGO_REPLICA_SET', 'string'),
            user: await envService.getSecret('MONGO_USER', { accessor: 'username', nullable: true }),
            password: await envService.getSecret('MONGO_PASSWORD', { accessor: 'password', nullable: true }),
            authSource: envService.getVar('MONGO_AUTH_SOURCE', 'string', null),
            port: envService.getVar('MONGO_PORT', 'number'),
            replicaSetNodes: envService
                .getVar('MONGO_HOSTS', 'string')
                .split(',')
                .map((replicaHost: string) => ({ replicaHost })),
            readPreference: envService.getVar('MONGO_READ_PREFERENCE', 'string'),
            indexes: {
                sync: envService.getVar('MONGO_INDEXES_SYNC', 'boolean'),
                exitAfterSync: envService.getVar('MONGO_INDEXES_EXIT_AFTER_SYNC', 'boolean'),
            },
        },
    <%}%>

    <%if (h.isOptionSelected(selectedOptions, 'external')) {%>
        redis: {
            readWrite: envService.getVar('REDIS_READ_WRITE_OPTIONS', 'object'),

            readOnly: envService.getVar('REDIS_READ_ONLY_OPTIONS', 'object'),
        },
    <%}%>

    <%if (h.isOptionSelected(selectedOptions, 'redis')) {%>
        store: {
            readWrite: envService.getVar('STORE_READ_WRITE_OPTIONS', 'object'),

            readOnly: envService.getVar('STORE_READ_ONLY_OPTIONS', 'object'),
        },
    <%}%>

    <%if (h.isOptionSelected(selectedOptions, ['internal', 'external'])) {%>
    rabbit: {
        <%if (h.isOptionSelected(selectedOptions, 'internal')) {%>
        [QueueConnectionType.Internal]: {
                connection: {
                    hostname: envService.getVar('RABBIT_HOST', 'string'),
                    port: envService.getVar('RABBIT_PORT', 'number'),
                    username: await envService.getSecret('RABBIT_USERNAME', { accessor: 'username' }),
                    password: await envService.getSecret('RABBIT_PASSWORD', { accessor: 'password' }),
                    heartbeat: envService.getVar('RABBIT_HEARTBEAT', 'number'),
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
                    prefetchCount: envService.getVar('RABBIT_QUEUE_PREFETCH_COUNT', 'number', 10),
                },
                // Uncomment if listening to scheduled tasks needed
                // scheduledTaskQueueName: ScheduledTaskQueueName.,
                // Uncomment if listening to internal bus events needed
                // queueName: InternalQueueName.,
            },
        <%}%>
        <%if (h.isOptionSelected(selectedOptions, 'external')) {%>
        [QueueConnectionType.External]: {
            connection: {
                hostname: envService.getVar('EXTERNAL_RABBIT_HOST', 'string'),
                port: envService.getVar('EXTERNAL_RABBIT_PORT', 'number'),
                username: await envService.getSecret('EXTERNAL_RABBIT_USERNAME', { accessor: 'username' }),
                password: await envService.getSecret('EXTERNAL_RABBIT_PASSWORD', { accessor: 'password' }),
                heartbeat: envService.getVar('EXTERNAL_RABBIT_HEARTBEAT', 'number'),
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
                prefetchCount: envService.getVar('EXTERNAL_RABBIT_QUEUE_PREFETCH_COUNT', 'number', 1),
            },
            assertExchanges: envService.getVar('EXTERNAL_RABBIT_ASSERT_EXCHANGES', 'boolean'),
            custom: {
                responseRoutingKeyPrefix: envService.getVar('EXTERNAL_RABBIT_RESPONSE_ROUTING_KEY_PREFIX', 'string', null),
            },
        },
        <%}%>
    },
    <%}%>
}) satisfies BaseConfig & Record<string, unknown>
