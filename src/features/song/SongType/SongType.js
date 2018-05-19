import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import { songTypeName } from './../songConstant'

const SongTypeText = props => (
    <View style={{ backgroundColor: props.backgroundColor, paddingHorizontal: 4 }}>
        <Text style={{ color: props.color, fontWeight: 'bold', alignSelf: 'center' }}>{props.text}</Text>
    </View>
)

class SongType extends React.PureComponent {
    render () {
        const SongTypeElement = songTypeElement[this.props.type.toLowerCase()]
        return (SongTypeElement)? SongTypeElement : null;
    }
}

const songTypeElement = {
    original: (<SongTypeText backgroundColor='#3a87ad' color='white' text='O' />),
    remaster: (<SongTypeText backgroundColor='#3a87ad' color='white' text='R' />),
    remix: (<SongTypeText backgroundColor='#999' color='white' text='R' />),
    cover: (<SongTypeText backgroundColor='#999' color='white' text='C' />),
    instrumental: (<SongTypeText backgroundColor='black' color='white' text='I' />),
    mashup: (<SongTypeText backgroundColor='#999' color='white' text='M' />),
    musicpv: (<SongTypeText backgroundColor='#468847' color='white' text='PV' />),
    dramapv: (<SongTypeText backgroundColor='#468847' color='white' text='D' />),
    other: (<SongTypeText backgroundColor='#999' color='white' text='O' />)
}

SongType.propTypes = {
    type: PropTypes.string
}

SongType.defaultProps = {
    type: songTypeName.other
}

export default SongType;