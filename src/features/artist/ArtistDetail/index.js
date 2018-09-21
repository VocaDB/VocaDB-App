import React from 'react'
import { connect } from 'react-redux'
import ArtistDetail from './ArtistDetail'
import * as artistActions from '../artistActions'
import {
    selectArtistDetail,
    selectFollowedArtistIds,
    selectIsFollowedArtist,
    selectLatestSongs,
    selectLatestAlbums,
    selectPopularSongs,
    selectPopularAlbums,
    selectLatestEvents,
    selectArtistLinks,
    selectArtistLinksReverse,
    selectBaseVoicebank } from '../artistSelector'
import { createSelector } from 'reselect';
import { selectLoading } from './../../../app/appSelector'
import { Share, Linking } from 'react-native'
import Routes from './../../../app/appRoutes'
import { artistDetailUrl } from './../../../common/constants/config'
import firebase from 'react-native-firebase';

ArtistDetail.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: (params && params.title) ? params.title : 'Detail',
    }

    if(params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

ArtistDetail.propTypes = {

}

const artistDetailStateSelect = createSelector(
    selectFollowedArtistIds(),
    selectArtistDetail(),
    selectIsFollowedArtist(),
    selectLatestSongs(),
    selectPopularSongs(),
    selectLatestAlbums(),
    selectPopularAlbums(),
    selectLatestEvents(),
    selectLoading(),
    selectArtistLinks(),
    selectArtistLinksReverse(),
    selectBaseVoicebank(),
    (followedArtistIds, artist, isFollowed, latestSongs, popularSongs
     , latestAlbums, popularAlbums, latestEvents, loading, artistLinks, artistLinksReverse, baseVoicebank) => {
        return {
            artist,
            followedArtistIds,
            followed: isFollowed,
            latestSongs,
            popularSongs,
            latestAlbums,
            popularAlbums,
            latestEvents,
            loading,
            artistLinks,
            artistLinksReverse,
            baseVoicebank
        }
    })


const mapDispatchToProps = (dispatch, props) => ({
    fetchArtist: id => dispatch(artistActions.fetchArtistDetail(id)),
    onPressFollow: artist => {
        dispatch(artistActions.followArtist(artist))
        firebase.analytics().logEvent(`add_favorite_artist`, {
            id: artist.id,
            name: artist.name
        });
    },
    onPressUnFollow: artist => {
        dispatch(artistActions.unFollowArtist(artist))
        firebase.analytics().logEvent(`remove_favorite_artist`, {
            id: artist.id,
            name: artist.name
        });
    },
    onPressShare: artist => {
        const url = 'https://vocadb.net/Ar/' + artist.id

        firebase.analytics().logEvent(`share_artist`, {
            id: artist.id,
            name: artist.name
        });

        Share.share({
            message: url,
            url: url,
            title: artist.name,
        },{
            dialogTitle: 'Share ' + artist.name,
        })
    },
    onPressToVocaDB: artist => {
        if(!artist || !artist.id) {
            return;
        }

        firebase.analytics().logEvent(`redirect_vocadb`, {
            id: artist.id,
            name: artist.name,
            type: 'artist'
        });

        Linking.openURL(artistDetailUrl(artist.id)).catch(err => console.error('An error occurred', err))
    },
    onPressArtist: artist => props.navigation.navigate(Routes.ArtistDetail, { id: artist.id, title: artist.name }),
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id, title: song.name }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id, title: album.name }),
    onPressTag: tag => props.navigation.navigate(Routes.TagDetail, { id: tag.id, title: tag.name }),
    onPressEvent: event => props.navigation.navigate(Routes.EventDetail, { id: event.id, title: event.name }),
    onPressMoreRecentSongs: artist => props.navigation.navigate(Routes.SongWithParams, {
        title: 'Recent songs of ' + artist.name,
        filterParams: {
            maxResults: 50,
            sort: 'AdditionDate',
            artistId: artist.id,
            fields: 'thumbUrl'
        }
    }),
    onPressMorePopularSongs: artist => props.navigation.navigate(Routes.SongWithParams, {
        title: 'Popular songs of ' + artist.name,
        filterParams: {
            maxResults: 50,
            sort: 'RatingScore',
            artistId: artist.id,
            fields: 'thumbUrl'
        }
    }),
    onPressMoreRecentAlbums: artist => props.navigation.navigate(Routes.AlbumWithParams, {
        title: 'Recent albums of ' + artist.name,
        filterParams: {
            maxResults: 50,
            sort: 'AdditionDate',
            artistId: artist.id,
            fields: 'MainPicture'
        }
    }),
    onPressMorePopularAlbums: artist => props.navigation.navigate(Routes.AlbumWithParams, {
        title: 'Popular albums of ' + artist.name,
        filterParams: {
            maxResults: 50,
            sort: 'RatingAverage',
            artistId: artist.id,
            fields: 'MainPicture'
        }
    })
})

export default connect(artistDetailStateSelect, mapDispatchToProps)(ArtistDetail)