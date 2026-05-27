---
to:  <%= serviceName %>/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "outDir": "dist",
        "declaration": true,
        "declarationDir": "dist/types",
        "resolveJsonModule": true,
        "strict": true,
        "skipLibCheck": true,
        "lib": ["es2023", "DOM"],
        "paths": {
            "#*": ["./src/*"],
            "#tests/*": ["./tests/*"]
        },
        "rootDir": "./src"
    },
    "include": ["src/**/*"]
}
