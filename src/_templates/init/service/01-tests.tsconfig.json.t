---
to:  <%= serviceName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "types": ["vite/client", "vitest/globals", "./vitest.d.ts"],
        "module": "ESNext",
        "moduleResolution": "Bundler",
        "isolatedModules": true,
        "paths": {
            "#*": ["../src/*"],
            "#tests/*": ["../tests/*"]
        },
        "noEmit": true,
        "strict": true,
        "rootDir": "../"
    },
    "include": ["./**/*", "../vitest.config.mts"]
}
