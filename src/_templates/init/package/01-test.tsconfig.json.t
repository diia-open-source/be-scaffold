---
to:  <%= packageName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "types": ["vite/client", "vitest/globals"],
        "module": "ESNext",
        "moduleResolution": "Bundler",
        "isolatedModules": true,
        "paths": {
            "@src/*": ["../src/*"],
            "@tests/*": ["./*"]
        },
        "noEmit": true,
        "strict": true,
        "rootDir": "../"
    },
    "include": ["./**/*", "../vitest.config.mts"]
}
