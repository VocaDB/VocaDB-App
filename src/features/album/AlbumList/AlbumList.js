import React from 'react';
import { View, Text, FlatList } from 'react-native';
import Album from '../AlbumRow/index';
import PropTypes from 'prop-types';
import style from './style';
import Theme from '../../../theme';
import i18n from './../../../common/i18n';

class AlbumList extends React.PureComponent {
    render () {
        const Header = () => (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
            </View>
        )

        const renderItem = album => {

            return  (
                <Album
                    key={album.id}
                    image={album.image}
                    name={album.name}
                    artist={album.artistString}
                    onPress={() => this.props.onPressItem(album)}
                />
            )
        }

        return (
            <View>
                {this.props.showHeader && <Header />}
                <View>
                    <FlatList
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
    title: i18n.albums,
    max: 0,
    showHeader: false,
    horizontal: false,
    hideMoreButton: false,
    albums: [],
    onPressItem: () => {},
    onPressMore: () => {}
};

export default AlbumList;