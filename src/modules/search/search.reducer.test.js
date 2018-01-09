import * as actions from './search.action'
import reducer from './search.reducer'

describe('Search reducers', () => {

    let state = {
        query: '',
        loading: false,
        entries: [],
        recentList: []
    }

    let givenEntry1 = { id: 1, name: 'Miku' }
    let givenEntry2 = { id: 2, name: 'Luka' }

    it('should save new entry', () => {
        let action = actions.saveRecent(givenEntry1)
        let expectedState = {
            query: '',
            loading: false,
            entries: [],
            recentList: [givenEntry1]
        }
        expect(reducer(state, action)).toEqual(expectedState)
    })

    it('should prepend new entry', () => {
        let action = actions.saveRecent(givenEntry2)
        let expectedState = {
            query: '',
            loading: false,
            entries: [],
            recentList: [givenEntry2, givenEntry1]
        }

        expect(reducer(state, action)).toEqual(expectedState)
    })

    it('should delete recent from given entry id', () => {
        let action = actions.deleteRecent(1)
        let expectedState = {
            query: '',
            loading: false,
            entries: [],
            recentList: [givenEntry2]
        }

        expect(reducer(state, action)).toEqual(expectedState)
    })

    it('should clear all recent items', () => {
        let action = actions.clearRecent()
        let expectedState = {
            query: '',
            loading: false,
            entries: [],
            recentList: []
        }

        expect(reducer(state, action)).toEqual(expectedState)
    })
})
