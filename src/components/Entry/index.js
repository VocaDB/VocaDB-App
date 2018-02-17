import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from './../../assets/images'
import Icon from './../../components/Icon'
import Theme from './../../theme'

class Entry extends React.Component {



    renderThumbnail () {

        const getImage = uri => (<Image style={[styles.image]} source={{ uri }} />)

        if(this.props.thumbnail) {
            return (
                    <Image style={styles.image}
                           source={{ url: this.props.thumbnail }} />
            )
        }

        switch(this.props.entryType) {
            case 'Artist' :
                return getImage(images.getArtistUri(this.props.id))
                break;
            case 'Album' :
                return getImage(images.getAlbumUri(this.props.id))
        }

        const SearchIcon = () => (<Icon name='ios-search' />)
        const SongIcon = () => (<Icon name='ios-musical-notes' />)
        const ArtistIcon = () => (<Icon name='ios-person' />)
        const AlbumIcon = () => (<Icon name='ios-disc' />)
        const EventIcon = () => (<Icon name='ios-calendar' />)

        const Icons = {
            'Song': (<SongIcon />),
            'Artist': (<ArtistIcon />),
            'Album': (<AlbumIcon />),
            'ReleaseEvent': (<EventIcon />)
        }

        return (
                (Icons[this.props.entryType])?  Icons[this.props.entryType] : <SearchIcon />
        )
    }

    render () {

        return (
            <TouchableOpacity onPress={this.props.onPress} style={{ paddingHorizontal: 8, height: 80, flexDirection: 'row', backgroundColor: 'white' }}>
                <View  style={{ flex: 1, flexDirection: 'row', alignItems: 'center' }}>
                    <View style={{ width: 64, height: 64 }}>
                        {this.renderThumbnail()}
                    </View>
                    <View style={{ flex: 1, justifyContent: 'center', padding: 4 }}>
                        <Text numberOfLines={1}>{this.props.name}</Text>
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

Entry.propTypes = {
    id: PropTypes.number,
    name: PropTypes.string,
    entryType: PropTypes.string,
    thumbnail: PropTypes.string
};

Entry.defaultProps = {
};

const styles =  StyleSheet.create({
    listItem: {
        flexDirection: 'row',
        backgroundColor: 'white',
        padding: 4,
        height: 80
    },
    imageContainer: {
        padding: 4,
        // backgroundColor: '#546E7A',
        width: 100
    },
    infoContainer: {
        flex: 1,
        justifyContent: 'center',
        padding: 4
    },
    image: {
        flex: 1
    },
    title: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 4
    },
    subtitle: {

    }
})


export default Entry;