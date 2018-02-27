import { fromJS, Map, List } from 'immutable'
import * as selectors from './../selector'
import schemas from './../../../schema'
import { normalize } from 'normalizr'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('User selector test', () => {

    let state;

    beforeEach(() => {
        state = fromJS({
            entities: {
                artists: {
                    '1': mockGenerator.CreateArtist({ id: 1 }),
                    '2': mockGenerator.CreateArtist({ id: 2 })
                }
            },
            user: {
                follow: {
                    artists: {}
                }
            }
        })
    });

    it('should get user state', () => {
        expect(selectors.selectUser()(state)).toEqual(state.get('user'))
    });

    it('should get followed artists', () => {

        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        const follwedArtists = Map()
            .set('1', artist1)
            .set('2', artist2);

        state = state.setIn(['user', 'follow', 'artists'], follwedArtists)

        expect(selectors.selectFollowedArtists()(state)).toEqual(follwedArtists)
    });
})
