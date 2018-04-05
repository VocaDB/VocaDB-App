import React from 'react'
import Content from '../../../components/Content/index'
import SongList from '../../song/SongList/index'
import ArtistList from '../../artist/ArtistList/index'
import AlbumList from '../../album/AlbumList/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { SongRowList } from './../../song/songHOC'

class TagDetail extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            const tagId = params.id
            this.props.fetchTag(tagId)
            this.props.fetchTopSongs(tagId)
            this.props.fetchTopArtists(tagId)
            this.props.fetchTopAlbums(tagId)
            this.props.fetchLatestSongs()
        }
    }


    render () {

        const InfoPage = () => (
            <Content>
                {this.props.topSongs.length > 0 && <SongList max={5} title='Top songs' songs={this.props.topSongs} showHeader={true} onPressItem={this.props.onPressSong} />}
                {this.props.topArtists.length > 0 && <ArtistList max={5} title='Top artists' artists={this.props.topArtists} showHeader={true} onPressItem={this.props.onPressArtist} />}
                {this.props.topAlbums.length > 0 && <AlbumList max={5} title='Top albums' albums={this.props.topAlbums} showHeader={true} onPressItem={this.props.onPressAlbum} />}
            </Content>
        )
        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                <SongRowList tabLabel='Songs' data={this.props.latestSongs} onPress={this.props.onPressSong} />
            </ScrollableTabView>
        )
    }
}

export default TagDetail