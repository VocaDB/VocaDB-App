import React from 'react'
import PropTypes from 'prop-types'
import { View, Text, FlatList } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import AlbumRow from '../../album/AlbumRow'

class AlbumSearch extends React.PureComponent {

    componentDidMount () {
        this.props.onSearch()
    }

    render () {

        const renderAlbumRow = album => {
            const thumbUrl = (album.mainPicture) ? album.mainPicture.urlThumb : undefined
            return  (
                <AlbumRow
                    key={album.id}
                    image={thumbUrl}
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