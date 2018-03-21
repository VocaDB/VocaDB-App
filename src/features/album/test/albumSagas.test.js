import { fetchSearchAlbums, fetchLatestAlbums, fetchTopAlbums, fetchAlbumDetail } from './../albumSagas'
import { selectSearchParams } from './../albumSelector'
import api from './../albumApi'
import { call, put, select } from 'redux-saga/effects'
import * as actions from './../albumActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'

describe('Test album sagas', () => {
    it('Should fetch search album success', () => {
        const params = { artistIds: [ 1, 2 ] }
        const action = actions.fetchSearchAlbums(params)
        const gen = fetchSearchAlbums(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectSearchParams())));

        expect(gen.next(params).value).toEqual(call(api.find, params));

        const mockItems = [ mock.CreateAlbum() ]
        const mockResponse = { items: mockItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchSearchAlbumsSuccess(mockItems, false)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch album success', () => {
        const action = actions.fetchLatestAlbums()
        const gen = fetchLatestAlbums(action)

        expect(gen.next().value).toEqual(call(api.getRecentAlbums));

        const mockAlbumItems = [ mock.CreateAlbum() ]
        expect(gen.next(mockAlbumItems).value).toEqual(put(actions.fetchLatestAlbumsSuccess(mockAlbumItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch top album success', () => {
        const action = actions.fetchTopAlbums()
        const gen = fetchTopAlbums(action)

        expect(gen.next().value).toEqual(call(api.getTopAlbums));

        const mockAlbumItems = [ mock.CreateAlbum() ]
        expect(gen.next(mockAlbumItems).value).toEqual(put(actions.fetchTopAlbumsSuccess(mockAlbumItems)));

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