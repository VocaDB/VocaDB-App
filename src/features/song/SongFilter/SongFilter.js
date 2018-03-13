import React from 'react'
import { View, Text, TextInput, Picker } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import Content from '../../../components/Content'
import PropTypes from 'prop-types'
import merge from "lodash/merge";
import Theme from '../../../theme'
import { Dropdown } from 'react-native-material-dropdown';

class SongFilter extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            songType: 'Unspecified',
        }
    }

    render () {
        return (
            <Page>
                <Toolbar
                    leftElement="clear"
                    onLeftElementPress={this.props.onPressBack}
                    centerElement="Filter"
                    rightElement="done"
                    onRightElementPress={() => this.props.onPressSave(merge({}, this.state))}
                />
                <Content>
                    <View style={{ marginHorizontal: 8 }}>
                        <Dropdown
                            label='Song type'
                            value={this.state.songType}
                            onChangeText={text => this.setState({ songType: text })}
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
                </Content>
            </Page>
        )
    }
}

SongFilter.propTypes = {
    onPressSave: PropTypes.func,
    onPressBack: PropTypes.func

}

export default SongFilter;