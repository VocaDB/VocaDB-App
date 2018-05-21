import React from 'react'
import { connect } from 'react-redux'
import Settings from './Settings'
import { createSelector } from 'reselect'
import { selectSettings } from './../userSelector'
import * as userActions from './../userActions'

Settings.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Settings',
    }
}

const mapStateSelect = createSelector(
    selectSettings(),
    (settings) => ({ settings })
);

const mapDispatchToProps = (dispatch, props) => ({
    onSettingsChanged: settings => dispatch(userActions.updateSettings(settings))
})

export default connect(mapStateSelect, mapDispatchToProps)(Settings)