import api from '../../common/api'

const tagApi = {
    getTag: id => api.tags.get(id),
    getTopSongsByTag: tagId => api.songs.find({ 'maxResults': 20, 'fields': 'thumbUrl' , tagId }),
    getTopArtistsByTag: tagId => api.artists.find({ 'maxResults': 20, 'fields': 'MainPicture' , tagId }),
    getTopAlbumsByTag: tagId => api.albums.find({ 'maxResults': 20, 'fields': 'MainPicture' , tagId }),
}

export default tagApi