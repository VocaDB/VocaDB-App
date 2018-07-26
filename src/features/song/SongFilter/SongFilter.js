import React from 'react';
import { View, Text } from 'react-native';
import Content from '../../../components/Content';
import PropTypes from 'prop-types';
import Theme from '../../../theme';
import { Dropdown } from 'react-native-material-dropdown';
import { Button } from 'react-native-material-ui';
import ArtistSelectModal from './../../artist/ArtistSelectModal';
import TagSelectModal from './../../tag/TagSelectModal';
import ArtistRow from './../../artist/ArtistRow';
import Tag from './../../tag/Tag';
import { songTypeItems, songSortItems } from './../songConstant';
import { TextField } from 'react-native-material-textfield';
import i18n from './../../../common/i18n';

class SongFilter extends React.PureComponent {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false,
            showTagModal: false
        }
    }

    renderInputSongType () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label={i18n.songType}
                    value={this.props.params.songTypes}
                    onChangeText={text => {
                        if(text === 'Unspecified') {
                            this.props.onParamChanged('songTypes', '')
                        } else {
                            this.props.onParamChanged('songTypes', text)
                        }

                    }}
                    data={songTypeItems}
                    valueExtractor={item => item.value}
                    labelExtractor={item => item.label}
                />
            </View>
        )
    }

    renderInputArtists () {
        return (
            <View>
                <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>{i18n.artists}</Text>
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
                    text={i18n.selectArtist}
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
                <Text style={[Theme.subhead, { marginHorizontal: 8 }]}>{i18n.tags}</Text>
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
                    text={i18n.selectTag}
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

    renderInputMinScore () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <TextField
                    label={i18n.minimumScore}
                    keyboardType='numeric'
                    value={this.props.params.minScore}
                    maxLength={5}
                    onChangeText={minScore => {
                        this.props.onParamChanged('minScore', minScore)
                    }}
                />
            </View>
        )
    }

    renderInputSort () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label={i18n.sort}
                    value={this.props.params.sort}
                    onChangeText={text => {
                        this.props.onParamChanged('sort', text)
                    }}
                    data={songSortItems}
                    valueExtractor={item => item.value}
                    labelExtractor={item => item.label}
                />
            </View>
        )
    }

    renderClearFilter () {
        return (
            <Button raised icon='clear' text={i18n.clearFilter} style={{ container: { marginHorizontal: 16, marginVertical: 8 } }} onPress={this.props.onPressClearFilter} />
        )
    }

    render () {

        console.log(`${JSON.stringify(this.props.params)}`)
        return (
                <Content>
                    {this.renderInputSongType()}
                    {this.renderInputMinScore()}
                    {this.renderInputSort()}
                    {this.renderInputArtists()}
                    {this.renderInputTags()}
                    {this.renderClearFilter()}
                </Content>
        )
    }
}

SongFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func,
    filterTags: PropTypes.array,
    filterArtists: PropTypes.array
}

SongFilter.defaultProps = {
    filterTags: [],
    filterArtists: []
}
export default SongFilter;