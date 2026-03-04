---
to:  <%= serviceName %>/.env.example
---
NODE_ENV=local
LOG_LEVEL=info

NODE_OPTIONS=--enable-source-maps

TRACING_ENABLED=false
TRACING_EXPORTER_URL=

VAULT_ENABLED=false
VAULT_ADDR=
VAULT_ROLE=

<% if (h.isOptionSelected(selectedDependencies, 'redis')) { -%>
STORE_READ_WRITE_OPTIONS={"port":6379}
STORE_READ_ONLY_OPTIONS={"port":6379}

<% } -%>
<% if (h.isOptionSelected(selectedDependencies, 'database')) { -%>
MONGO_HOST=mongo1
MONGO_HOSTS=mongo1,mongo2,mongo3
MONGO_PORT=27017
MONGO_DATABASE=diia-<%= serviceName %>-service
MONGO_USER=
MONGO_PASSWORD=
MONGO_REPLICA_SET=diia
MONGO_READ_PREFERENCE=primary
MONGO_METRICS_ENABLED=false

<% } -%>
<% if (h.isOptionSelected(selectedDependencies, 'internal')) { -%>
RABBIT_HOST=127.0.0.1
RABBIT_PORT=5672
RABBIT_USERNAME=guest
RABBIT_PASSWORD=guest
RABBIT_HEARTBEAT=60
RABBIT_QUEUE_PREFETCH_COUNT=1
RABBIT_ASSERT_EXCHANGES=true
RABBIT_ASSERT_QUEUES=true

<% } -%>
<% if (h.isOptionSelected(selectedDependencies, 'external')) { -%>
EXTERNAL_RABBIT_HOST=127.0.0.1
EXTERNAL_RABBIT_PORT=5672
EXTERNAL_RABBIT_USERNAME=guest
EXTERNAL_RABBIT_PASSWORD=guest
EXTERNAL_RABBIT_HEARTBEAT=60
EXTERNAL_RABBIT_QUEUE_PREFETCH_COUNT=1
EXTERNAL_RABBIT_ASSERT_EXCHANGES=true
EXTERNAL_RABBIT_ASSERT_QUEUES=true

<% } -%>
METRICS_CUSTOM_DISABLED=true
METRICS_PUSH_GATEWAY_IS_ENABLED=false
METRICS_PUSH_GATEWAY_URL=http://localhost:9091

HEALTH_CHECK_IS_ENABLED=false
HEALTH_CHECK_IS_PORT=4545

GRPC_SERVER_ENABLED=true
GRPC_REFLECTION_ENABLED=true
GRPC_SERVICES=["ua.gov.diia.<%= h.changeCase.pascalCase(serviceName).toLowerCase() %>.<%= h.changeCase.pascalCase(serviceName) %>"]
GRPC_SERVER_PORT=5<%= Math.floor(Math.random() * (999 - 100) + 100) %>
