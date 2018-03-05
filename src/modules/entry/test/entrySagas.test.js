import { searchEntries } from './../entrySagas'
import api from './../entryApi'
import { call, put } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './../entryActions'
import * as mock from './../../../helper/mockGenerator'

describe('Test entry sagas', () => {
    it('Should search entries success', () => {
        let query = 'abc'
        const action = actions.searchEntries(query)
        const gen = searchEntries(action)

        expect(gen.next().value).toEqual(call(delay, 500));

        expect(gen.next().value).toEqual(call(api.search, query));

        const entry1 = mock.CreateArtist('Song', { id: 1 })
        const entry2 = mock.CreateEntry('Artist', { id: 2 })
        const mockResponse = { items: [ entry1, entry2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.searchEntriesSuccess(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })
})