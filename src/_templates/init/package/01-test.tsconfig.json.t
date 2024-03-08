---
to:  <%= packageName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "baseUrl": "../",
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        },
        "noEmit": true,
        "strict": true
    },
    "include": ["./**/*"]
}
