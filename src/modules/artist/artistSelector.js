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