import React from 'react'
import { Text, View } from 'react-native'
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

        const About = () => (
            <Content>
                <View style={{ padding: 4 }}>
                    <Text style={Theme.caption}>Category : {tag && tag.categoryName}</Text>
                </View>
            </Content>
        )
        return (
            <ScrollableTabView>
                {topSongs && topSongs.length && <SongRowList tabLabel='Top songs' data={topSongs} onPress={this.props.onPressSong} />}
                {topArtists && topArtists.length && <ArtistRowList tabLabel='Top artists' data={topArtists} onPressItem={this.props.onPressArtist}  />}
                {topAlbums && topAlbums.length && <AlbumGridView tabLabel='Top albums' albums={this.props.topAlbums} onPressItem={this.props.onPressAlbum} />}
                <About tabLabel='About' />
            </ScrollableTabView>
        )
    }
}

export default TagDetail