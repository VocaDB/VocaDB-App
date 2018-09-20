import api from '../../common/api'

const songApi = {
    find: params => api.songs.find({ ...params, 'preferAccurateMatches': true, fields: 'thumbUrl', maxResults: 50   }),
    highlighted: params => api.songs.highlighted({ ...params, 'fields': 'thumbUrl,PVs' }),
    getRecentSongs: () => api.songs.find({ 'sort': 'AdditionDate', 'fields': 'thumbUrl' }),
    getPopularSongs: () => api.songs.find({ 'sort': 'AdditionDate', 'fields': 'thumbUrl' }),
    getFollowedSongs: (artistIds, params) => api.songs.find({ ...params, 'sort': 'AdditionDate', 'fields': 'thumbUrl' , 'artistId': artistIds }),
    getPopularSongsByTag: tagId => api.songs.find({ 'maxResults': 20, 'fields': 'thumbUrl' , tagId }),
    getSong: (id, params) => api.songs.get(id, { ...params, 'fields': ['ThumbUrl', 'Albums', 'Artists', 'Tags', 'WebLinks', 'PVs', 'Lyrics', 'AdditionalNames'].join(',') }),
    getTopRated: params => api.songs.topRated({ ...params, 'fields': 'MainPicture,PVs,ThumbUrl'}),
    getAltSongs: (id, params) => api.songs.derived(id, { ...params, 'fields': ['ThumbUrl', 'MainPicture', 'PVs'].join(',')  })
}

export default songApi