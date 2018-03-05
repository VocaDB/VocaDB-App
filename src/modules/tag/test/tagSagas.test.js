import { fetchTagDetail } from './../tagSagas'
import api from './../tagApi'
import { call, put } from 'redux-saga/effects'
import * as actions from './../tagActions'
import * as appActions from './../../../app/appActions'
import * as mock from './../../../helper/mockGenerator'

describe('Test tag sagas', () => {
    it('Should fetch tag detail success', () => {
        const action = actions.fetchTagDetail(1)
        const gen = fetchTagDetail(action)

        expect(gen.next().value).toEqual(call(api.getTag, 1));

        const mockTagItem = mock.CreateTag()
        expect(gen.next(mockTagItem).value).toEqual(put(actions.fetchTagDetailSuccess(mockTagItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should return error when no id', () => {
        const action = actions.fetchTagDetail()
        const gen = fetchTagDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })
})