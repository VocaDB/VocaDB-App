import React from 'react';
import { View, Text, Modal, StyleSheet } from 'react-native';
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page/index';
import CenterView from '../../../components/CenterView/index';
import SongList from '../SongList/index';
import Theme from '../../../theme';
import i18n from './../../../common/i18n';

export default class SongSearch extends React.PureComponent {

    state = {
        filterVisible: false,
    };

    constructor(props) {
        super(props);
    }

    componentDidMount () {
        this.props.fetchSongs();
    }

    getNavigationParams() {
        return (this.props.navigation.state && this.props.navigation.state.params)? this.props.navigation.state.params : {};
    }

    isSearchActive() {
        return (this.props.navigation.state
            && this.props.navigation.state.params
            && this.props.navigation.state.params.isSearchActive) ? this.props.navigation.state.params.isSearchActive : false;
    }

    renderList () {

        return (
            <SongList
                flatList
                showHeader={false}
                songs={this.props.songs}
                onPressItem={this.props.onPressSong}
                refreshing={this.props.loading}
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.props.fetchMoreSongs()
                    }
                }}
                hideMoreButton={true} />

        )
    }

    render () {
        const params = this.getNavigationParams();

        const renderSearchBar = () => {
            if(params.hideSearchBar) {
                return null;
            }

            return (
                <Toolbar
                    isSearchActive={this.isSearchActive()}
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement={i18n.songs}
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find song',
                        onChangeText: this.props.onSearch
                    }}
                />
            )
        }

        const renderFilterButton = () => {
            if(params.hideSearchBar) {
                return null;
            }

            return (
                <View style={styles.menuContainer}>
                    <Button raised primary icon='tune' text={i18n.filter} style={{ container: styles.filterButton }} onPress={this.props.onPressFilter} />
                </View>
            )
        }

        return (
            <Page>
                {renderSearchBar()}
                {renderFilterButton()}
                <View style={styles.resultContainer}>
                    {this.props.songs.length > 0 && this.renderList()}
                    {this.props.songs.length === 0 && <CenterView>
                        <Text>No result</Text>
                    </CenterView>}

                </View>
            </Page>
        )
    }
}

const styles = StyleSheet.create({
    menuContainer: {
        alignItems: 'center',
        backgroundColor: 'white'
    },
    filterButton: {
        margin: 8,
        width: 128
    },
    resultContainer: {
        flex: 1,
        backgroundColor: Theme.contentBackgroundColor,
        paddingBottom: 8
    }
})

SongSearch.defaultProps = {
    songs: [],
}