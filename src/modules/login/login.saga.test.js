import { put, call } from 'redux-saga/effects'
import Api from './login.api'
import * as actions from './login.action'
import * as storage from './../storage/storage.action'
import * as key from './../../constants/storageKey'
import { login, loginSuccess } from './login.saga'

describe('Login Saga',() => {
    const gen = login()
    const mockResponse = {
        id: 1602,
        session: ''
    }

    it('must call login API', () => {
        expect(gen.next().value).toEqual(call(Api.auth.login))
    })

    it('must dispatch login success', () => {
        expect(gen.next(mockResponse).value).toEqual(put(actions.loginSuccess(mockResponse)))
    })

    it('must finish', () => {
        expect(gen.next().done).toBeTruthy()
    })
})

describe('Login Success', () => {
    const mockProfile = {
        id: 1602,
        session: '1234'
    }
    const gen = loginSuccess(actions.loginSuccess(mockProfile))

    it('must save profile to storage', () => {
        expect(gen.next().value).toEqual(put(storage.save(key.PROFILE, mockProfile)))
    })
})