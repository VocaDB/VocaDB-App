import { searchEntries } from './../entrySagas'
import api from './../entryApi'
import { call, put, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './../entryActions'
import * as mock from '../../../common/helper/mockGenerator'
import { selectDisplayLanguage } from './../../user/userSelector'

describe('Test entry sagas', () => {
    it('Should search entries success', () => {
        let query = 'abc'
        const action = actions.searchEntries(query)
        const gen = searchEntries(action)

        expect(gen.next().value).toEqual(call(delay, 500));

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));

        expect(gen.next('Default').value).toEqual(call(api.search, query, { lang: 'Default' }));

        const entry1 = mock.CreateArtist('Song', { id: 1 })
        const entry2 = mock.CreateEntry('Artist', { id: 2 })
        const mockResponse = { items: [ entry1, entry2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.searchEntriesSuccess(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })
})