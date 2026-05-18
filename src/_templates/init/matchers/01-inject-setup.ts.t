---
inject: true
to: <%= overrideSetupFilePath %>
---
import * as matchers from './matchers/index.js'

expect.extend(matchers)
