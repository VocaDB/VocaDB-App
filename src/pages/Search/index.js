import React from 'react'
import { connect } from 'react-redux'
import SearchPage from './component'

SearchPage.navigationOptions = () => ({
    title: 'Search',
})

SearchPage.propTypes = {

}

const mapStateToProps = state => ({

})

const mapDispatchToProps = (dispatch, props) => ({
})

export default connect(mapStateToProps, mapDispatchToProps)(SearchPage)