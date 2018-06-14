import React from 'react'
import { View, Text } from 'react-native'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';
import { Button } from 'react-native-material-ui';
import ArtistSelectModal from './../../artist/ArtistSelectModal'
import TagSelectModal from './../../tag/TagSelectModal'
import ArtistRow from './../../artist/ArtistRow'
import Tag from './../../tag/Tag'
import { discTypes, sortItems } from './../albumConstant'
import { filterField } from '../albumConstant'

class AlbumFilter extends React.PureComponent {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false,
            showTagModal: false
        }
    }

    renderInputDiscType () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Disc type'
                    value={this.props.params.discTypes}
                    onChangeText={text => {
                        if(text === 'Unspecified') {
                            this.props.onParamChanged(filterField.discTypes, '')
                        } else {
                            this.props.onParamChanged(filterField.discTypes, text)
                        }
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
                            image={a.image}
                            name={a.name}
                            rightIcon='ios-close'
                            onRightElementPress={() => this.props.onRemoveArtist(a)} />)}
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
                        this.props.onAddArtist(artist)
                    }} />
            </View>
        )
    }

    renderInputTags () {
        return (
            <View>
                <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>Tags</Text>
                <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                    {this.props.filterTags.map(t => {
                        return <Tag
                            showRemoveButton
                            key={t.id}
                            name={t.name}
                            style={{ margin: 4 }}
                            selected={t.selected}
                            onRemovePress={() => this.props.onRemoveFilterTag(t)} />
                    })}
                </View>
                <Button
                    raised
                    primary
                    style={{ container: { marginHorizontal: 16, marginVertical: 8 } }}
                    text='Select tag'
                    onPress={() => { this.setState({ showTagModal: true }) }} />
                <TagSelectModal
                    modalVisible={this.state.showTagModal}
                    onBackPress={() => {
                        this.setState({ showTagModal: false })
                    }}
                    onPressItem={tag => {
                        this.setState({ showTagModal: false })
                        this.props.onAddFilterTag(tag)
                    }} />
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
                        this.props.onParamChanged(filterField.sort, text)
                    }}
                    data={sortItems}
                />
            </View>
        )
    }

    render () {
        return (
            <Content>
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