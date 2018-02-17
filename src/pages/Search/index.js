import React from 'react'
import { connect } from 'react-redux'
import SearchPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selecrLoading, selectEntries } from './selector'

SearchPage.navigationOptions = () => ({
    title: 'Search',
    header: null
})

SearchPage.propTypes = {

}

// const mapStateToProps = state => ({
//
// })

const searchStateSelect = createSelector(
    selecrLoading(),
    selectEntries(),
    (loading, entries) => ({ loading, entries })
);

const mapDispatchToProps = (dispatch, props) => ({
    searchEntries: query => dispatch(actions.searchEntries(query)),
    clearSearch: () => dispatch(actions.clearSearch())
})

export default connect(searchStateSelect, mapDispatchToProps)(SearchPage)