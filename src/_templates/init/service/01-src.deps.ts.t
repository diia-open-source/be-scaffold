---
to:  <%= serviceName %>/src/deps.ts
---

import { DepsFactoryFn } from "@diia-inhouse/diia-app";

import { AppDeps } from "@interfaces/deps";
import { AppConfig } from "@interfaces/config";

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export default async (_config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps>> => {
  return {};
};
