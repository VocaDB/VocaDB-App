import reducer from './../artistReducer'
import * as actions from './../artistActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test artist reducer', () => {

    let artist1 = {};
    let artist2 = {};

    beforeEach(() => {
        artist1 = mockGenerator.CreateArtist({ id: 1 })
        artist2 = mockGenerator.CreateArtist({ id: 2 })
    })

    it('should return state correctly when fetch search artists success', () => {
        const mockResponse = [ artist1, artist2 ]
        const expectedResult = [ artist1.id, artist2.id ]
        let currentState = {
            searchResult: [ 3, 4 ]
        }

        let nextState = reducer(currentState, actions.fetchSearchArtistsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })

    it('should append search result', () => {
        const mockResponse = [ artist1, artist2 ]
        const expectedResult = [ 3, 4, artist1.id, artist2.id ]
        let currentState = {
            searchResult: [ 3, 4 ]
        }

        let nextState = reducer(currentState, actions.fetchSearchArtistsSuccess(mockResponse, true))

        expect(nextState).toBeTruthy()
        expect(nextState.searchResult).toBeTruthy()
        expect(nextState.searchResult).toEqual(expectedResult)
    })

    it('should return state correctly when fetch artist detail success', () => {
        const mockResponse = artist1
        const expectedResult = artist1.id

        let nextState = reducer({}, actions.fetchArtistDetailSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.detail).toBeTruthy()
        expect(nextState.detail).toEqual(expectedResult)
    })
})