import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import mockEntries from './mock'

describe('Search selector test', () => {

    let state = {}
    let searchState = {}

    beforeEach(() => {

        searchState = Immutable.fromJS({
            entries: [ 1032 ]
        })

        state = Immutable.fromJS(normalize(mockEntries.items, [ schemas['entries'] ]))
            .set('search', searchState)
    });

    it('should get search state', () => {
        expect(selectors.selectSearch()(state)).toEqual(Immutable.fromJS({ entries: [ 1032 ] }))
    });
})
