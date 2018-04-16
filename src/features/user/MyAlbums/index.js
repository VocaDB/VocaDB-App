import React from 'react'
import { connect } from 'react-redux'
import MyAlbums from './MyAlbums'
import { createSelector } from 'reselect'
import { selectAlbums } from './../userSelector'
import * as userActions from './../userActions'

MyAlbums.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Collections',
    }
}

const mapStateSelect = createSelector(
    selectAlbums(),
    (albums) => ({ albums })
);

const mapDispatchToProps = (dispatch, props) => ({
    onInit: () => dispatch(userActions.fetchAlbums())
})

export default connect(mapStateSelect, mapDispatchToProps)(MyAlbums)