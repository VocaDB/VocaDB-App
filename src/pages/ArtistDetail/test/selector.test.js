import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import mockArtist from './mock'
import * as mockGenerator from './../../../helper/mockGenerator'
import { normalize } from 'normalizr'

describe('Artist detail selector', () => {

    let state = {}
    let artistDetailState = {}

    beforeEach(() => {

        artistDetailState = Immutable.fromJS({
            artist: 1
        })

        state = Immutable.fromJS(normalize(mockArtist, schemas['artists']))
            .set('artistDetail', artistDetailState)
    });

    it('should get artist detail', () => {
        expect(selectors.selectArtistDetail()(state)).toEqual(Immutable.Map({ artist: 1 }))
    });

    it('should get artist', () => {
        expect(selectors.selectArtist()(state)).toEqual(state.getIn(['entities', 'artists', '1']))
    });

    it('should get empty artist if not exists', () => {
        state = state.deleteIn(['entities', 'artists'])
        expect(selectors.selectArtist()(state)).toEqual(Immutable.Map());
    })

    it('should get latest albums', () => {
        const expectedResult = Immutable.fromJS(mockArtist.relations.latestAlbums);
        expect(selectors.selectLatestAlbums()(state)).toEqual(expectedResult);
    })

    it('should get latest songs', () => {
        const expectedResult = Immutable.fromJS(mockArtist.relations.latestSongs);
        expect(selectors.selectLatestSongs()(state)).toEqual(expectedResult);
    })

    it('should get popular albums', () => {
        const expectedResult = Immutable.fromJS(mockArtist.relations.popularAlbums);
        expect(selectors.selectPopularAlbums()(state)).toEqual(expectedResult);
    })

    it('should get popular songs', () => {
        const expectedResult = Immutable.fromJS(mockArtist.relations.popularSongs);
        expect(selectors.selectPopularSongs()(state)).toEqual(expectedResult);
    })

    it('should get latest events', () => {
        const expectedResult = Immutable.fromJS(mockArtist.relations.latestEvents);
        expect(selectors.selectLatestEvents()(state)).toEqual(expectedResult);
    })

    it('should get tags', () => {
        const expectedResult = Immutable.fromJS(mockArtist.tags);
        expect(selectors.selectTags()(state)).toEqual(expectedResult)
    })

    it('should get web links', () => {
        const expectedResult = Immutable.fromJS(mockArtist.webLinks);
        expect(selectors.selectWebLinks()(state)).toEqual(expectedResult);
    })

    it('should return true if this is followed artist', () => {
        state = state.set('user', Immutable.fromJS({
            follow: {
                artists: {
                    '1': mockArtist
                }
            }
        }))

        expect(selectors.selectIsFollowedArtist()(state)).toEqual(true);

    })

    it('should return false if not followed artist', () => {
        state = state.set('user', Immutable.fromJS({
            follow: {
                artists: {
                    '2': mockArtist
                }
            }
        }))

        expect(selectors.selectIsFollowedArtist()(state)).toEqual(false);

    })
})
