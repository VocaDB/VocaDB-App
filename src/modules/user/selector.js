import { createSelector } from 'reselect';

export const selectUser = () => (state) => state.get('user');
export const selectFollowedArtists = () => createSelector(
    selectUser(),
    (userState) => {
        console.log(userState)
        return userState.getIn(['follow', 'artists'])
    })