import React from 'react'
import { View, Text } from 'react-native'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';
import { Button } from 'react-native-material-ui';
import ArtistSelectModal from './../../artist/ArtistSelectModal'
import ArtistRow from './../../artist/ArtistRow'
import Tag from './../../tag/Tag'
import { topGenres } from './../../tag/tagConstant'
import { discTypes, sortItems } from './../albumConstant'
import { entryStatusItems } from './../../entry/entryConstant'

class AlbumFilter extends React.PureComponent {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false
        }
    }

    renderInputDiscType () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Disc type'
                    value={this.props.params.discTypes}
                    onChangeText={text => {
                        this.props.onFilterChanged({ discTypes: text })
                    }}
                    data={discTypes}
                />
            </View>
        )
    }

    renderInputArtists () {
        return (
            <View>
                <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>Artist</Text>
                <View>
                    {this.props.filterArtists.map(a =>
                        <ArtistRow
                            key={a.id}
                            id={a.id}
                            name={a.defaultName}
                            rightIcon='ios-close'
                            onRightElementPress={() => this.props.onFilterChanged({ artistId: [ a.id ] }, true)} />)}
                </View>
                <Button
                    raised
                    primary
                    style={{ container: { marginHorizontal: 16, marginVertical: 8 } }}
                    text='Select artist'
                    onPress={() => { this.setState({ showArtistModal: true }) }} />

                <ArtistSelectModal
                    modalVisible={this.state.showArtistModal}
                    onBackPress={() => {
                        this.setState({ showArtistModal: false })
                    }}
                    onPressItem={artist => {
                        this.setState({ showArtistModal: false })
                        this.props.onFilterChanged({ artistId: [ artist.id ] })
                    }} />
            </View>
        )
    }

    renderInputTags () {
        return (
            <View>
                <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>Tags</Text>
                <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                    {topGenres.map(t => {
                        const selected = (this.props.params.tagId) ? this.props.params.tagId.indexOf(t.id) >= 0 : false;
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
        )
    }

    renderInputStatus () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Status'
                    value={this.props.params.status}
                    onChangeText={text => {
                        this.props.onFilterChanged({ status: text })
                    }}
                    data={entryStatusItems}
                />
            </View>
        )
    }

    renderInputSort () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Sort'
                    value={this.props.params.sort}
                    onChangeText={text => {
                        this.props.onFilterChanged({ sort: text })
                    }}
                    data={sortItems}
                />
            </View>
        )
    }

    render () {
        return (
            <Content>
                {this.renderInputStatus()}
                {this.renderInputDiscType()}
                {this.renderInputSort()}
                {this.renderInputArtists()}
                {this.renderInputTags()}
            </Content>
        )
    }
}

AlbumFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func
}

export default AlbumFilter;