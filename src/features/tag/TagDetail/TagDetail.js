import React from 'react'
import { Text, View, ActivityIndicator } from 'react-native'
import Content from '../../../components/Content/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { SongRowList } from './../../song/songHOC'
import { ArtistRowList } from './../../artist/artistHOC'
import AlbumGridView from './../../album/AlbumGridView'
import ArtistList from './../../artist/ArtistList'
import WebLinkList from '../../webLink/WebLinkList'
import Theme from '../../../theme'

class TagDetail extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            const tagId = params.id
            this.props.fetchTag(tagId)
        }
    }

    render () {

        const { tag, topSongs, topArtists, topAlbums } = this.props;

        if(!topSongs.length && !topArtists.length && !topAlbums.length) {
            return (
                <View style={{ flex: 1 }}>
                    <ActivityIndicator size="large" color="#0000ff" />
                </View>
            )
        }

        const About = () => (
            <Content>
                <View style={{ padding: 4 }}>
                    <Text style={Theme.caption}>Category : {tag && tag.categoryName}</Text>
                </View>
            </Content>
        )

        const renderTopSongs = () => {
            if(topSongs && topSongs.length) {
                return (<SongRowList tabLabel='Top songs' data={topSongs} onPressItem={this.props.onPressSong} />)
            }

            return null;
        }

        const renderTopArtists = () => {
            if(topArtists && topArtists.length) {
                return (<ArtistRowList tabLabel='Top artists' data={topArtists} onPressItem={this.props.onPressArtist}  />)
            }

            return null;
        }

        const renderTopAlbums = () => {
            if(topAlbums && topAlbums.length) {
                return (<AlbumGridView tabLabel='Top albums' albums={this.props.topAlbums} onPressItem={this.props.onPressAlbum} />)
            }

            return null;
        }

        return (
            <ScrollableTabView>
                {renderTopSongs()}
                {renderTopArtists()}
                {renderTopAlbums()}
                <About tabLabel='About' />
            </ScrollableTabView>
        )
    }
}

export default TagDetail