import api from '../../common/api'

const albumApi = {
    find: params => api.albums.find({ ...params, 'preferAccurateMatches': true }),
    getRecentAlbums: params => api.albums.newAlbum({ ...params, fields: 'MainPicture'}),
    getTopAlbums: params => api.albums.top({ ...params, fields: 'MainPicture'}),
    getAlbum: (id, params) => api.albums.get(id, { ...params, fields: 'artists,pvs,tags,tracks,webLinks,AdditionalNames,description,MainPicture' })
}

export default albumApi