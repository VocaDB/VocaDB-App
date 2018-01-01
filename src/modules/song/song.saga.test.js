import { put, call } from 'redux-saga/effects'
import { getSong } from './song.saga'
import Api from './../../api'
import * as actions from './song.action'

describe('Song Saga',() => {
    const gen = getSong(actions.getSong(1))
    const mockResponse = { id: 1, name: 'A' }

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.songs.get, 1, { 'fields': 'PVs,Artists,Albums,Tags,ThumbUrl,Lyrics,WebLinks' }))
    })

    it('must dispatch an success action', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.getSongSuccess(mockResponse)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})