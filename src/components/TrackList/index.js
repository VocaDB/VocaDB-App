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
                    .map(track => {

                        let song = (track.song)? track.song : {}
                        let artistString = (song.artistString)? song.artistString : ''
                        let pvServices = (song.pvServices) ? song.pvServices
                            .split(',')
                            .map(pvService => pvService.trim())
                            .filter(pvService => pvService.toLowerCase() != 'nothing'): []

                        return (
                            <Track key={track.id}
                                   name={track.name}
                                   pvServices={pvServices}
                                   artist={artistString}
                                   onPress={() => this.props.onPressItem(track) } />
                        )
                    })

                return (
                    <View key={discNumber}>
                        <Text style={[Theme.subhead, { alignSelf: 'center' }]}>Disc {discNumber}</Text>
                        {renderTrackList()}
                    </View>
                )
            })

            return (
                <View>
                    <View style={{ margin: 4}}>
                        <Text style={Theme.subhead}>Tracklist</Text>
                    </View>
                    {uniqueDiscs}
                </View>
            )

        } else {
            let renderTrackList = () => tracks.map(track => {
                let song = (track.song)? track.song : {}
                let artistString = (song.artistString)? song.artistString : ''
                let pvServices = (song.pvServices) ? song.pvServices
                    .split(',')
                    .map(pvService => pvService.trim())
                    .filter(pvService => pvService.toLowerCase() != 'nothing') : []

                return (
                    <Track key={track.id}
                           name={track.name}
                           pvServices={pvServices}
                           artist={artistString}
                           onPress={() => this.props.onPressItem(track) } />
                )
            })

            return (
                <View>
                    <View style={{ margin: 4}}>
                        <Text style={Theme.subhead}>Tracklist</Text>
                    </View>
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