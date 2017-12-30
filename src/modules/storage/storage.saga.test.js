import { put, call } from 'redux-saga/effects'
import * as actions from './storage.action'
import { storageSave, storageGet } from './storage.saga'
import { AsyncStorage } from 'react-native'
import * as key from './../../constants/storageKey'

describe('Storage Save Success',() => {

    const mockProfile = {
        id: 1602,
        session: ''
    }

    const actionSave = actions.save(key.PROFILE, mockProfile)
    const gen = storageSave(actionSave)

    it('must save data to storage', () => {
        expect(gen.next().value).toEqual(call(AsyncStorage.setItem, key.PROFILE, mockProfile))
    })

    it('must dispatch save success', () => {
        expect(gen.next(mockProfile).value).toEqual(put(actions.saveSuccess(key.PROFILE, mockProfile)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('Storage save error when data is undefined',() => {
    const actionSave = actions.save()
    const gen = storageSave(actionSave)
    const mockError = actions.error(new Error('Undefined key'))

    it('must dispatch error', () => {
        expect(gen.next().value).toEqual(put(mockError))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('Storage Get Success',() => {
    const mockProfile = {
        id: 1602,
        session: ''
    }
    const actionGet = actions.get(key.PROFILE)
    const gen = storageGet(actionGet)

    it('must get profile from storage', () => {
        expect(gen.next().value).toEqual(call(AsyncStorage.getItem, key.PROFILE))
    })

    it('must dispatch get success', () => {
        expect(gen.next(mockProfile).value).toEqual(put(actions.getSuccess(mockProfile)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('Storage get error when key is undefined',() => {
    const actionSave = actions.save()
    const gen = storageSave(actionSave)
    const mockError = actions.error(new Error('Undefined key'))

    it('must dispatch error', () => {
        expect(gen.next().value).toEqual(put(mockError))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})