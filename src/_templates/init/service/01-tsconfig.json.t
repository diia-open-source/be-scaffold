---
to:  <%= serviceName %>/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "plugins": [
            {
                "transform": "@diia-inhouse/diia-app/dist/plugins/openapi"
            }
        ],
        "outDir": "dist",
        "declaration": true,
        "declarationDir": "dist/types",
        "resolveJsonModule": true,
        "strict": true,
        "skipLibCheck": true,
        "lib": ["es2023", "DOM"],
        "paths": {
            "@services/*": ["./src/services/*"],
            "@interfaces/*": ["./src/interfaces/*"],
            <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
            "@models/*": ["./src/models/*"],
            <%}%>
            "@dataMappers/*": ["./src/dataMappers/*"],
            "@actions/*": ["./src/actions/*"],
            "@src/*": ["./src/*"],
            "@tests/*": ["./tests/*"]
        },
        "rootDir": "./src"
    },
    "include": ["src/**/*"]
}
