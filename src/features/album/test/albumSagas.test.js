import { fetchSearchAlbums, fetchLatestAlbums, fetchTopAlbums, fetchAlbumDetail } from './../albumSagas'
import { selectSearchParams } from './../albumSelector'
import { selectDisplayLanguage } from './../../user/userSelector'
import api from './../albumApi'
import { call, put, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './../albumActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'

describe('Test album sagas', () => {
    it('Should fetch search album success', () => {
        const params = { artistIds: [ 1, 2 ], lang: 'default' }
        const action = actions.fetchSearchAlbums(params)
        const gen = fetchSearchAlbums(action)


        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectSearchParams())));
        expect(JSON.stringify(gen.next(params).value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));
        expect(gen.next('default').value).toEqual(call(delay, 500));

        expect(gen.next().value).toEqual(call(api.find, params));

        const mockItems = [ mock.CreateAlbum() ]
        const mockResponse = { items: mockItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.setSearchResult(mockItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch album success', () => {
        const action = actions.fetchLatestAlbums()
        const gen = fetchLatestAlbums(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));
        expect(gen.next('default').value).toEqual(call(api.getRecentAlbums, { languagePreference: 'default' }));

        const mockAlbumItems = [ mock.CreateAlbum() ]
        expect(gen.next(mockAlbumItems).value).toEqual(put(actions.fetchLatestAlbumsSuccess(mockAlbumItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch top album success', () => {
        const action = actions.fetchTopAlbums()
        const gen = fetchTopAlbums(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));
        expect(gen.next('default').value).toEqual(call(api.getTopAlbums, { languagePreference: 'default' }));

        const mockAlbumItems = [ mock.CreateAlbum() ]
        expect(gen.next(mockAlbumItems).value).toEqual(put(actions.fetchTopAlbumsSuccess(mockAlbumItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch album detail success', () => {
        const action = actions.fetchAlbumDetail(1)
        const gen = fetchAlbumDetail(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectDisplayLanguage())));
        expect(gen.next('default').value).toEqual(call(api.getAlbum, 1, { lang: 'default' }));

        const mockAlbumItem = mock.CreateAlbum()
        expect(gen.next(mockAlbumItem).value).toEqual(put(actions.fetchAlbumDetailSuccess(mockAlbumItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should return error when no id', () => {
        const action = actions.fetchAlbumDetail()
        const gen = fetchAlbumDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })
})