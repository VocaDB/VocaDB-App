import Immutable from 'immutable'
import * as selectors from './../selector'
import * as actions from './../actions';
import reducer from './../reducer'
import { createStore } from 'redux';
import { Map, List } from 'immutable'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Search reducer test state', () => {

    let state = Map()
    let store = {};

    beforeEach(() => {
        store = createStore(reducer);
        state = Map()
            .set('query', '')
            .set('loading', false)
            .set('entries', List())
            .set('recent', List())
    });

    it('Should change to loading state while searching', () => {
        let query = 'miku'
        let expectedState = state
            .set('loading', true)
            .set('query', query)

        store.dispatch(actions.searchEntries(query))

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    });

    it('Should got result when search success', () => {
        let mockSongEntry = mockGenerator.CreateEntry('Song')
        let mockArtistEntry = mockGenerator.CreateEntry('Artist')
        let expectedState = state
            .set('loading', false)
            .set('entries', [ mockSongEntry.id, mockArtistEntry.id ])

        store.dispatch(actions.searchEntriesSuccess([ mockSongEntry, mockArtistEntry ]))

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    });
})
