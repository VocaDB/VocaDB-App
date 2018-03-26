import React from 'react'
import { View, Text, SectionList } from 'react-native'
import Artist from '../../artist/ArtistRow/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'
import _ from 'lodash'

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


        /*
            ex.
            [
             { title: 'Vocaloid', data: [] },
             { title: 'Other', data: [] }
            ]
         */
        let newUnique = _.groupBy(artistRoles, 'categories')
        let sectionData = _.toPairs(newUnique).map(i => ({ title: i[0], data: i[1] }))

        if(!artistRoles.length) {
            return (<View></View>)
        }

        return (
            <SectionList
                renderItem={({ item }) => renderItem(item)}
                keyExtractor={item => item.id}
                renderSectionHeader={({ section }) => (
                    <View style={{ padding: 8 }}>
                        <Text style={Theme.subhead}>{section.title}</Text>
                    </View>
                )}
                sections={sectionData}
            />
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