import { createSelector } from 'reselect';

export const selectUser = () => (state) => state.user;

export const selectArtistEntity = () => state => state.entities.artists

export const selectFollowedArtistIds = () => createSelector(
    selectUser(),
    userState => userState.followedArtists
)

export const selectFollowedArtists = () => createSelector(
    selectUser(),
    selectArtistEntity(),
    (userState, artistEntity) => userState.followedArtists.map(id => artistEntity[id.toString()])
)
