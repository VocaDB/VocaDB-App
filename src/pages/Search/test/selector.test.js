import { fromJS, Map, List } from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import mockEntries from './mock'

describe('Search selector test', () => {

    let state = {}
    let searchState = Map()

    beforeEach(() => {
        searchState = searchState.set('entries', List().push(1032))
            .set('query', '')
            .set('recent', List())

        state = fromJS(normalize(mockEntries.items, [ schemas['entries'] ]))
            .set('search', searchState)
    });

    it('should get search state', () => {
        expect(selectors.selectSearch()(state)).toEqual(searchState)
    });

    it('should searching return true', () => {
        state = state.setIn(['search', 'query'], 'miku')

        expect(selectors.selectSearching()(state)).toEqual(true)
    });

    it('should searching return false', () => {
        state = state.setIn(['search', 'query'], '')

        expect(selectors.selectSearching()(state)).toEqual(false)
    });

    it('should return has result is true', () => {
        state = state.setIn(['search', 'query'], 'miku')
            .setIn(['search', 'entries'], List().push(1))

        expect(selectors.selectHasResult()(state)).toEqual(true)
    });

    it('should return has result is false when query is empty', () => {
        state = state.setIn(['search', 'query'], '')
            .setIn(['search', 'entries'], List().push(1))

        expect(selectors.selectHasResult()(state)).toEqual(false)
    });

    it('should return has result is false when entries is empty', () => {
        state = state.setIn(['search', 'query'], 'miku')
            .setIn(['search', 'entries'], List())

        expect(selectors.selectHasResult()(state)).toEqual(false)
    });

    it('should get recent search', () => {
        state = state.setIn(['search', 'recent'], List().push(64568))
        let expectedResult = [
            state.getIn(['entities', 'entries', '64568']).toJS()
        ]

        expect(selectors.selectRecentList()(state)).toEqual(expectedResult)
    })
})
