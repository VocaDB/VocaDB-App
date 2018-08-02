import React from 'react';
import { ScrollView, Text } from 'react-native';
import Content from '../../../components/Content';
import AlbumGridView from './../AlbumGridView';
import Empty from './../../../components/Empty';
import i18n from './../../../common/i18n';

class FavoriteAlbums extends React.PureComponent {

    render () {

        const noList = (!this.props.albums || this.props.albums.length === 0);

        if(noList) {
            return (<Empty text={i18n.emptyFavoriteAlbums} icon='ios-disc' />);
        }

        return (
            <Content>
                <AlbumGridView
                    albums={this.props.albums}
                    onPressItem={this.props.onPressAlbum} />
            </Content>
        )
    }
}

export default FavoriteAlbums;