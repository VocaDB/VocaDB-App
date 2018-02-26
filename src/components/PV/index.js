import React from 'react'
import { View, Text, TouchableOpacity, Linking, Image } from 'react-native'
import PropTypes from 'prop-types'
import Icon from './../../components/Icon'
import IconSites from './../../assets/iconSites'
import images from './../../assets/images'

class PV extends React.Component {
    render () {

        const renderPVIcon = () => {

            const iconSources = {
                'Youtube': images.iconYoutube,
                'Soundcloud': images.iconSoundcloud,
                'NicoNicoDouga': images.iconNicoNicoDouga
            }

            if(IconSites.find(this.props.service)) {
                return (
                    <Icon name={this.props.service} site />
                )
            } else {
                return (
                    <Icon name='ios-film' size='medium'  />
                )
            }
        }

        const PVThumbnail = () => (<Image style={{ width: 120, height: 60 }} source={{ url: this.props.thumbUrl }} />)
        return (
            <TouchableOpacity style={{ padding: 4, flexDirection: 'row', backgroundColor: 'white' }}
                              onPress={() => Linking.openURL(this.props.url).catch(err => console.error('An error occurred', err))}>

                <View style={{ flex: 1, flexDirection: 'row' }}>
                    <View style={{ justifyContent: 'center', marginHorizontal: 8 }}>
                        {this.props.thumbnail && <PVThumbnail/>}
                        {this.props.icon && renderPVIcon()}
                    </View>
                    <View style={{ flex: 1, justifyContent: 'center', padding: 4 }}>
                        <Text numberOfLines={1}>{this.props.name}</Text>
                        <Text style={{ fontSize: 12, color: '#546E7A' }}>{this.props.service}</Text>
                    </View>
                </View>

            </TouchableOpacity>
        )
    }
}

PV.propTypes = {
    name: PropTypes.string,
    type: PropTypes.string,
    length: PropTypes.number,
    url: PropTypes.string,
    service: PropTypes.string,
    icon: PropTypes.bool,
    thumbnailUrl: PropTypes.string,
    thumbnail: PropTypes.bool
}

PV.defaultProps = {

}

export default PV