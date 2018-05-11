import api from '../../common/api'

const albumApi = {
    find: params => api.albums.find({ ...params, 'preferAccurateMatches': true }),
    getRecentAlbums: params => api.albums.newAlbum(params),
    getTopAlbums: params => api.albums.top(params),
    getAlbum: (id, params) => api.albums.get(id, { ...params, fields: 'artists,pvs,tags,tracks,webLinks' })
}

export default albumApi