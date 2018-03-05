import reducer from './../artistReducer'
import * as actions from './../artistActions'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Test artist reducer', () => {

    let artist1 = {};

    beforeEach(() => {
        artist1 = mockGenerator.CreateArtist({ id: 1 })
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