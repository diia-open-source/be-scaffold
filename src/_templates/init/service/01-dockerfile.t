---
to:  <%= serviceName %>/Dockerfile
---
### Stage 1
FROM gitlab.diia.org.ua:5050/diia-inhouse/ci/node-builder:18-alpine as node-first

WORKDIR /home/node/app

COPY package-lock.json package.json .npmrc ./
RUN npm install

COPY . .
RUN npm run build

### Stage 2
FROM node:18-alpine

RUN apk add --no-cache \
  protobuf-dev \
  tzdata \
  bash

RUN cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime

WORKDIR /home/node/app

COPY --from=node-first /home/node/app/node_modules ./node_modules
COPY --from=node-first /home/node/app/dist ./dist
COPY --from=node-first /home/node/app/package.json .
COPY --from=node-first /home/node/app/tsconfig.json .
<%if (h.isOptionSelected(selectedOptions, 'database')) {%>
COPY --from=node-first /home/node/app/migrate-mongo-config.ts ./migrate-mongo-config.ts
COPY --from=node-first /home/node/app/migrations ./migrations
<%}%>
COPY --from=node-first /home/node/app/.env .
COPY --from=node-first /home/node/app/proto ./proto

CMD npm run start
