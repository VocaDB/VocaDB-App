import React from 'react'
import { connect } from 'react-redux'
import ArtistDetailPage from './component'

ArtistDetailPage.navigationOptions = () => ({
    title: 'Detail',
})

ArtistDetailPage.propTypes = {

}

const mapStateToProps = state => ({

})

const mapDispatchToProps = (dispatch, props) => ({
})

export default connect(mapStateToProps, mapDispatchToProps)(ArtistDetailPage)