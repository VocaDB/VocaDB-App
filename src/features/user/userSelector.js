import { createSelector } from 'reselect';

export const selectUser = () => (state) => {
    return state.user;
}

export const selectArtistEntity = () => state => (state.entities && state.entities.artists) ? state.entities.artists : []

export const selectFollowedArtistIds = () => createSelector(
    selectUser(),
    userState => {
        return userState.followedArtists
    }
)

export const selectFollowedArtists = () => createSelector(
    selectUser(),
    selectArtistEntity(),
    (userState, artistEntity) => (userState && artistEntity)? userState.followedArtists.map(id => artistEntity[id.toString()]) : []
)

export const selectIsAuthenticated = () => createSelector(
    selectUser(),
    (userState) => {
        return (userState.token)? true : false
    }
)

export const selectIsSkippedSignIn = () => createSelector(
    selectUser(),
    (userState) => (userState.skipSignIn)? true : false
)
