import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS, Map } from 'immutable';

const defaultState = fromJS({
    follow: {
        artists: {}
    }
})

const reducer = createReducer({
    [actions.followArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        const keys = ['follow', 'artists'];
        const artistMap = Map().set(artist.id.toString(), fromJS(artist));

        return state.mergeDeepIn(keys, artistMap);
    },
    [actions.unFollowArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        const keyPath = ['follow', 'artists', artist.id.toString()];

        state = state.deleteIn(keyPath)
        return state
    }
}, defaultState)

export default reducer
