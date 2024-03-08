---
to:  <%= modelPath %>
---

import { Model, Schema, model, models } from 'mongoose'

import {
 <%= h.changeCase.pascal(name) %>
} from '@interfaces/models/<%= name %>'

export const <%= name %>Schema = new Schema<<%= h.changeCase.pascal(name) %>>(
    {},
    { timestamps: true },
)

export default <Model<<%= h.changeCase.pascal(name) %>>>models.<%= h.changeCase.pascal(name) %> || model('<%= h.changeCase.pascal(name) %>', <%= name %>Schema)
