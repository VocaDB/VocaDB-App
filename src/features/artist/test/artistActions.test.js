import { fetchArtistDetail, fetchSearchArtists } from "../artistActions";

describe('Test artist action', () => {
    it('should create fetch search artist action', () => {
        const params = { query: 'abc' }
        const actualResult = fetchSearchArtists(params);
        const expectedPayload = { loading: true, params }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch artist detail action success', () => {
        const actualResult = fetchArtistDetail();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})