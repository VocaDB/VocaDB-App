import React from 'react'
import Content from './../../components/Content'
import SongList from './../../modules/song/SongList'
import ArtistList from './../../modules/artist/ArtistList'
import AlbumList from './../../modules/album/AlbumList'

class TagDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            const tagId = params.id
            this.props.fetchTag(tagId)
            this.props.fetchTopSongs(tagId)
            this.props.fetchTopArtists(tagId)
            this.props.fetchTopAlbums(tagId)
        }
    }


    render () {
        return (
            <Content>
                {this.props.topSongs.length > 0 && <SongList max={5} title='Top songs' songs={this.props.topSongs} showHeader={true} onPressItem={this.props.onPressSong} />}
                {this.props.topArtists.length > 0 && <ArtistList max={5} title='Top artists' artists={this.props.topArtists} showHeader={true} onPressItem={this.props.onPressArtist} />}
                {this.props.topAlbums.length > 0 && <AlbumList max={5} title='Top albums' albums={this.props.topAlbums} showHeader={true} onPressItem={this.props.onPressAlbum} />}
            </Content>
        )
    }
}

export default TagDetailPage