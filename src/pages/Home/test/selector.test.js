import Immutable from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import * as mock from './mock'

describe('Home selector', () => {

    let state = {}
    let homeState = {}

    beforeEach(() => {

        homeState = Immutable.fromJS({
            recentSongs: [ 1032 ]
        })

        state = Immutable.fromJS(normalize(mock.recentSongs, [ schemas['songs'] ]))
            .set('home', homeState)
    });

    it('should get home state', () => {
        expect(selectors.selectHome()(state)).toEqual(Immutable.fromJS({ recentSongs: [ 1032 ] }))
    });
})
