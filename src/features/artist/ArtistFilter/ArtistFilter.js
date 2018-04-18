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

class ArtistFilter extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            showArtistModal: false
        }
    }

    renderInputArtistType () {
        return (
            <View style={{ marginHorizontal: 8 }}>
                <Dropdown
                    label='Artist type'
                    value={this.props.params.artistTypes}
                    onChangeText={text => {
                        this.props.onFilterChanged({ artistTypes: text })
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