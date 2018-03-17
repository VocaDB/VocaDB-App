import React from 'react'
import {Modal, Text, TouchableHighlight, View, Button} from 'react-native';
import PropTypes from 'prop-types'
import Page from './../../../components/Page'
import SearchBar from './../../../components/SearchBar'
import * as mockGenerator from './../../../common/helper/mockGenerator'
import ArtistList from './../ArtistList'
import { createSelector } from 'reselect';
import { selectSearchResult } from './../artistSelector'
import * as actions from './../artistActions'
import { connect } from 'react-redux'


class ArtistSelectModal extends React.Component {
    render () {
        return (
            <Modal
                animationType="slide"
                transparent={false}
                visible={this.props.modalVisible}
                onRequestClose={() => {}}>
                <Page>
                    <SearchBar
                        onLeftElementPress={() => {
                            this.props.clearSearch()
                            this.props.onBackPress()
                        }}
                        onRightElementPress={this.props.clearSearch}
                        onChangeText={text => {
                            if(text) {
                                this.props.search(text)
                            } else {
                                this.props.clearSearch()
                            }
                        }}
                    />
                    <View>
                        <ArtistList artists={this.props.artists} onPressItem={this.props.onPressItem} />
                    </View>
                </Page>

            </Modal>
        )

    }
}

ArtistSelectModal.propTypes = {
    modalVisible: PropTypes.bool,
    search: PropTypes.func,
    onBackPress: PropTypes.func,
    clearSearch: PropTypes.func,
    onPressItem: PropTypes.func
}

const mapSelectorToProps = createSelector(
    selectSearchResult(),
    (artists) => ({ artists })
)

const mapDispatchToProps = (dispatch, props) => ({
    search: query => dispatch(actions.fetchSearchArtists({ query })),
    clearSearch: () => dispatch(actions.clearSearch())
})

export default connect(mapSelectorToProps, mapDispatchToProps)(ArtistSelectModal)