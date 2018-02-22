import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Tag detail selector', () => {

    let mockTag = {}
    let state = {}
    let tagDetailState = {}

    beforeEach(() => {

        mockTag = mockGenerator.CreateTag({ id: 1 })

        tagDetailState = Immutable.fromJS({
            tag: 1,
            topSongs: [],
            topArtists: [],
            topAlbums: []
        })

        state = Immutable.fromJS(normalize(mockTag, schemas['tags']))
            .set('tagDetail', tagDetailState)
    });

    it('should get tag detail', () => {
        expect(selectors.selectTagDetail()(state)).toEqual(tagDetailState)
    });

    it('should get tag', () => {
        expect(selectors.selectTag()(state)).toEqual(state.getIn(['entities', 'tags', '1']).toJS())
    });

    it('should get empty tag', () => {
        state = state.setIn(['tagDetail', 'tag'], 0)
        expect(selectors.selectTag()(state)).toEqual({})
    });

})
