---
to:  <%= serviceName %>/src/interfaces/deps.ts
---

import { GrpcService } from '@diia-inhouse/diia-app'

<%- h.isOptionSelected(selectedOptions, 'database') ? "import { DatabaseService } from '@diia-inhouse/db'" : '' %>
<%- h.isOptionSelected(selectedOptions, 'redis') ? "import { RedisDeps } from '@diia-inhouse/redis'" : '' %>
<%- h.isOptionSelected(selectedOptions, 'http') ? "import { HttpDeps } from '@diia-inhouse/http'" : '' %>
<%- h.isOptionSelected(selectedOptions, ['internal', 'external']) ? "import { QueueDeps } from '@diia-inhouse/diia-queue'" : '' %>

import { AnalyticsService } from '@diia-inhouse/analytics'
import { HealthCheck } from '@diia-inhouse/healthcheck'

import { AppConfig } from '@src/interfaces/config'

export type AppDeps = {
    config: AppConfig
    healthCheck: HealthCheck
    grpcService: GrpcService
    analytics: AnalyticsService
    <%- h.isOptionSelected(selectedOptions, 'database') ? "database: DatabaseService" : '' %>
} <%- h.isOptionSelected(selectedOptions, ['internal', 'external']) ? "& Partial<QueueDeps>" : '' %>
<%- h.isOptionSelected(selectedOptions, 'redis') ? "& Partial<RedisDeps>" : '' %>
<%- h.isOptionSelected(selectedOptions, 'http') ? "& HttpDeps" : '' %>
