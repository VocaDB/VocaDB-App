import * as action from './nav.action'
import * as actionType from './nav.action.type'
import * as route from './../../constants/routes'

describe('Nav actions', () => {

    const createExpectedAction = (type, payload) => ({
        type,
        error: false,
        payload
    })

    it('should create an action back', () => {
        const payload = { key: undefined, type: 'Navigation/BACK' }
        expect(action.back()).toEqual(createExpectedAction(actionType.BACK, payload))
    });

    it('should create an action view root', () => {
        const payload = { routeName: route.ROOT }
        expect(action.viewRoot()).toEqual(createExpectedAction(actionType.ROOT_VIEW, payload))
    });

    it('should create an action view song', () => {
        const payload = { routeName: route.SONG, id: 1 }
        expect(action.viewSong(1)).toEqual(createExpectedAction(actionType.SONG_VIEW, payload))
    });

    it('should create an action view album', () => {
        const payload = { routeName: route.ALBUM, id: 1 }
        expect(action.viewAlbum(1)).toEqual(createExpectedAction(actionType.ALBUM_VIEW, payload))
    });

    it('should create an action view artist', () => {
        const payload = { routeName: route.ARTIST, id: 1 }
        expect(action.viewArtist(1)).toEqual(createExpectedAction(actionType.ARTIST_VIEW, payload))
    });

    it('should create an action view search', () => {
        const payload = { routeName: route.SEARCH }
        expect(action.viewSearch()).toEqual(createExpectedAction(actionType.SEARCH_VIEW, payload))
    });

    it('should create an action view event', () => {
        const payload = { routeName: route.EVENT, id: 1 }
        expect(action.viewEvent(1)).toEqual(createExpectedAction(actionType.EVENT_VIEW, payload))
    });

    it('should create an action view tag', () => {
        const payload = { routeName: route.TAG, id: 1 }
        expect(action.viewTag(1)).toEqual(createExpectedAction(actionType.TAG_VIEW, payload))
    });
})
