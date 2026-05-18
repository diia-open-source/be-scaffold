---
to:  <%= serviceName %>/migrations/tsconfig.json
---
{
    "extends": "../tsconfig.json",
    "compilerOptions": {
        "sourceMap": true,
        "paths": {
            "@services/*": ["../src/services/*"],
            "@interfaces/*": ["../src/interfaces/*"],
            "@src/*": ["../src/*"]
        },
        "rootDir": "../"
    },
    "include": ["./**/*"]
}
