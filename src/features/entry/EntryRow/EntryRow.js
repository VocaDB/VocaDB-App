import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Icon from '../../../components/Icon/index'
import Theme from '../../../theme'

class Entry extends React.Component {



    renderThumbnail () {

        const SongIcon = () => (<Icon name='ios-musical-notes' />)

        if(this.props.entryType === 'Song') {
            return <SongIcon />;
        }

        return (<Image style={styles.image} source={{ uri: this.props.thumbnail }}
        />)
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
                        <Text style={Theme.caption} numberOfLines={1}>{this.props.caption}</Text>
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

Entry.propTypes = {
    id: PropTypes.number,
    name: PropTypes.string,
    caption: PropTypes.string,
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