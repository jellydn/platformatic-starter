// eslint-disable-next-line @typescript-eslint/triple-slash-reference
/// <reference path="./global.d.ts" />
import Ajv from "ajv";
import type { FastifyInstance } from "fastify";

import { counterService } from "./services/counterService";

export default async function (app: FastifyInstance) {
  app.log.info("plugin loaded");

  // Setup validator
  const ajv = new Ajv({
    removeAdditional: "all",
    useDefaults: true,
    coerceTypes: "array",
  });
  app.setValidatorCompiler(({ schema }) => ajv.compile(schema));

  // Simpler counter service
  counterService(app);

  // Health check
  app.get("/health/check", () => ({ ok: true }));
}
