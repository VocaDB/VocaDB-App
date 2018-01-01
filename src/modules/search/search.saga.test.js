import { put, call } from 'redux-saga/effects'
import { searchEntry } from './search.saga'
import Api from './../../api'
import * as actions from './search.action'

describe('Search Saga',() => {
    const gen = searchEntry(actions.entryRequest('Melt'))
    const mockResponse = { items: [ { id: 1, defaultName: 'A' } ] }
    const mockItem = [ { id: 1, defaultName: 'A' } ]

    it('must call api', () => {
        expect(gen.next().value).toEqual(call(Api.entries.find, { 'query': 'Melt', 'fields': 'MainPicture' }))
    })

    it('must dispatch an success action', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.entrySuccess(mockItem)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})