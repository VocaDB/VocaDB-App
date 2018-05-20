import React from 'react'
import {Modal, Text, TouchableHighlight, View, FlatList} from 'react-native';
import PropTypes from 'prop-types'
import Page from './../../../components/Page'
import SearchBar from './../../../components/SearchBar'
import { createSelector } from 'reselect';
import { selectSearchResult } from './../tagSelector'
import { selectLoading } from './../../../app/appSelector'
import * as actions from './../tagActions'
import { connect } from 'react-redux'
import { ListItem } from 'react-native-material-ui';
import Icon from '../../../components/Icon'

class TagSelectModal extends React.Component {

    state =  {
        query: ''
    }

    constructor(props) {
        super(props);
    }

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
                                this.setState({ query: text })
                                this.props.search(text)
                            } else {
                                this.setState({ query: '' })
                                this.props.clearSearch()
                            }
                        }}
                    />
                    <View>
                        <FlatList
                            data={this.props.tags}
                            keyExtractor={item => item.id}
                            renderItem={({ item }) => <ListItem
                                leftElement={<Icon name='ios-pricetag' pureIcon />}
                                centerElement={{
                                    primaryText: item.name,
                                }}
                                onPress={() => this.props.onPressItem(item)}
                            />}
                            onEndReached={() => {
                                if(this.props.tags.length > 20) {
                                    this.props.onLoadMore(this.state.query, this.props.tags.length)
                                }
                            }}
                            onEndReachedThreshold={0.3}
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
    selectLoading(),
    (tags, loading) => ({ tags, loading })
)

const mapDispatchToProps = (dispatch, props) => ({
    search: query => dispatch(actions.searchTags({ query, start: 0 })),
    clearSearch: () => dispatch(actions.clearSearch()),
    onLoadMore: (query, start) => dispatch(actions.searchTags({ query, start })),
})

export default connect(mapSelectorToProps, mapDispatchToProps)(TagSelectModal)