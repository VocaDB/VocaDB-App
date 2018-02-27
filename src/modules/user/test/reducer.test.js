import reducer from './../reducer'
import * as actions from './../actions'
import { createStore } from 'redux';
import { Map, List, fromJS } from 'immutable'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('User reducer test state', () => {

    let state = Map()
    let store = {};

    beforeEach(() => {
        store = createStore(reducer);
        state = fromJS({
            'follow': {
                'artists': {}
            }
        })
    });

    it('Should follow artist', () => {
        const artist = mockGenerator.CreateArtist()
        let expectedState = state
            .setIn(['follow', 'artists'], fromJS({ '1': artist }))

        store.dispatch(actions.followArtist(artist))

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    })

    it('Should not add duplicated artist', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        let expectedState = state
            .setIn(['follow', 'artists'], fromJS({ '1': artist1, '2': artist2 }))

        store.dispatch(actions.followArtist(artist1))
        store.dispatch(actions.followArtist(artist2))

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    })

    it('Should return state when invalid action called', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        let expectedState = state
            .setIn(['follow', 'artists'], fromJS({ '1': artist1 }))

        store.dispatch(actions.followArtist(artist1))
        store.dispatch(actions.followArtist())

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    })

    it('Should unFollow artist', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        let expectedState = state
            .setIn(['follow', 'artists'], fromJS({ '2': artist2 }))

        store.dispatch(actions.followArtist(artist1))
        store.dispatch(actions.followArtist(artist2))
        store.dispatch(actions.unFollowArtist(artist1))

        expect(store.getState().toJS()).toEqual(expectedState.toJS());
    })
})