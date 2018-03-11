import * as actions from './../entryActions';
import reducer from './../entryReducer'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Search reducer test state', () => {

    let state = {}

    beforeEach(() => {
        state = {
            query: '',
            entries: [],
            recent: []
        }
    });

    it('Should got result when search success', () => {
        let mockSongEntry = mockGenerator.CreateEntry('Song')
        let mockArtistEntry = mockGenerator.CreateEntry('Artist')
        let expectedState = {
            ...state, entries: [ mockSongEntry.id, mockArtistEntry.id ]
        }

        let nextState = reducer(state, actions.searchEntriesSuccess([ mockSongEntry, mockArtistEntry ]))

        expect(nextState).toEqual(expectedState);
    });

    it('Should save entry', () => {
        let mockSongEntry = mockGenerator.CreateEntry('Song')
        let mockArtistEntry = mockGenerator.CreateEntry('Artist')
        let expectedState = { ...state, recent: [ mockArtistEntry.id, mockSongEntry.id ] }

        let nextState = reducer(state, actions.saveRecentSearch(mockSongEntry))
        nextState = reducer(nextState, actions.saveRecentSearch(mockArtistEntry))

        expect(nextState).toEqual(expectedState);
    })

    it('Should not save duplicate entry', () => {
        let mockSongEntry = mockGenerator.CreateEntry('Song')
        let expectedState = { ...state, recent: [ mockSongEntry.id ] }

        let nextState = reducer(state, actions.saveRecentSearch(mockSongEntry))
        nextState = reducer(nextState, actions.saveRecentSearch(mockSongEntry))

        expect(nextState).toEqual(expectedState);
    })
})
