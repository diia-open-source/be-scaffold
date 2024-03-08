---
to: <%= jestTypesDeclarationPath %>
force: true
---

/// <reference types="@diia-inhouse/configs/jest/types" />

declare namespace jest {
    interface Matchers<R> {
        <%= tsConfigPath %>(): any
    }

    interface Expect {
        <%= tsConfigPath %>(): any
    }
}
