import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import Album from '../Album/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import style from './style'
import Theme from '../../../theme'
import { ListItem, Button } from 'react-native-material-ui';

class AlbumList extends React.Component {

    renderVertical () {
        const Header = () => (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
            </View>
        )

        const albums = (this.props.max)? this.props.albums.slice(0, this.props.max) : this.props.albums
        const isOverLimit = albums.length < this.props.albums.length

        const renderItem = album => {
            return  (
                <Album
                    key={album.id}
                    image={images.getAlbumUri(album.id)}
                    name={album.name}
                    artist={album.artistString}
                    onPress={() => this.props.onPressItem(album)}
                />
            )
        }

        return (
            <View style={{ }}>
                {this.props.showHeader && <Header />}
                <View>
                    {albums.map(renderItem)}
                    {isOverLimit && <Button primary text="See more" onPress={this.props.onPressMore} />}
                </View>
            </View>
        )
    }

    renderHorizontal () {

        const albums = this.props.albums.slice(0, this.props.max)

        const renderItem = album => {
            return  (
                <Album
                    key={album.id}
                    image={images.getAlbumUri(album.id)}
                    name={album.name}
                    artist={album.artistString}
                    display='box'
                    onPress={() => this.props.onPressItem(album)}
                />
            )
        }

        if(!albums.length) {
            return (<View></View>)
        }

        const Header = () => (
            <View style={{ height: 40, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingHorizontal: 4 }}>
                <View>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
                <View>
                </View>
            </View>
        )

        return (
            <View style={{ height: 300 }}>

                {this.props.showHeader && <Header />}
                <ScrollView horizontal={true} style={{ flex: 1 }}>
                    {albums.map(renderItem)}
                </ScrollView>

            </View>
        )
    }

    render () {
        return (this.props.horizontal) ? this.renderHorizontal() : this.renderVertical()
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