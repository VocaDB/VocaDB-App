import React from 'react'
import { View, Text, FlatList } from 'react-native'
import Album from '../AlbumRow/index'
import PropTypes from 'prop-types';
import style from './style'
import Theme from '../../../theme'

class AlbumList extends React.Component {
    render () {
        const Header = () => (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
            </View>
        )

        const renderItem = album => {
            const thumbUrl = (album.mainPicture) ? album.mainPicture.urlThumb : null
            return  (
                <Album
                    key={album.id}
                    image={thumbUrl}
                    name={album.name}
                    artist={album.artistString}
                />
            )
        }

        return (
            <View>
                {this.props.showHeader && <Header />}
                <View>
                    <FlatList
                        horizontal
                        style={{ flex: 1 }}
                        data={this.props.albums}
                        keyExtractor={item => item.id}
                        renderItem={({ item }) => renderItem(item)} />
                </View>
            </View>
        )
    }
}

AlbumList.propTypes = {
    albums: PropTypes.array,
    max: PropTypes.number,
    onPressItem: PropTypes.func,
    onPressMore: PropTypes.func,
    showHeader: PropTypes.bool,
    horizontal: PropTypes.bool,
    hideMoreButton: PropTypes.bool
};

AlbumList.defaultProps = {
    title: 'Albums',
    max: 0,
    showHeader: false,
    horizontal: false,
    hideMoreButton: false,
    albums: [],
    onPressItem: () => {},
    onPressMore: () => {}
};

export default AlbumList;