import React from 'react'
import { View, Text } from 'react-native'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';
import { Button } from 'react-native-material-ui';
import ArtistSelectModal from './../../artist/ArtistSelectModal'
import ArtistList from './../../artist/ArtistList'
import Tag from './../../tag/Tag'
import { topTags } from './../../tag/tagConstant'

class SongFilter extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false
        }
    }

    render () {

        const filterParams = this.props.params

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

                    <View>
                        <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>Tags</Text>
                        <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                            {topTags.map(t => {
                                const selected = filterParams.tagId.indexOf(t.id) >= 0
                                return <Tag
                                    key={t.id}
                                    name={t.name}
                                    style={{ margin: 4 }}
                                    selected={selected}
                                    onPress={() => {
                                        this.props.onFilterChanged({ tagId: [ t.id ] }, selected)
                                    }} />
                            })}
                        </View>
                    </View>
                </Content>

        )
    }
}

SongFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func

}

export default SongFilter;