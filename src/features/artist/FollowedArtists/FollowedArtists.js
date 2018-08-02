import React from 'react';
import Content from '../../../components/Content/index';
import ArtistList from '../ArtistList/index';
import Empty from './../../../components/Empty';
import i18n from './../../../common/i18n';

class FollowedArtists extends React.Component {

    render () {

        const noList = (!this.props.followedArtists || this.props.followedArtists.length === 0);

        if(noList) {
            return (<Empty text={i18n.emptyFavoriteArtists} icon='ios-person' />);
        }

        return (
            <Content>
                <ArtistList
                    artists={this.props.followedArtists}
                    onPressItem={this.props.onPressArtist} />
            </Content>
        )
    }
}

export default FollowedArtists;