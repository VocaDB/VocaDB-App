import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import mockSong from './mock'
import { normalize } from 'normalizr'

describe('Song detail selector', () => {

    let state = {}
    let songDetailState = {}

    beforeEach(() => {

        songDetailState = Immutable.fromJS({
            song: 1032
        })

        state = Immutable.fromJS(normalize(mockSong, schemas['songs']))
            .set('songDetail', songDetailState)
    });

    it('should get song detail', () => {
        expect(selectors.selectSongDetail()(state)).toEqual(Immutable.Map({ song: 1032 }))
    });

    it('should get song', () => {
        expect(selectors.selectSong()(state)).toEqual(state.getIn(['entities', 'songs', '1032']))
    });

    it('should get empty song if not exists', () => {
        state = state.deleteIn(['entities', 'songs'])
        expect(selectors.selectSong()(state)).toEqual(Immutable.Map());
    })

    it('should get albums', () => {
        const expectedResult = Immutable.fromJS(mockSong.albums);
        expect(selectors.selectAlbums()(state)).toEqual(expectedResult);
    })

    it('should get empty album list if not exists', () => {
        state = state.deleteIn(['entities', 'albums'])
        expect(selectors.selectAlbums()(state)).toEqual(Immutable.List());
    })

    it('should get tags', () => {
        const expectedResult = Immutable.fromJS(mockSong.tags);
        expect(selectors.selectTags()(state)).toEqual(expectedResult)
    })

    it('should get empty tag list if not exists', () => {
        state = state.deleteIn(['entities', 'tags'])
        expect(selectors.selectTags()(state)).toEqual(Immutable.List())
    })

    it('should get artist roles', () => {
        const expectedResult = Immutable.fromJS(mockSong.artists);
        expect(selectors.selectArtistRoles()(state)).toEqual(expectedResult)
    })

    it('should get artist role list if not exists', () => {
        state = state.deleteIn(['entities', 'artistRoles'])
        expect(selectors.selectArtistRoles()(state)).toEqual(Immutable.List())
    })

    it('should get lyrics', () => {
        const expectedResult = Immutable.fromJS(mockSong.lyrics);
        expect(selectors.selectLyrics()(state)).toEqual(expectedResult)
    })

    it('should get empty lyric list if not exists', () => {
        state = state.deleteIn(['entities', 'lyrics'])
        expect(selectors.selectLyrics()(state)).toEqual(Immutable.List())
    })

    it('should get webLinks', () => {
        const expectedResult = Immutable.fromJS(mockSong.webLinks);
        expect(selectors.selectWebLinks()(state)).toEqual(expectedResult)
    })

    it('should get empty webLink list if not exists', () => {
        state = state.deleteIn(['entities', 'webLinks'])
        expect(selectors.selectWebLinks()(state)).toEqual(Immutable.List())
    })

    it('should get PVs', () => {
        const expectedResult = Immutable.fromJS(mockSong.pvs);
        expect(selectors.selectPVs()(state)).toEqual(expectedResult)
    })

    it('should get empty PV list if not exists', () => {
        state = state.deleteIn(['entities', 'pvs'])
        expect(selectors.selectPVs()(state)).toEqual(Immutable.List())
    })

    it('should get song result', () => {
        const songResult = selectors.selectSongResult()(state)
        expect(songResult.defaultName).toEqual(mockSong.defaultName)
        expect(songResult.additionalNames).toEqual(mockSong.additionalNames)
        expect(songResult.thumbUrl).toEqual(mockSong.thumbUrl)
        expect(songResult.webLinks).toEqual(mockSong.webLinks)
        expect(songResult.pvs).toEqual(mockSong.pvs)
        expect(songResult.artists).toEqual(mockSong.artists)
        expect(songResult.albums).toEqual(mockSong.albums)
        expect(songResult.tags).toEqual(mockSong.tags)
        expect(songResult.lyrics).toEqual(mockSong.lyrics)
    });
})
