import reducer from './../songReducer'
import * as actions from './../songActions'
import * as mockGenerator from './../../../helper/mockGenerator'

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

    it('should return state correctly when fetch song detail success', () => {
        const song1 = mockGenerator.CreateSong({ id: 1 })
        const mockResponse = song1
        const expectedResult = song1.id

        let nextState = reducer({}, actions.fetchSongDetailSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.detail).toBeTruthy()
        expect(nextState.detail).toEqual(expectedResult)
    })
})