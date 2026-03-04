---
to:  <%= packageName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "baseUrl": "../",
        "types": ["vite/client", "vitest/globals"],
        "module": "ESNext",
        "moduleResolution": "Bundler",
        "isolatedModules": true,
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        },
        "noEmit": true,
        "strict": true
    },
    "include": ["./**/*", "../vitest.config.mts"]
}
