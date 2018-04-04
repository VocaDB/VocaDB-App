import { fetchArtistDetail, fetchSearchArtists } from './../artistSagas'
import { selectSearchParams } from './../artistSelector'
import api from './../artistApi'
import { call, put, select } from 'redux-saga/effects'
import * as actions from './../artistActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'

describe('Test artist sagas', () => {
    it('Should fetch search artists', () => {
        const params = { tagId: [ 1, 2 ] }
        const action = actions.fetchSearchArtists(params)
        const gen = fetchSearchArtists(action)

        expect(JSON.stringify(gen.next().value)).toEqual(JSON.stringify(select(selectSearchParams())));

        expect(gen.next(params).value).toEqual(call(api.find, params));

        const mockItems = [ mock.CreateArtist() ]
        const mockResponse = { items: mockItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchSearchArtistsSuccess(mockItems, false)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch artist detail success', () => {
        const action = actions.fetchArtistDetail(1)
        const gen = fetchArtistDetail(action)

        expect(gen.next().value).toEqual(call(api.getArtist, 1));

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