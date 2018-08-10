import { fetchArtistDetail, fetchSearchArtists } from './../artistSagas';
import { selectSearchParams } from './../artistSelector';
import { delay } from 'redux-saga';
import api from './../artistApi';
import { call, put, select } from 'redux-saga/effects';
import * as actions from './../artistActions';
import * as appActions from './../../../app/appActions';
import * as mock from '../../../common/helper/mockGenerator';
import { selectDisplayLanguage } from './../../user/userSelector';

describe('Test artist sagas', () => {
    it('Should fetch search artists', () => {
        const params = { tagId: [ 1, 2 ], lang: "Default" }
        const action = actions.fetchSearchArtists(params)
        const gen = fetchSearchArtists(action)
        const mockItems = [ mock.CreateArtist() ]
        const mockResponse = { items: mockItems }

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectSearchParams())));

        expect(JSON.stringify(gen.next(params).value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));

        expect(gen.next('Default').value).toEqual(call(delay, 500));

        expect(gen.next().value).toEqual(call(api.find, { ...params, lang: 'Default' }));

        expect(gen.next(mockResponse).value).toEqual(put(actions.setSearchResult(mockItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch artist detail success', () => {
        const action = actions.fetchArtistDetail(1)
        const gen = fetchArtistDetail(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));

        expect(gen.next('Default').value).toEqual(call(api.getArtist, 1, { lang: 'Default' }));

        const mockArtistItem = mock.CreateArtist()
        expect(gen.next(mockArtistItem).value).toEqual(put(actions.fetchArtistDetailSuccess(mockArtistItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should return error when no id', () => {
        const action = actions.fetchArtistDetail()
        const gen = fetchArtistDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })
})