import reducer from './../albumReducer'
import * as actions from './../albumActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test album reducer', () => {

    let album1 = {};
    let album2 = {};

    beforeEach(() => {
        album1 = mockGenerator.CreateAlbum({ id: 1 })
        album2 = mockGenerator.CreateAlbum({ id: 2 })
    })

    it('should return previous state when incorrect action called', () => {
        let nextState = reducer({ a: '1' }, undefined)

        expect(nextState).toBeTruthy()
        expect(nextState.a).toBeTruthy()
    })

    it('should return state correctly when fetch latest albums success', () => {
        const mockResponse = [ album1, album2 ]
        const expectedResult = [ album1.id, album2.id ]

        let nextState = reducer({}, actions.fetchLatestAlbumsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.all).toBeTruthy()
        expect(nextState.all).toEqual(expectedResult)
    })

    it('should return state correctly when fetch album detail success', () => {
        const album1 = mockGenerator.CreateAlbum({ id: 1 })
        const mockResponse = album1
        const expectedResult = album1.id

        let nextState = reducer({}, actions.fetchAlbumDetailSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.detail).toBeTruthy()
        expect(nextState.detail).toEqual(expectedResult)
    })
})