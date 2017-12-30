import { put, call } from 'redux-saga/effects'
import { fetchSongList } from './home.saga'
import Api from './home.api'
import * as actions from './home.action'

describe('fetchSongList Saga',() => {
    const gen = fetchSongList()
    const mockResponse = { items: [ { id: 1, name: 'A' } ] }

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.songs.list))
    })

    it('must dispatch an success action', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.listRecentSongSuccess(mockResponse.items)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('fetchSongList Saga error',() => {
    const gen = fetchSongList()
    const error = new Error('test error')

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.songs.list))
    })

    it('must dispatch an error action', () => {
        expect(gen.throw(error).value).toEqual(put(actions.listRecentSongError(error)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})
