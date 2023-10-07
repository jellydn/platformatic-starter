import type { PlatformaticApp, PlatformaticDBMixin, PlatformaticDBConfig, Entity, Entities, EntityHooks } from '@platformatic/db'
import { EntityTypes, Movie,Quote } from './types'

declare module 'fastify' {
  interface FastifyInstance {
    getSchema<T extends 'Movie' | 'Quote'>(schemaId: T): {
      '$id': string,
      title: string,
      description: string,
      type: string,
      properties: {
        [x in keyof EntityTypes[T]]: { type: string, nullable?: boolean }
      },
      required: string[]
    };
  }
}

interface AppEntities extends Entities {
  movie: Entity<Movie>,
    quote: Entity<Quote>,
}

interface AppEntityHooks {
  addEntityHooks(entityName: 'movie', hooks: EntityHooks<Movie>): any
    addEntityHooks(entityName: 'quote', hooks: EntityHooks<Quote>): any
}

declare module 'fastify' {
  interface FastifyInstance {
    platformatic: PlatformaticApp<PlatformaticDBConfig> &
      PlatformaticDBMixin<AppEntities> &
      AppEntityHooks
  }
}
