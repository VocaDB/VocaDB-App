import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'

describe('Song detail selector', () => {

    let state = {}
    let homeState = {}

    beforeEach(() => {

        homeState = Immutable.fromJS({
            song: 1032
        })

        state = Immutable.fromJS(normalize(mockSong, [ schemas['songs'] ]))
            .set('home', homeState)
    });

    it('should get song detail', () => {
        expect(selectors.selectSongDetail()(state)).toEqual(Immutable.Map({ song: 1032 }))
    });
})
