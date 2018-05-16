import api from '../../common/api'

const tagApi = {
    find: params => api.tags.find({ ...params, maxResults: 50, nameMatchMode: 'auto' }),
    getTag: (id, params) => api.tags.get(id, { ...params, 'fields': 'MainPicture,Description,WebLinks,RelatedTags,Parent' }),
    getLatestSongsByTag: (tagId, params) => api.songs.find({ ...params, 'maxResults': 20, 'fields': 'thumbUrl', 'sort': 'AdditionDate', 'tagId': [ tagId ] }),
    getTopSongsByTag: (tagId, params) => api.songs.find({ ...params, 'maxResults': 20, 'fields': 'thumbUrl', 'sort': 'RatingScore' , 'tagId': [ tagId ] }),
    getTopArtistsByTag: (tagId, params) => api.artists.find({ ...params, 'maxResults': 20, 'fields': 'MainPicture', 'sort': 'SongRating', 'tagId': [ tagId ] }),
    getTopAlbumsByTag: (tagId, params) => api.albums.find({ ...params, 'maxResults': 20, 'fields': 'MainPicture', 'sort': 'RatingAverage', 'tagId': [ tagId ] }),
}

export default tagApi