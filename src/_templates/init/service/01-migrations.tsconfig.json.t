---
to:  <%= serviceName %>/migrations/tsconfig.json
---
{
    "extends": "../tsconfig.json",
    "compilerOptions": {
        "sourceMap": true,
        "paths": {
            "#*": ["../src/*"]
        },
        "rootDir": "../"
    },
    "include": ["./**/*"]
}
