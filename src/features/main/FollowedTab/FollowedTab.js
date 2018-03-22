import React from 'react'
import { View, Text, ScrollView, RefreshControl } from 'react-native'
import SongList from '../../song/SongList'
import CenterView from '../../../components/CenterView'
import PropTypes from 'prop-types'
import Icon from '../../../components/Icon'

class FollowedTab extends React.Component {

    renderEmpty () {
        return (
            <CenterView>
                <Icon name='ios-person' size='xlarge' />
                <Text>You did not followed any artist.</Text>
            </CenterView>
        )
    }

    render () {

        if(this.props.songs.length > 0) {

            const refreshControl = (
                <RefreshControl
                    refreshing={this.props.refreshing}
                    onRefresh={this.props.refresh}
                />
            )

            return (
                <ScrollView refreshControl={refreshControl}>
                    <SongList songs={this.props.songs} onPressItem={this.props.onPressSong} />
                </ScrollView>
            )
        }

        return this.renderEmpty()

    }
}

FollowedTab.propTypes = {
    songs: PropTypes.array,
    onPressSong: PropTypes.func
}

FollowedTab.defaultProps = {
    songs: [],
    onPressSong: () => console.log('')
}

export default FollowedTab