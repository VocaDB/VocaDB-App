import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import Artist from './../Artist'
import PropTypes from 'prop-types';
import images from './../../assets/images'
import Theme from './../../theme'

class ArtistList extends React.Component {

    renderVertical () {
        const renderItem = artist => {

            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
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

    renderHorizontal () {
        const renderItem = artist => {

            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
                    display='avatar'
                    onPress={() => this.props.onPressItem(artist.id)}
                />
            )
        }

        return (
            <View>
                <Text style={Theme.title}>Artists</Text>
                <ScrollView horizontal={true}>
                    {this.props.artists.map(renderItem)}
                </ScrollView>
            </View>
        )
    }

    render () {
        return (this.props.horizontal) ? this.renderHorizontal() : this.renderVertical()
    }
}

ArtistList.propTypes = {
    artists: PropTypes.array,
    onPressItem: PropTypes.func,
    horizontal: PropTypes.bool,
    showHeader: PropTypes.bool,
    hideMoreButton: PropTypes.bool
};

ArtistList.defaultProps = {
    artists: [],
    horizontal: false,
    showHeader: false,
    hideMoreButton: false,
    onPressItem: () => {}
};

export default ArtistList;