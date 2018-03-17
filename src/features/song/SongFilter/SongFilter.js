import React from 'react'
import { View, Text, TextInput, Picker, Modal } from 'react-native'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';
import { ListItem, Button } from 'react-native-material-ui';
import ArtistSelectModal from './../../artist/ArtistSelectModal'
import ArtistList from './../../artist/ArtistList'

class SongFilter extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false
        }
    }

    render () {

        const removeArtistItem = artist => {
            this.setState({ artists: this.state.artists.filter(a => a.id != artist.id) })
        }

        const createArtistItem = artist => (
            <ListItem
                key={artist.id}
                centerElement={{
                    primaryText: artist.defaultName,
                }}
                rightElement='clear'
                onRightElementPress={() => removeArtistItem(artist)}
            />
        )

        return (
                <Content>
                    <View style={{ marginHorizontal: 8 }}>
                        <Dropdown
                            label='Song type'
                            value={this.props.params.songTypes}
                            onChangeText={text => {
                                if(text === 'Unspecified') {
                                    this.props.onFilterChanged({ songTypes: '' })
                                } else {
                                    this.props.onFilterChanged({ songTypes: text })
                                }

                            }}
                            data={[
                                {
                                    value: 'Unspecified'
                                },
                                {
                                    value: 'Original'
                                },
                                {
                                    value: 'Remaster'
                                },
                                {
                                    value: 'Remix'
                                },
                                {
                                    value: 'Cover'
                                },
                                {
                                    value: 'Instrumental'
                                },
                                {
                                    value: 'Mashup'
                                },
                                {
                                    value: 'MusicPV'
                                },
                                {
                                    value: 'DramaTV'
                                },
                                {
                                    value: 'Other'
                                }
                            ]}
                        />
                    </View>
                    <View>
                        <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>Artist</Text>
                        <View>
                            <ArtistList artists={this.props.filterArtists} />
                        </View>
                        <Button
                            raised
                            primary
                            style={{ container: { marginHorizontal: 16, marginVertical: 8 } }}
                            text='Select artist'
                            onPress={() => { this.setState({ showArtistModal: true }) }} />
                    </View>

                    <ArtistSelectModal
                        modalVisible={this.state.showArtistModal}
                        onBackPress={() => {
                            this.setState({ showArtistModal: false })
                        }}
                        onPressItem={artist => {
                            this.setState({ showArtistModal: false })
                            this.props.onFilterChanged({ artistId: [ artist.id ] })
                        }} />
                </Content>

        )
    }
}

SongFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func

}

export default SongFilter;