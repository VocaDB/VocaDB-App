import * as actions from "../tagActions";
import * as mockGenerator from '../../../common/helper/mockGenerator';

describe('Test tag action', () => {
    it('should create fetch tag detail action', () => {
        const actualResult = actions.fetchTagDetail(1);
        const expectedPayload = { loading: true, id: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch tag detail success action', () => {
        const mockTag1 = mockGenerator.CreateTag({ id: 1 })
        const actualResult = actions.fetchTagDetailSuccess(mockTag1);
        const expectedPayload = {
            entities: {
                tags: {
                    '1': mockTag1
                }
            },
            result: 1
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top songs by tag action', () => {
        const actualResult = actions.fetchTopSongsByTag(1);
        const expectedPayload = { loading: true, tagId: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top songs by tag success action', () => {
        const mockSong1 = mockGenerator.CreateSong({ id: 1 })
        const mockSong2 = mockGenerator.CreateSong({ id: 2 })
        const mockResponse = [ mockSong1, mockSong2]
        const actualResult = actions.fetchTopSongsByTagSuccess(mockResponse);
        const expectedPayload = {
            entities: {
                songs: {
                    '1': mockSong1,
                    '2': mockSong2
                }
            },
            result: [ 1, 2 ]
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top artists by tag action', () => {
        const actualResult = actions.fetchTopArtistsByTag(1);
        const expectedPayload = { loading: true, tagId: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top artists by tag success action', () => {
        const mockArtist1 = mockGenerator.CreateArtist({ id: 1 })
        const mockArtist2 = mockGenerator.CreateArtist({ id: 2 })
        const mockResponse = [ mockArtist1, mockArtist2]
        const actualResult = actions.fetchTopArtistsByTagSuccess(mockResponse);
        const expectedPayload = {
            entities: {
                artists: {
                    '1': mockArtist1,
                    '2': mockArtist2
                }
            },
            result: [ 1, 2 ]
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top albums by tag action', () => {
        const actualResult = actions.fetchTopAlbumsByTag(1);
        const expectedPayload = { loading: true, tagId: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch top albums by tag success action', () => {
        const mockAlbum1 = mockGenerator.CreateAlbum({ id: 1 })
        const mockAlbum2 = mockGenerator.CreateAlbum({ id: 2 })
        const mockResponse = [ mockAlbum1, mockAlbum2]
        const actualResult = actions.fetchTopAlbumsByTagSuccess(mockResponse);
        const expectedPayload = {
            entities: {
                albums: {
                    '1': mockAlbum1,
                    '2': mockAlbum2
                }
            },
            result: [ 1, 2 ]
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})