import React from 'react'
import PropTypes from 'prop-types'
import { View, Text } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import AlbumList from '../../album/AlbumList'

class AlbumSearch extends React.Component {

    componentDidMount () {
        this.props.onSearch()
    }

    render () {
        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Albums"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find album',
                        onChangeText: this.props.onSearch
                    }}
                />
                <View>
                    <AlbumList albums={this.props.albums} onPressItem={this.props.onPressAlbum} />
                </View>
            </Page>
        )
    }
}

AlbumSearch.propTypes = {
    albums: PropTypes.array,
    onSearch: PropTypes.func,
    onPressAlbum: PropTypes.func
}

AlbumSearch.defaultProps = {
    albums: [],
    onSearch: text => console.log('Search ' + text),
    onPressAlbum: album => console.log('Press album')
}

export default AlbumSearch