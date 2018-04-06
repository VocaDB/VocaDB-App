import React from 'react'
import {Modal, Text, TouchableHighlight, View, FlatList} from 'react-native';
import PropTypes from 'prop-types'
import Page from './../../../components/Page'
import SearchBar from './../../../components/SearchBar'
import { createSelector } from 'reselect';
import { selectSearchResult } from './../tagSelector'
import * as actions from './../tagActions'
import { connect } from 'react-redux'
import { ListItem } from 'react-native-material-ui';


class TagSelectModal extends React.Component {
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
                        <FlatList
                            data={this.props.tags}
                            keyExtractor={item => item.id}
                            renderItem={({ item }) => <ListItem
                                centerElement={{
                                    primaryText: item.name,
                                }}
                                onPress={() => this.props.onPressItem(item)}
                            />}
                        />
                    </View>
                </Page>

            </Modal>
        )

    }
}

TagSelectModal.propTypes = {
    modalVisible: PropTypes.bool,
    search: PropTypes.func,
    onBackPress: PropTypes.func,
    clearSearch: PropTypes.func,
    onPressItem: PropTypes.func
}

const mapSelectorToProps = createSelector(
    selectSearchResult(),
    (tags) => ({ tags })
)

const mapDispatchToProps = (dispatch, props) => ({
    search: query => dispatch(actions.searchTags({ query })),
    clearSearch: () => dispatch(actions.clearSearch())
})

export default connect(mapSelectorToProps, mapDispatchToProps)(TagSelectModal)