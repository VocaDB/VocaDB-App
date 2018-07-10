import React from 'react';
import PropTypes from 'prop-types';
import { FlatList, View, StyleSheet } from 'react-native';
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page';
import AlbumRow from '../../album/AlbumRow';
import Theme from '../../../theme';
import { ListItem } from 'react-native-material-ui';
import Icon from '../../../components/Icon';
import i18n from './../../../common/i18n';

class TagSearch extends React.PureComponent {

    componentDidMount () {
        this.props.onSearchReplaceParams();
    }

    doSearch(params) {
        this.props.onSearch(params);
    }

    refresh() {
        this.props.onSearchReplaceParams();
    }

    renderList () {

        const renderAlbumRow = album => {
            return  (
                <AlbumRow
                    key={album.id}
                    image={album.image}
                    name={album.name}
                    artist={album.artistString}
                    onPress={() => this.props.onPressAlbum(album)}
                />
            )
        }

        return (
            <FlatList
                data={this.props.albums}
                keyExtractor={item => item.id}
                refreshing={this.props.loading}
                onRefresh={this.refresh.bind(this)}
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.doSearch({ start: this.props.albums.length })
                    }
                }}
                renderItem={({ item }) => renderAlbumRow(item)} />

        )
    }

    render () {
        const queryEntry = text => this.doSearch({ query: text, start: 0 })

        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Tags"
                    searchable={{
                        autoFocus: true,
                        placeholder: i18n.findTags,
                        onChangeText: queryEntry
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
                            if(this.props.tags != undefined && this.props.tags.length > 0) {
                                this.doSearch({ start: this.props.tags.length })
                            }
                        }}
                        onEndReachedThreshold={0.3}
                    />
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

TagSearch.propTypes = {
    tags: PropTypes.array,
    onSearch: PropTypes.func,
    onPressAlbum: PropTypes.func
}

TagSearch.defaultProps = {
    tags: [],
    onSearch: text => console.log('Search ' + text),
    onPressTag: tag => console.log('Press tag')
}

export default TagSearch