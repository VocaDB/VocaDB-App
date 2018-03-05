import { fetchArtistDetail } from './../artistSagas'
import api from './../artistApi'
import { call, put } from 'redux-saga/effects'
import * as actions from './../artistActions'
import * as appActions from './../../../app/appActions'
import * as mock from './../../../helper/mockGenerator'

describe('Test artist sagas', () => {
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