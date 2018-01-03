import { put, call } from 'redux-saga/effects'
import {readRecent, saveRecent, searchEntry} from './search.saga'
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

describe('Save new recent',() => {
    const newEntry = { id: 124, entryType: 'Song', name: 'ABC' }
    const newRecentList = [newEntry]

    const gen = saveRecent(actions.saveRecent(newEntry))

    it('must get recent list from storage', () => {
        expect(gen.next().value).toEqual(call(AsyncStorage.getItem, key.RECENT_SEARCH))
    })

    it('must save new recent list to storage', () => {
        expect(gen.next(newRecentList).value).toEqual(call(AsyncStorage.setItem, key.RECENT_SEARCH, JSON.stringify(newRecentList)))
    })

    it('must dispatch save success', () => {
        expect(gen.next(newRecentList).value).toEqual(put(actions.saveRecentSuccess(newRecentList)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('Read recent',() => {
    const gen = readRecent(actions.readRecent())
    const recentList = [{ id: 2, entryType: 'Artist', name: 'Miku' }]

    it('must get recent list from storage', () => {
        expect(gen.next().value).toEqual(call(AsyncStorage.getItem, key.RECENT_SEARCH))
    })

    it('must dispatch read success', () => {
        expect(gen.next(JSON.stringify(recentList)).value).toEqual(put(actions.readRecentSuccess(recentList)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})
