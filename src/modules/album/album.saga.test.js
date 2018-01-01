import { put, call } from 'redux-saga/effects'
import { getAlbum } from './album.saga'
import Api from './../../api'
import * as actions from './album.action'

describe('Album Saga',() => {
    const gen = getAlbum(actions.getAlbum(1))
    const mockResponse = { id: 1, name: 'A' }

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.albums.get, 1, { 'fields': 'Artists,Tags' }))
    })

    it('must dispatch an success action', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.getAlbumSuccess(mockResponse)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})