import path from 'node:path'

import chalk from 'chalk'
import { Prompt } from 'src/interfaces'

import { Answers } from '../../../interfaces/_templates/init/admin'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const finalActionPath = path.resolve(process.cwd(), 'src/actions/v1/admin')
        const finalInterfacePath = path.resolve(process.cwd(), 'src/interfaces/actions/v1/admin')
        const adminServicePath = path.resolve(process.cwd(), 'src/services/admin')

        console.log(chalk.red.bold('README!\n'))
        console.log(
            chalk.green(`
            Do not forget to add proto definitions

            --- proto definitions ----

            // Admin
            rpc AdminExecuteQuery(AdminExecuteQueryReq) returns (AdminExecuteQueryRes);
            rpc AdminExecuteCustom(AdminExecuteCustomReq) returns (AdminExecuteCustomRes);
            rpc AdminGetMeta(google.protobuf.Empty) returns (AdminGetMetaRes) {}


            // Admin
            message AdminExecuteQueryReq {
                string params = 1;
            }

            message AdminExecuteQueryRes {
                string data = 1;
                int32 total = 2;
            }

            message AdminExecuteCustomReq {
                string event = 1;
                string params = 2;
            }

            message AdminExecuteCustomRes {
                string result = 1;
            }

            message AdminGetMetaRes {
                string result = 1;
            }

            ---- deps.ts ----
            {
                adminExposer: asClass(AdminExposer, {
                    injector: () => {
                    return {
                        adapters: [
                            new MongoModelAdapter("yourModel", yourModel),
                        ], // can be empty array []
                        actions: AdminActions, // can be empty array []
                    };
                    },
                });
            }

        `),
        )

        await prompter.prompt({
            type: 'confirm',
            name: 'confirm',
            message: 'Please read the README and press enter to continue',
            required: true,
        })

        return {
            actionPath: finalActionPath,
            interfacePath: finalInterfacePath,
            adminServicePath,
        }
    },
}
