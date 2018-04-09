import api from '../../common/api'

const tagApi = {
    find: params => api.tags.find({ ...params, maxResults: 50, nameMatchMode: 'auto' }),
    getTag: id => api.tags.get(id, { 'fields': 'MainPicture,Description,WebLinks,RelatedTags' }),
    getLatestSongsByTag: tagId => api.songs.find({ 'maxResults': 20, 'fields': 'thumbUrl', 'sort': 'AdditionDate', 'tagId': [ tagId ] }),
    getTopSongsByTag: tagId => api.songs.find({ 'maxResults': 20, 'fields': 'thumbUrl', 'sort': 'RatingScore' , 'tagId': [ tagId ] }),
    getTopArtistsByTag: tagId => api.artists.find({ 'maxResults': 20, 'fields': 'MainPicture', 'sort': 'SongRating', 'tagId': [ tagId ] }),
    getTopAlbumsByTag: tagId => api.albums.find({ 'maxResults': 20, 'fields': 'MainPicture', 'sort': 'RatingAverage', 'tagId': [ tagId ] }),
}

export default tagApi