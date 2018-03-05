import { fetchLatestAlbums, fetchAlbumDetail } from './../albumSagas'
import api from './../albumApi'
import { call, put } from 'redux-saga/effects'
import * as actions from './../albumActions'
import * as appActions from './../../../app/appActions'
import * as mock from './../../../helper/mockGenerator'

describe('Test album sagas', () => {
    it('Should fetch album success', () => {
        const action = actions.fetchLatestAlbums()
        const gen = fetchLatestAlbums(action)

        expect(gen.next().value).toEqual(call(api.getRecentAlbums));

        const mockAlbumItems = [ mock.CreateAlbum() ]
        const mockResponse = { items: mockAlbumItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchLatestAlbumsSuccess(mockAlbumItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch album detail success', () => {
        const action = actions.fetchAlbumDetail(1)
        const gen = fetchAlbumDetail(action)

        expect(gen.next().value).toEqual(call(api.getAlbum, 1));

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