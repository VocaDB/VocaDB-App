import { listSongs, listRecentSongRequest, listRecentSongSuccess, listRecentSongError } from './home.action'

describe('Song actions', () => {
    it('should create an action request', () => {
        const expectedAction = {
            type: 'HOME_RECENT_SONGS_REQUEST',
            error: false
        }

        expect(listRecentSongRequest()).toEqual(expectedAction)
    });

    it('should create an action success', () => {
        const songs = [ { id: 1, name: 'A' }, { id: 2, name: 'B' } ]
        const expectedAction = {
            type: 'HOME_RECENT_SONGS_SUCCESS',
            error: false,
            payload: {
                songs
            }
        }
        expect(listRecentSongSuccess(songs)).toEqual(expectedAction)
    });

    it('should create an action error', () => {
        let err = new Error('list song error')
        const expectedAction = {
            type: 'HOME_RECENT_SONGS_ERROR',
            error: true,
            payload: err
        }
        expect(listRecentSongError(err)).toEqual(expectedAction)
    })
})
