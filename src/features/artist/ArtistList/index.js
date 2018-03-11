import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import Artist from '../Artist/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'
import { material } from 'react-native-typography'

class ArtistList extends React.Component {

    renderVertical () {
        const renderItem = artist => {
            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
                    name={artist.name}
                    artist={artist.artistString}
                    onPress={() => this.props.onPressItem(artist)}
                />
            )
        }

        return (
            <View>
                {this.props.showHeader && <Text style={[material.subheading, { margin: 8 }]}>{this.props.title}</Text>}
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
                    onPress={() => this.props.onPressItem(artist)}
                />
            )
        }

        return (
            <View>
                {this.props.showHeader && <Text style={Theme.subheading}>{this.props.title}</Text>}
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
    title: PropTypes.string,
    artists: PropTypes.array,
    onPressItem: PropTypes.func,
    horizontal: PropTypes.bool,
    showHeader: PropTypes.bool,
    hideMoreButton: PropTypes.bool
};

ArtistList.defaultProps = {
    title: 'Artists',
    artists: [],
    horizontal: false,
    showHeader: false,
    hideMoreButton: false,
    onPressItem: () => {}
};

export default ArtistList;