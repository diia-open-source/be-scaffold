---
to:  <%= serviceName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "baseUrl": "../",
        "types": ["vite/client", "vitest/globals", "./vitest.d.ts"],
        "module": "ESNext",
        "moduleResolution": "Bundler",
        "isolatedModules": true,
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
            "@models/*": ["src/models/*"],
            <%}%>
            "@dataMappers/*": ["src/dataMappers/*"],
            "@actions/*": ["src/actions/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        },
        "noEmit": true
    },
    "include": ["./**/*", "../vitest.config.mts"]
}
