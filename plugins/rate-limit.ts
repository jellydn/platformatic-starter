import rateLimit from "@fastify/rate-limit";
import type { FastifyInstance, FastifyPluginOptions } from "fastify";

export default async function (
  app: FastifyInstance,
  opts: FastifyPluginOptions,
) {
  app.log.info("rate limit plugin loaded");
  app.log.info(`plugin options: ${JSON.stringify(opts)}`);

  await app.register(rateLimit, opts);
}
