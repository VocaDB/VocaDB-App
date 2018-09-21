import React from 'react';
import { connect } from 'react-redux';
import SongRelated from './SongRelated';
import { createSelector } from 'reselect';
import { selectSongRelated } from './../songSelector';
import Routes from './../../../app/appRoutes';
import i18n from './../../../common/i18n';

SongRelated.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : i18n.relatedSongs,
    }

    if(params && params.hideHeader) {
        navOptions.header = null;
    }

    return navOptions;
}

const songRelatedState = createSelector(
    selectSongRelated(),
    (related) => {
        return {
            artistMatches: (related && related.artistMatches)? related.artistMatches : [],
            likeMatches: (related && related.likeMatches)? related.likeMatches : [],
            tagMatches: (related && related.tagMatches)? related.tagMatches : []
        };
    }
);

const mapDispatchToProps = (dispatch, props) => ({
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { title: song.name, id: song.id })
})

export default connect(songRelatedState, mapDispatchToProps)(SongRelated);