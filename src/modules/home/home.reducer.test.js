import { listSongs, listRecentSongRequest, listRecentSongSuccess, listRecentSongError } from './home.action'
import reducer from './home.reducer'

describe('Home reducers', () => {
    it('should return default state when given undefined', () => {
        let expectedState = { loading: false, songs: [], albums: [], events: [] }
        expect(reducer(undefined, {})).toEqual(expectedState)
    })

    it('should handle list songs request', () => {
        let action = listRecentSongRequest()
        let initialState = { loading: false, songs: [], albums: [], events: [] }
        let expectedState = { loading: true, songs: [], albums: [], events: [] }
        expect(reducer(initialState, action)).toEqual(expectedState)
    })

    it('should handle list songs success', () => {
        const songs = [ { id: 1, name: 'A' }, { id: 2, name: 'B' } ]
        let action = listRecentSongSuccess(songs)
        let initialState = { loading: true, songs: [], albums: [], events: [] }
        let expectedState = { loading: false, songs, albums: [], events: [] }
        expect(reducer(initialState, action)).toEqual(expectedState)
    })

    it('should handle list songs error', () => {
        let err = new Error('list song error')
        let action = listRecentSongError(err)
        let initialState = { loading: true, songs: [], albums: [], events: [] }
        let expectedState = { loading: false, songs: [] , error: err, albums: [], events: [] }
        expect(reducer(initialState, action)).toEqual(expectedState)
    })
})
