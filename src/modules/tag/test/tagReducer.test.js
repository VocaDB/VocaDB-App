import reducer from './../tagReducer'
import * as actions from './../tagActions'
import * as mockGenerator from './../../../helper/mockGenerator'

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
})