import { fetchHighlighted, fetchLatestSongs, fetchFollowedSongs, fetchSongDetail, fetchSearchSongs } from "../songActions";

describe('Test song action', () => {

    it('should create fetch highlighted song action', () => {
        const actualResult = fetchHighlighted();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch search song action', () => {
        const params = { artistId: [ 1, 2 ] }
        const actualResult = fetchSearchSongs(params);
        const expectedPayload = { loading: true, params }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch latest song action', () => {
        const actualResult = fetchLatestSongs();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch followed song action', () => {
        const actualResult = fetchFollowedSongs();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch song detail action', () => {
        const actualResult = fetchSongDetail(1);
        const expectedPayload = { loading: true, id: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})