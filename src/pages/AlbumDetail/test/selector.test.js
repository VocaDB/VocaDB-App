import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import mockAlbum from './mock'
import { normalize } from 'normalizr'

describe('Album detail selector', () => {

    let state = {}
    let albumDetailState = {}

    beforeEach(() => {

        albumDetailState = Immutable.fromJS({
            album: 1
        })

        state = Immutable.fromJS(normalize(mockAlbum, schemas['albums']))
            .set('albumDetail', albumDetailState)
    });

    it('should get album detail', () => {
        expect(selectors.selectAlbumDetail()(state)).toEqual(Immutable.Map({ album: 1 }))
    });

    it('should get album', () => {
        expect(selectors.selectAlbum()(state)).toEqual(state.getIn(['entities', 'albums', '1']))
    });

    it('should get artists', () => {
        const expectedResult = Immutable.fromJS(mockAlbum.artists);
        expect(selectors.selectArtists()(state)).toEqual(expectedResult)
    })

    it('should get release event', () => {
        const expectedResult = Immutable.fromJS(mockAlbum.releaseEvent);
        expect(selectors.selectReleaseEvent()(state)).toEqual(expectedResult)
    })

    it('should get PVs', () => {
        const expectedResult = Immutable.fromJS(mockAlbum.pvs);
        expect(selectors.selectPVs()(state)).toEqual(expectedResult)
    })

    it('should get tags', () => {
        const expectedResult = Immutable.fromJS(mockAlbum.tags);
        expect(selectors.selectTags()(state)).toEqual(expectedResult)
    })

    it('should get web links', () => {
        const expectedResult = Immutable.fromJS(mockAlbum.webLinks);
        expect(selectors.selectWebLinks()(state)).toEqual(expectedResult);
    })
})
