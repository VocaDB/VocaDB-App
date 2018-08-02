import React from 'react';
import Content from '../../../components/Content';
import SongList from '../SongList';
import Empty from './../../../components/Empty';
import i18n from './../../../common/i18n';

class FavoriteSongs extends React.PureComponent {

    render () {

        const noList = (!this.props.songs || this.props.songs.length === 0);

        if(noList) {
            return (<Empty text={i18n.emptyFavoriteSongs} icon='ios-person' />);
        }

        return (
            <Content>
                <SongList
                    songs={this.props.songs}
                    onPressItem={this.props.onPressSong} />
            </Content>
        )
    }
}

export default FavoriteSongs;