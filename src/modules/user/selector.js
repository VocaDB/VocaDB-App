import { createSelector } from 'reselect';

export const selectUser = () => (state) => state.get('user');
export const selectFollowedArtists = () => createSelector(
    selectUser(),
    (userState) => {
        return userState.getIn(['follow', 'artists'])
    })

export const selectFollowedArtistsAsArray = () => createSelector(
    selectFollowedArtists(),
    (followedArtists) => {
        return followedArtists.toList().toJS()
    })

export const selectFollowedArtistIds = () => createSelector(
    selectFollowedArtists(),
    (followedArtists) => {
        return followedArtists.toList().toJS().map(a => a.id)
    })