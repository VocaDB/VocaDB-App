import React from 'react';
import { View, Text, SectionList, Alert } from 'react-native';
import Artist from '../../artist/ArtistRow/index';
import PropTypes from 'prop-types';
import images from '../../../common/assets/images';
import Theme from '../../../theme';
import _ from 'lodash';
import { translateArtistType } from './../../artist/artistConstant';
import i18n from './../../../common/i18n'

class ArtistRole extends React.Component {

    render () {

        const renderItem = (artistRole, displayRole) => {

            let artist = (artistRole.artist)? artistRole.artist : artistRole;
            let imageUrl = (artist.mainPicture && artist.mainPicture.urlSmallThumb) ? artist.mainPicture.urlSmallThumb : images.getArtistUri(artist.id, artist.pictureMime);

            return  (
                <Artist
                    key={artist.id}
                    id={artist.id}
                    image={imageUrl}
                    name={artist.name}
                    artist={artist.artistString}
                    role={(displayRole)? artistRole.roles : undefined}
                    onPress={() => {
                        if(artistRole && artistRole.artist) {
                            this.props.onPressItem(artist)
                        } else {
                            Alert.alert("Artist not found", "This artist not exists in database")
                        }
                    }}
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
        let newUnique = _.groupBy(artistRoles, this.props.groupBy)
        let sectionData = _.toPairs(newUnique).map(i => ({ title: i[0], data: i[1] }))

        if(!artistRoles.length) {
            return (<View></View>)
        }

        return (
            <SectionList
                style={{ backgroundColor: 'white' }}
                renderItem={({ item }) => renderItem(item)}
                keyExtractor={item => {
                    return (item.artist)? item.artist.id : item.id
                }}
                renderSectionHeader={({ section }) => {
                    return (
                        <View style={{ padding: 8 }}>
                            <Text style={Theme.subhead}>{translateArtistType(section.title)}</Text>
                        </View>
                    )
                }}
                sections={sectionData}
            />
        )
    }
}

ArtistRole.propTypes = {
    artists: PropTypes.arrayOf(PropTypes.object),
    groupBy: PropTypes.string,
    displayRole: PropTypes.bool,
    onPressItem: PropTypes.func
};

ArtistRole.defaultProps = {
    artists: [],
    groupBy: 'categories',
    displayRole: false,
    onPressItem: () => {}
};

export default ArtistRole;