import { createSelector } from 'reselect';

export const selectArtist = () => state => state.artist
export const selectArtistEntity = () => state => (state.entities && state.entities.artists)? state.entities.artists : {}
export const selectArtistDetailId = () => createSelector(
    selectArtist(),
    artist => artist.detail
)

export const selectArtistDetail = () => createSelector(
    selectArtistDetailId(),
    selectArtistEntity(),
    (artistDetailId, artistEntity) => artistEntity[artistDetailId.toString()]
)

export const selectFollowedArtistIds = () => createSelector(
    selectArtist(),
    artistState => {
        return artistState.followed
    }
)

export const selectFollowedArtists = () => createSelector(
    selectArtist(),
    selectArtistEntity(),
    (artistState, artistEntity) => (artistState && artistEntity)? artistState.followed.map(id => artistEntity[id.toString()]) : []
)

export const selectIsFollowedArtist = () => createSelector(
    selectArtist(),
    selectFollowedArtistIds(),
    (artistState, followedArtistIds) => {
        console.log('followed artists')
        console.log('detail :' + artistState.detail)
        console.log(followedArtistIds)
        return (followedArtistIds && followedArtistIds.indexOf(artistState.detail) >=0)? true : false
    }
)