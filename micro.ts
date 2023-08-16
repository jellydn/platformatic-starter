import type { FastifyInstance, FastifyPluginOptions } from "fastify";

import { counterService } from "./services/counter.service";

export default async function (
  app: FastifyInstance,
  opts: FastifyPluginOptions,
) {
  app.log.info("plugin loaded");
  app.log.info(`plugin options: ${JSON.stringify(opts)}`);

  // Simpler counter service
  counterService(app);
}
