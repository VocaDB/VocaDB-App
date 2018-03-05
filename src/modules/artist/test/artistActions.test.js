import { fetchArtistDetail } from "../artistActions";

describe('Test artist action', () => {
    it('should create fetch artist detail action success', () => {
        const actualResult = fetchArtistDetail();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})