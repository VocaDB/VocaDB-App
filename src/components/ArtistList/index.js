import React from 'react'
import { View, Text } from 'react-native'
import Artist from './../Artist'
import PropTypes from 'prop-types';
import images from './../../assets/images'

class ArtistList extends React.Component {

    render () {

        const renderItem = artist => {

            return  (
                <Artist
                    key={artist.id}
                    image={images.getArtistUri(artist.id)}
                    name={artist.name}
                    artist={artist.artistString}
                    onPress={() => this.props.onPressItem(artist.id)}
                />
            )
        }

        return (
            <View>
                {this.props.artists.map(renderItem)}
            </View>
        )
    }
}

ArtistList.propTypes = {
    artists: PropTypes.array,
    onPressItem: PropTypes.func
};

ArtistList.defaultProps = {
    artists: [],
    onPressItem: () => {}
};

export default ArtistList;