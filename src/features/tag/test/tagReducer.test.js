import reducer from './../tagReducer'
import * as actions from './../tagActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test tag reducer', () => {

    let tag1 = {};

    beforeEach(() => {
        tag1 = mockGenerator.CreateTag({ id: 1 })
    })

    it('should return state correctly when fetch tag detail success', () => {
        const mockResponse = tag1
        const expectedResult = tag1.id

        let nextState = reducer({}, actions.fetchTagDetailSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.detail).toBeTruthy()
        expect(nextState.detail).toEqual(expectedResult)
    })

    it('should return state correctly when fetch top songs by tag success', () => {
        const song1 = mockGenerator.CreateSong({ id: 1 })
        const song2 = mockGenerator.CreateSong({ id: 2 })
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchTopSongsByTagSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.topSongs).toBeTruthy()
        expect(nextState.topSongs).toEqual(expectedResult)
    })

    it('should return state correctly when fetch top artists by tag success', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        const mockResponse = [ artist1, artist2 ]
        const expectedResult = [ artist1.id, artist2.id ]

        let nextState = reducer({}, actions.fetchTopArtistsByTagSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.topArtists).toBeTruthy()
        expect(nextState.topArtists).toEqual(expectedResult)
    })

    it('should return state correctly when fetch top albums by tag success', () => {
        const album1 = mockGenerator.CreateAlbum({ id: 1 })
        const album2 = mockGenerator.CreateAlbum({ id: 2 })
        const mockResponse = [ album1, album2 ]
        const expectedResult = [ album1.id, album2.id ]

        let nextState = reducer({}, actions.fetchTopAlbumsByTagSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.topAlbums).toBeTruthy()
        expect(nextState.topAlbums).toEqual(expectedResult)
    })


    it('should return add latest songs by tag id', () => {
        const song1 = mockGenerator.CreateSong({ id: 1 })
        const song2 = mockGenerator.CreateSong({ id: 2 })

        const mockResponse = [ song1, song2 ];
        const tagId = 345;
        const expectedResult = {
            '345': [ song1.id, song2.id ]
        }
        let nextState = reducer({}, actions.addLatestSongsByTagId(tagId, mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.latestSongsByTagId).toBeTruthy()
        expect(nextState.latestSongsByTagId).toEqual(expectedResult)
    })

    it('should add tags result', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })
        const mockResponse = [ tag1, tag2 ]

        let nextState = reducer({}, actions.addTagsSearchResult(mockResponse))

        const expectedResult = [ tag1.id, tag2.id ]

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })

    it('should append tags result', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })
        const mockResponse = [ tag1, tag2 ]

        let nextState = { searchResult: [ 3, 4 ]}
        nextState = reducer(nextState, actions.appendTagsSearchResult(mockResponse))

        const expectedResult = [ 3, 4, tag1.id, tag2.id ]

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })
})