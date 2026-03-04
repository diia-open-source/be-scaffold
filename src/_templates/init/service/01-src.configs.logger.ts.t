---
to:  <%= serviceName %>/src/configs/logger.ts
---

import { defaultOptions } from '@diia-inhouse/diia-logger'
import { EnvService } from '@diia-inhouse/env'
import { LogLevel, LoggerOptions } from '@diia-inhouse/types'

export const loggerConfig: LoggerOptions = {
    logLevel: EnvService.getVar('LOG_LEVEL', 'string', defaultOptions.logLevel) as LogLevel,
}
