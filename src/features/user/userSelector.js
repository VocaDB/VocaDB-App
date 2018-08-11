import { createSelector } from 'reselect';
import { selectAlbumEntity, convertAlbum, selectFavoriteAlbums } from './../album/albumSelector';
import { selectFavoriteSongs } from './../song/songSelector';
import { selectFollowedArtists } from './../artist/artistSelector';

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

export const selectUserId = () => createSelector(
    selectUser(),
    (userState) => (userState && userState.userId)? userState.userId : null
)

export const selectAlbums = () => createSelector(
    selectUser(),
    selectAlbumEntity(),
    (userState, albumEntity) => {
        if(!userState || !userState.albums) {
            return [];
        }

        return userState.albums.map(a => {
            let n = convertAlbum(albumEntity[a.album.toString()])
            return n;
        })
    }
)

export const selectSettings = () => createSelector(
    selectUser(),
    (userState) => (userState && userState.settings)? userState.settings : {
        displayLanguage: 'Default',
        defaultPVService: 'Default'
    }
)

export const selectDisplayLanguage = () => createSelector(
    selectSettings(),
    (settings) => (settings && settings.displayLanguage)? settings.displayLanguage : 'Default'
)

export const selectDefaultPVService = () => createSelector(
    selectSettings(),
    (settings) => (settings && settings.defaultPVService)? settings.defaultPVService : 'Default'
)

export const selectBackupData = () => createSelector(
    selectFollowedArtists(),
    selectFavoriteAlbums(),
    selectFavoriteSongs(),
    selectSettings(),
    (followedArtists, favoriteAlbums, favoriteSongs, settings) => {
        return JSON.stringify({
            followedArtists,
            favoriteAlbums,
            favoriteSongs,
            settings
        });
    }
)