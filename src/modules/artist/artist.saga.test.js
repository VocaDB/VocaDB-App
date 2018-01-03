import { put, call } from 'redux-saga/effects'
import { getArtist } from './artist.saga'
import Api from './../../api'
import * as actions from './artist.action'

describe('Artist Saga',() => {
    const gen = getArtist(actions.getArtist(1))
    const mockResponse = { id: 1, name: 'A' }

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.artists.get, 1, { 'fields': 'Description,Tags,WebLinks', 'relations': 'all' }))
    })

    it('must dispatch an success action', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.getArtistSuccess(mockResponse)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})