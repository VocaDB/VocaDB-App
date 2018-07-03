import React from 'react'
import { View, Text } from 'react-native'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';
import Tag from './../../tag/Tag'
import { topGenres } from './../../tag/tagConstant'
import { artistTypes, sortItems } from './../artistConstant'
import { entryStatusItems } from './../../entry/entryConstant'
import { filterField } from './../artistConstant'
import TagSelectModal from './../../tag/TagSelectModal'
import { Button } from 'react-native-material-ui';

class ArtistFilter extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false,
            showTagModal: false
        }
    }

    renderInputArtistType () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Artist type'
                    value={this.props.params.artistTypes}
                    onChangeText={text => {
                        if(text === 'Unspecified') {
                            this.props.onParamChanged(filterField.artistTypes, '')
                        } else {
                            this.props.onParamChanged(filterField.artistTypes, text)
                        }
                    }}
                    data={artistTypes}
                />
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
                {this.renderInputArtistType()}
                {this.renderInputSort()}
                {this.renderInputTags()}
            </Content>
        )
    }
}

ArtistFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func
}

export default ArtistFilter;