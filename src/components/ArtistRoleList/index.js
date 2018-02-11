import React from 'react'
import { View, Text } from 'react-native'
import Artist from './../Artist'
import PropTypes from 'prop-types';
import images from './../../assets/images'

class ArtistRole extends React.Component {

    render () {

        const renderItem = artistRole => {

            const artist = artistRole.artist;


            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
                    image={images.getArtistUri(artist.id)}
                    name={artist.name}
                    artist={artist.artistString}
                    role={(this.props.displayRole)? artistRole.roles : undefined}
                    onPress={() => this.props.onPressItem(artist.id)}
                />
            )
        }

        let artists = this.props.artists;

        if(this.props.category) {
            artists = this.props.artists.filter(artistRole => artistRole.categories == this.props.category)
        }

        if(this.props.role) {
            artists = this.props.artists.filter(artistRole => artistRole.roles == this.props.roles)
        }

        // artists = artists.map(artistRole => artistRole.artist)

        return (
            <View>
                <View style={{ padding: 8 }}>
                    <Text>{this.props.title}</Text>
                </View>
                {artists.map(renderItem)}
            </View>
        )
    }
}

ArtistRole.propTypes = {
    artists: PropTypes.array,
    title: PropTypes.string,
    role: PropTypes.string,
    displayRole: PropTypes.bool,
    showHeader: PropTypes.bool,
    category: PropTypes.string,
    onPressItem: PropTypes.func
};

ArtistRole.defaultProps = {
    artists: [],
    title: 'Artist',
    displayRole: false,
    showHeader: true,
    onPressItem: () => {}
};

export default ArtistRole;