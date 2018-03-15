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
    selectLatestEvents } from '../artistSelector'
import { createSelector } from 'reselect';
import { Share } from 'react-native'

ArtistDetail.navigationOptions = () => ({
    title: 'Detail',
})

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
    (followedArtistIds, artist, isFollowed, latestSongs, popularSongs, latestAlbums, popularAlbums, latestEvents) => {
        return {
            artist,
            followedArtistIds,
            followed: isFollowed,
            latestSongs,
            popularSongs,
            latestAlbums,
            popularAlbums,
            latestEvents
        }
    })


const mapDispatchToProps = (dispatch, props) => ({
    fetchArtist: id => dispatch(artistActions.fetchArtistDetail(id)),
    onPressFollow: artist => {
        dispatch(artistActions.followArtist(artist))
    },
    onPressUnFollow: artist => dispatch(artistActions.unFollowArtist(artist)),
    onPressShare: artist => {
        const url = 'http://vocadb.net/Ar/' + artist.id
        Share.share({
            message: url,
            url: url,
            title: artist.defaultName,
        },{
            dialogTitle: 'Share ' + artist.defaultName,
        })
    },
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id, title: tag.name }),
    onPressMoreLatestSongs: artist => props.navigation.navigate('SongList', {
        title: 'Latest songs of ' + artist.name,
        params: {
            'maxResults': 20,
            'sort': 'AdditionDate',
            'artistId': artist.id,
            'fields': 'thumbUrl'
        }
    })
})

export default connect(artistDetailStateSelect, mapDispatchToProps)(ArtistDetail)