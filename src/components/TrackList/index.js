import React from 'react'
import { View, Text, TouchableOpacity, SectionList } from 'react-native'
import PropTypes from 'prop-types'
import Track from './../../components/Track'
import Theme from './../../theme'

class TrackList extends React.Component {
    render () {
        const tracks = this.props.tracks
        const isMultipleDisc = tracks.find(track => track.discNumber > 1)

        if(isMultipleDisc) {
            let uniqueDiscs = tracks
                .map(track => track.discNumber)
                .filter((v, i, a) => a.indexOf(v) === i)

            uniqueDiscs = uniqueDiscs.map(discNumber => {

                let renderTrackList = () => tracks
                    .filter(track => track.discNumber === discNumber)
                    .map(track => <Track key={track.id} name={track.name} artist={track.song.artistString} />)

                return (
                    <View key={discNumber}>
                        <Text style={Theme.subhead}>Disc {discNumber}</Text>
                        {renderTrackList()}
                    </View>
                )
            })

            return (
                <View>
                    {uniqueDiscs}
                </View>
            )

        } else {
            let renderTrackList = () => tracks.map(track => <Track key={track.id} name={track.name} artist={track.song.artistString} />)

            return (
                <View>
                    {renderTrackList()}
                </View>
            )
        }



    }
}

TrackList.propTypes = {
    tracks: PropTypes.array,
    onPressItem: PropTypes.func
}

TrackList.defaultProps = {
    tracks: [],
    onPressItem: () => console.log('No action')
}

export default TrackList;