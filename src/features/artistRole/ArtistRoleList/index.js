import React from 'react'
import { View, Text } from 'react-native'
import Artist from '../../artist/ArtistRow/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'

class ArtistRole extends React.Component {

    render () {

        const renderItem = (artistRole, displayRole) => {

            let artist = (artistRole.artist)? artistRole.artist : artistRole;

            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
                    image={images.getArtistUri(artist.id)}
                    name={artist.name}
                    artist={artist.artistString}
                    role={(displayRole)? artistRole.roles : undefined}
                    onPress={() => this.props.onPressItem(artist)}
                />
            )
        }

        let artistRoles = this.props.artists;

        let uniqueCategories = artistRoles
            .map(artistRole => artistRole.categories)
            .filter((v, i, a) => a.indexOf(v) === i)
            .map(category => {

                const displayRole = (category === 'Other')? true : false;

                return (
                    <View key={category}>
                        <View style={{ padding: 8 }}>
                            <Text style={Theme.subhead}>{category}</Text>
                        </View>
                        {artistRoles
                            .filter(artistRole => artistRole.categories === category)
                            .map(artistRole => renderItem(artistRole, displayRole))}
                    </View>
                )
            })

        if(!artistRoles.length) {
            return (<View></View>)
        }

        return (
            <View>
                {uniqueCategories}
            </View>
        )
    }
}

ArtistRole.propTypes = {
    artists: PropTypes.arrayOf(PropTypes.object),
    onPressItem: PropTypes.func
};

ArtistRole.defaultProps = {
    artists: [],
    onPressItem: () => {}
};

export default ArtistRole;