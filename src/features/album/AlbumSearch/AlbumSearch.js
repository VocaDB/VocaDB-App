import React from 'react'
import PropTypes from 'prop-types'
import { FlatList, View, StyleSheet, Text } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page'
import CenterView from '../../../components/CenterView'
import AlbumRow from '../../album/AlbumRow'
import Theme from '../../../theme'

class AlbumSearch extends React.PureComponent {

    componentDidMount () {
        this.props.onSearchReplaceParams()
    }

    doSearch(params) {
        this.props.onSearch(params)
    }

    refresh() {
        this.props.onSearchReplaceParams()
    }

    renderList () {

        const renderAlbumRow = album => {
            const thumbUrl = (album.mainPicture) ? album.mainPicture.urlThumb : undefined
            return  (
                <AlbumRow
                    key={album.id}
                    image={thumbUrl}
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
                    centerElement="Albums"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find album',
                        onChangeText: queryEntry
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