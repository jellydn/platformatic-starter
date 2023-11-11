import fp from "fastify-plugin";
import { type FastifyInstance } from "fastify";

/**
 * Display all routes in the console. This is useful for debugging.
 */
export default fp(async (fastify: FastifyInstance) => {
  fastify.addHook("onReady", () => {
    fastify.log.info(
      "All routes loaded! Check your console for the route details.",
    );
    console.log(fastify.printRoutes());
  });
});
