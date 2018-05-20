import React from 'react'
import { connect } from 'react-redux'
import TagSearch from './TagSearch'
import { createSelector } from 'reselect';
import * as tagActions from '../tagActions'
import { selectSearchResult, selectSearchParams } from '../tagSelector'
import { selectLoading } from '../../../app/appSelector'
import Routes from './../../../app/appRoutes'

TagSearch.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Tags',
    }

    if(params && params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const mapStateSelector = createSelector(
    selectSearchResult(),
    selectSearchParams(),
    selectLoading(),
    (tags, params, loading) => ({ tags, params, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    onSearch: params => dispatch(tagActions.searchTags(params)),
    onSearchReplaceParams: params => dispatch(tagActions.searchTags(params, false, true)),
    back: () => props.navigation.goBack(),
    onPressItem: tag => props.navigation.navigate(Routes.TagDetail, { id: tag.id, title: tag.name })
})

export default connect(mapStateSelector, mapDispatchToProps)(TagSearch)