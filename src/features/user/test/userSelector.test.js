import * as selectors from '../userSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('User selector test', () => {

    let state;
    let artist1;
    let artist2;

    beforeEach(() => {

        artist1 =  mockGenerator.CreateArtist({ id: 1 })
        artist2 =  mockGenerator.CreateArtist({ id: 2 })
        state = {
            entities: {
                artists: {
                    '1': artist1,
                    '2': artist2
                }
            },
            user: {
                follow: {
                    artists: {}
                }
            }
        }
    });

    it('should get user state', () => {
        expect(selectors.selectUser()(state)).toEqual(state.user)
    });

    it('should get user id', () => {
        state.user.userId = '1234';
        expect(selectors.selectUserId()(state)).toEqual('1234')
    })

    it('should get skip sign in', () => {
        state.user.skipSignIn = true;
        expect(selectors.selectIsSkippedSignIn()(state)).toEqual(true)
    })
})
