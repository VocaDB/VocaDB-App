import { fetchLatestReleaseEvents, fetchReleaseEventDetail } from './../releaseEventSagas'
import api from './../releaseEventApi'
import { call, put } from 'redux-saga/effects'
import * as actions from './../releaseEventActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'

describe('Test releaseEvent sagas', () => {
    it('Should fetch releaseEvent success', () => {
        const action = actions.fetchLatestReleaseEvents()
        const gen = fetchLatestReleaseEvents(action)

        expect(gen.next().value).toEqual(call(api.getRecentReleaseEvents));

        const mockReleaseEventItems = [ mock.CreateEvent() ]
        const mockResponse = { items: mockReleaseEventItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchLatestReleaseEventsSuccess(mockReleaseEventItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch releaseEvent detail success', () => {
        const action = actions.fetchReleaseEventDetail(1)
        const gen = fetchReleaseEventDetail(action)

        expect(gen.next().value).toEqual(call(api.getReleaseEvent, 1));

        const mockReleaseEventItem = mock.CreateEvent()
        expect(gen.next(mockReleaseEventItem).value).toEqual(put(actions.fetchReleaseEventDetailSuccess(mockReleaseEventItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should return error when no id', () => {
        const action = actions.fetchReleaseEventDetail()
        const gen = fetchReleaseEventDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })
})