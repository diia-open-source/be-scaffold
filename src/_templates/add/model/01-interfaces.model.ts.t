---
to: <%= interfacePath %>
---
import { Document } from '@diia-inhouse/db'

export interface <%= h.changeCase.pascal(name) %> {}

export interface <%= h.changeCase.pascal(name) %>Model extends <%= h.changeCase.pascal(name) %>, Document {}
