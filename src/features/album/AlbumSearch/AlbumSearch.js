import React from 'react'
import PropTypes from 'prop-types'
import { FlatList, View, StyleSheet, Text } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import CenterView from '../../../components/CenterView'
import AlbumRow from '../../album/AlbumRow'
import Theme from '../../../theme'

class AlbumSearch extends React.PureComponent {

    state = {
        filterVisible: false,
    };

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.props.fetchAlbums()
    }

    isSearchActive() {
        return (this.props.navigation.state
            && this.props.navigation.state.params
            && this.props.navigation.state.params.isSearchActive) ? this.props.navigation.state.params.isSearchActive : false;
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
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.props.fetchMoreAlbums()
                    }
                }}
                renderItem={({ item }) => renderAlbumRow(item)} />

        )
    }

    render () {

        return (
            <Page>
                <Toolbar
                    isSearchActive={this.isSearchActive()}
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Albums"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find album',
                        onChangeText: this.props.onSearch
                    }}
                />
                <View style={styles.menuContainer}>
                    <Button raised primary icon='tune' text='Filter' style={{ container: styles.filterButton }} onPress={this.props.onPressFilter} />
                </View>
                <View style={styles.resultContainer}>
                    {this.props.albums.length > 0 && this.renderList()}
                    {this.props.albums.length === 0 && <CenterView>
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

AlbumSearch.propTypes = {
    albums: PropTypes.array,
    onSearch: PropTypes.func,
    onPressAlbum: PropTypes.func
}

AlbumSearch.defaultProps = {
    albums: [],
    onSearch: text => console.log('Search ' + text),
    onPressAlbum: album => console.log('Press album')
}

export default AlbumSearch