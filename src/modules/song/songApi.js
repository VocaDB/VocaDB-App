import api from './../../api'

const songApi = {
    getRecentSongs: () => api.songs.find({ 'sort': 'AdditionDate', 'fields': 'thumbUrl' }),
    getPopularSongs: () => api.songs.find({ 'sort': 'AdditionDate', 'fields': 'thumbUrl' }),
    getFollowedSongs: artistIds => api.songs.find({ 'sort': 'AdditionDate', 'fields': 'thumbUrl' , 'artistId': artistIds }),
    getSong: id => api.songs.get(id, { 'field': 'Lyrics' })
}

export default songApi