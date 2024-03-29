---
to:  <%= serviceName %>/migrations/tsconfig.json
---
{
    "extends": "../tsconfig.json",
    "ts-node": {
        "files": true
    },
    "compilerOptions": {
        "sourceMap": true,
        "baseUrl": "../",
        "paths": {
            "@services/*": ["dist/types/services/*"],
            "@interfaces/*": ["dist/types/interfaces/*"],
            "@src/*": ["dist/types/"],
        }
    },
    "include": [
        "./**/*"
    ]
}