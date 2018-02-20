import React from 'react'
import { View, Text, Button } from 'react-native'
import Lyric from './../Lyric'
import PropTypes from 'prop-types'

class LyricGroup extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            selectedIndex: 0
        };
    }

    render () {

        const displayLyric = this.props.lyrics[this.state.selectedIndex]
        const translateGroup = this.props.lyrics.map((lyric, index) => {
            return (
                <Button key={lyric.id}
                        title={lyric.translationType}
                        color={(this.state.selectedIndex==index) ? '#1976D2' : '#78909C'}
                        onPress={() => this.setState(previousState => ({ selectedIndex: index }))} />
            )
        })

        return (<View>
            <View style={{ flexDirection: 'row', justifyContent: 'space-around' }}>
                {translateGroup}
            </View>
            <View style={{ padding: 8 }}>
                <Lyric content={displayLyric.value} />
            </View>
        </View>)
    }
}

LyricGroup.propTypes = {
    lyrics: PropTypes.arrayOf(PropTypes.object)
}

export default LyricGroup