import { put, call } from 'redux-saga/effects'
import {readRecent, saveRecent, searchEntry, clearRecent, deleteRecent } from './search.saga'
import * as key from './../../constants/storageKey'
import * as actions from './search.action'
import API from './../../api'
import { AsyncStorage } from 'react-native'

describe('Search entry',() => {
    const gen = searchEntry(actions.entryRequest('Melt'))
    const mockResponse = { items: [ { id: 1, name: 'Melt', entryType: 'Song' } ] }

    it('must call API to query', () => {
        expect(gen.next().value).toEqual(call(API.entries.find, { 'query': 'Melt', 'fields': 'MainPicture' }))
    })

    it('must dispatch success', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.entrySuccess(mockResponse.items)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})