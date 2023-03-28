/**
 * Quote
 * A Quote
 */
declare interface Quote {
    id?: number;
    movieId: number;
    character: string;
    quote: string;
    createdAt?: string | null;
    updatedAt?: string | null;
}
export { Quote };
