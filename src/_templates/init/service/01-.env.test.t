---
to:  <%= serviceName %>/.env.test
---
LOG_LEVEL=error

TRANSPORT_TYPE=nats
TRANSPORT_OPTIONS='{"host":"localhost","port":"4222"}'

BALANCING_STRATEGY_NAME=RoundRobin
BALANCING_STRATEGY_OPTIONS=

<%if (h.isOptionSelected(selectedOptions, 'external')) {%>
REDIS_SENTINEL_NAME=mymaster
REDIS_SENTINEL_HOSTS='[{ "host": "localhost", "port": 26379 }]'
REDIS_SLAVE_ROLE=slave
<%}%>
<%if (h.isOptionSelected(selectedOptions, 'redis')) {%>
STORE_SENTINEL_NAME=mymaster
STORE_SENTINEL_HOSTS='[{ "host": "localhost", "port": 26379 }]'
STORE_SLAVE_ROLE=slave
<%}%>
<%if (h.isOptionSelected(selectedOptions, 'database')) {%>
MONGO_DATABASE=diia-<%= serviceName %>-service-test
<%}%>
<%if (h.isOptionSelected(selectedOptions, 'internal')) {%>
RABBIT_HOST=127.0.0.1
RABBIT_PORT=5672
RABBIT_USERNAME=guest
RABBIT_PASSWORD=guest
RABBIT_HEARTBEAT=60
RABBIT_QUEUE_PREFETCH_COUNT=1
<%}%>
<%if (h.isOptionSelected(selectedOptions, 'external')) {%>
EXTERNAL_RABBIT_HOST=127.0.0.1
EXTERNAL_RABBIT_PORT=5672
EXTERNAL_RABBIT_USERNAME=guest
EXTERNAL_RABBIT_PASSWORD=guest
EXTERNAL_RABBIT_HEARTBEAT=60
EXTERNAL_RABBIT_QUEUE_PREFETCH_COUNT=1
EXTERNAL_RABBIT_ASSERT_EXCHANGES=true
<%}%>

GRPC_SERVER_ENABLED=false
