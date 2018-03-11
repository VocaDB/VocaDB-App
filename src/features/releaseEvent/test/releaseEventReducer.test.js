import reducer from './../releaseEventReducer'
import * as actions from './../releaseEventActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test releaseEvent reducer', () => {

    let releaseEvent1 = {};
    let releaseEvent2 = {};

    beforeEach(() => {
        releaseEvent1 = mockGenerator.CreateEvent({ id: 1 })
        releaseEvent2 = mockGenerator.CreateEvent({ id: 2 })
    })

    it('should return previous state when incorrect action called', () => {
        let nextState = reducer({ a: '1' }, undefined)

        expect(nextState).toBeTruthy()
        expect(nextState.a).toBeTruthy()
    })

    it('should return state correctly when fetch latest releaseEvents success', () => {
        const mockResponse = [ releaseEvent1, releaseEvent2 ]
        const expectedResult = [ releaseEvent1.id, releaseEvent2.id ]

        let nextState = reducer({}, actions.fetchLatestReleaseEventsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.all).toBeTruthy()
        expect(nextState.all).toEqual(expectedResult)
    })

    it('should return state correctly when fetch releaseEvent detail success', () => {
        const releaseEvent1 = mockGenerator.CreateEvent({ id: 1 })
        const mockResponse = releaseEvent1
        const expectedResult = releaseEvent1.id

        let nextState = reducer({}, actions.fetchReleaseEventDetailSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.detail).toBeTruthy()
        expect(nextState.detail).toEqual(expectedResult)
    })
})