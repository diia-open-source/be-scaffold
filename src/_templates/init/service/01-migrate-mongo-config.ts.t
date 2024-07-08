---
to:  <%= serviceName %>/migrate-mongo-config.ts
---
require('dotenv-flow').config({ silent: true })

import { MongoHelper } from '@diia-inhouse/db'

module.exports = MongoHelper.getMigrateMongoConfig()
