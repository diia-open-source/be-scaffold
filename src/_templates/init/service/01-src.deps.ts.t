---
to:  <%= serviceName %>/src/deps.ts
---

import { DepsFactoryFn } from "@diia-inhouse/diia-app";

import { AppConfig } from '@interfaces/config'
import { AppDeps } from "@interfaces/deps";

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export default async (_config: AppConfig): ReturnType<DepsFactoryFn<AppConfig, AppDeps>> => {
  return {};
};
