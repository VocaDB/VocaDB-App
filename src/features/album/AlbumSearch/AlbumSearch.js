import React from 'react'
import PropTypes from 'prop-types'
import { View, Text, FlatList } from 'react-native'
import images from '../../../common/assets/images'
import { Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import AlbumRow from '../../album/AlbumRow'

class AlbumSearch extends React.Component {

    componentDidMount () {
        this.props.onSearch()
    }

    render () {

        const renderAlbumRow = album => {
            return  (
                <AlbumRow
                    key={album.id}
                    image={images.getAlbumUri(album.id)}
                    name={album.name}
                    artist={album.artistString}
                    onPress={() => this.props.onPressAlbum(album)}
                />
            )
        }

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
                <FlatList
                    data={this.props.albums}
                    keyExtractor={item => item.id}
                    renderItem={({ item }) => renderAlbumRow(item)}
                />
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