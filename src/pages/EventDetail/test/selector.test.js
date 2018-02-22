import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Event detail selector', () => {

    let mockEvent = {}
    let state = {}
    let eventDetailState = {}

    beforeEach(() => {

        mockEvent = mockGenerator.CreateEvent({ id: 1 })

        eventDetailState = Immutable.fromJS({
            event: 1
        })

        state = Immutable.fromJS(normalize(mockEvent, schemas['events']))
            .set('eventDetail', eventDetailState)
    });

    it('should get event detail', () => {
        expect(selectors.selectEventDetail()(state)).toEqual(eventDetailState)
    });

    it('should get event', () => {
        expect(selectors.selectEvent()(state)).toEqual(state.getIn(['entities', 'events', '1']).toJS())
    });

    it('should get empty event', () => {
        state = state.setIn(['eventDetail', 'event'], 0)
        expect(selectors.selectEvent()(state)).toEqual({})
    });

})
