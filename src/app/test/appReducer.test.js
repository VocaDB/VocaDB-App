import reducer from '../appReducer'
import { createStore } from 'redux';
import * as mockGenerator from '../../common/helper/mockGenerator'

describe('Test app reducer', () => {

    let store = {};

    beforeEach(() => {
        store = createStore(reducer);
    })

    it('should return error', () => {

        let error = new Error("Some error");
        store.dispatch({ type: 'Some error', error })

        const currentState = store.getState()

        expect(currentState).toBeTruthy()
        expect(currentState.error).toBeTruthy()
        expect(currentState.error).toEqual(error)
    })

    it('should return error as false', () => {

        store.dispatch({ type: 'No error', payload: { id: 1 } })

        const currentState = store.getState()

        expect(currentState).toBeTruthy()
        expect(currentState.error).toEqual(false)
    })

    it('should return loading is true', () => {

        store.dispatch({ type: 'Fetching', payload: { loading: true, data: { id: 1 } } })

        const currentState = store.getState()

        expect(currentState).toBeTruthy()
        expect(currentState.loading).toEqual(true)
    })

    it('should return loading is false when no payload', () => {

        store.dispatch({ type: 'Fetching' })

        const currentState = store.getState()

        expect(currentState).toBeTruthy()
        expect(currentState.loading).toEqual(false)
    })

    it('should return loading false when error', () => {

        store.dispatch({ type: 'Fetching', payload: { loading: true, data: { id: 1 } } })

        let currentState = store.getState()
        expect(currentState).toBeTruthy()
        expect(currentState.loading).toEqual(true)

        let error = new Error("Some error");
        store.dispatch({ type: 'Some error', error })

        currentState = store.getState()

        expect(currentState).toBeTruthy()
        expect(currentState.loading).toEqual(false)
    })

    it('should add entities', () => {

        const action = {
            type: 'Something',
            payload: {
                entities: {
                    a: '1'
                }
            }
        }
        let nextState = reducer({}, action)

        expect(nextState).toBeTruthy()
        expect(nextState.entities).toBeTruthy()
        expect(nextState.entities).toEqual({ a: '1' })
    })

    it('should update entities', () => {
        const song1 = { id: 1, name: 'A' }
        const song2 = { id: 2, name: 'C' }
        const artist1 = { id: 1, name: 'AA' }
        const entities = {
            songs: {
                '1': song1
            }
        }
        const newEntities = {
            songs: {
                '2': song2
            },
            artists: {
                '1': artist1
            }
        }
        const action = {
            type: 'Something',
            payload: { entities: newEntities }
        }

        let nextState = reducer({ entities }, action)

        const expectedEntities = {
            songs: {
                '1': song1,
                '2': song2
            },
            artists: {
                '1': artist1
            }
        }
        expect(nextState).toBeTruthy()
        expect(nextState.entities).toBeTruthy()
        expect(nextState.entities).toEqual(expectedEntities)
    })
})