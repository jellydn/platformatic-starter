/**
 * Quote
 * A Quote
 */
declare interface Quote {
    id?: number;
    character: string;
    createdAt?: string | null;
    movieId: number;
    quote: string;
    updatedAt?: string | null;
}
export { Quote };
