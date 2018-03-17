import reducer from './../songReducer'
import * as actions from './../songActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test song reducer', () => {

    let song1 = {};
    let song2 = {};

    beforeEach(() => {
        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })
    })

    it('should return previous state when incorrect action called', () => {
        let nextState = reducer({ a: '1' }, undefined)

        expect(nextState).toBeTruthy()
        expect(nextState.a).toBeTruthy()
    })

    it('should return state correctly when fetch search songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]
        let currentState = {
            searchResult: [ 3, 4 ]
        }

        let nextState = reducer(currentState, actions.fetchSearchSongsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })

    it('should append params when fetch search song', () => {
        const expectedResult = { nameMatchMode: 'auto', artistId: [ 1 ] }
        let currentState = {
            searchParams: { nameMatchMode: 'auto' }
        }

        let nextState = reducer(currentState, actions.fetchSearchSongs({ artistId: [ 1 ] }))

        expect(nextState).toBeTruthy()
        expect(nextState.searchParams).toBeTruthy()
        expect(nextState.searchParams).toEqual(expectedResult)
    })

    it('should append search result', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ 3, 4, song1.id, song2.id ]
        let currentState = {
            searchResult: [ 3, 4 ]
        }

        let nextState = reducer(currentState, actions.fetchSearchSongsSuccess(mockResponse, true))

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })

    it('should return state correctly when fetch latest songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchLatestSongsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.all).toBeTruthy()
        expect(nextState.all).toEqual(expectedResult)
    })

    it('should return state correctly when fetch followed songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchFollowedSongsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.followed).toBeTruthy()
        expect(nextState.followed).toEqual(expectedResult)
    })
})
