import React from 'react';
import { Share, Linking } from 'react-native';
import { connect } from 'react-redux';
import SongDetailPage from './SongDetail';
import { createSelector } from 'reselect';
import * as songActions from '../songActions';
import { selectSongDetail,
    selectIsFavoriteSong,
    selectAlbums,
    selectOriginalSong,
    selectOriginalPVs,
    selectOtherPVs,
    selectPVByDefaultPVService,
    selectAlternateVersion,
    selectSongDetailLikeMatches } from '../songSelector';
import Routes from './../../../app/appRoutes';
import { selectDefaultPVService } from './../../user/userSelector';
import { songDetailUrl } from './../../../common/constants/config';
import i18n from './../../../common/i18n';

SongDetailPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: (params && params.title) ? params.title : i18n.detail,
    }

    if(params.hideHeader) {
        navOptions.header = null;
    }

    return navOptions;
}

SongDetailPage.propTypes = {

}

const songDetailStateSelect = createSelector(
    selectSongDetail(),
    selectIsFavoriteSong(),
    selectAlbums(),
    selectOriginalSong(),
    selectOriginalPVs(),
    selectOtherPVs(),
    selectPVByDefaultPVService(),
    selectAlternateVersion(),
    selectSongDetailLikeMatches(),
    (song, isFavoriteSong, albums, originalSong, originalPVs, otherPVs, pv, altVersion, likeMatches) => ({ song, isFavoriteSong, albums, originalSong, originalPVs, otherPVs, pv, altVersion, likeMatches })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchSong: id => dispatch(songActions.fetchSongDetail(id)),
    onPressFavorite: song => dispatch(songActions.addFavoriteSong(song)),
    onPressUnfavorite: song => dispatch(songActions.removeFavoriteSong(song)),
    onPressShare: song => {
        const url = 'https://vocadb.net/S/' + song.id
        Share.share({
            message: url,
            url: url,
            title: song.name,
        },{
            dialogTitle: 'Share ' + song.name,
        })
    },
    onPressToVocaDB: song => {
        if(!song || !song.id) {
            return;
        }
        Linking.openURL(songDetailUrl(song.id)).catch(err => console.error('An error occurred', err))
    },
    onPressArtist: artist => props.navigation.navigate(Routes.ArtistDetail, { id: artist.id, title: artist.name }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id, title: album.name }),
    onPressTag: tag => props.navigation.navigate(Routes.TagDetail, { id: tag.id, title: tag.name }),
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id, title: song.name }),
    onPressMoreAlternateVersion: songs => props.navigation.navigate(Routes.SongShowAll, { title: `${i18n.alternateVersion} (${songs.length})`, songs: songs }),
    onPressMoreRelatedSongs: id => props.navigation.navigate(Routes.SongRelated, { id })
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)