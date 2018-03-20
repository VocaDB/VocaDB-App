import api from '../../common/api'

const albumApi = {
    getRecentAlbums: () => api.albums.newAlbum(),
    getAlbum: id => api.albums.get(id, { fields: 'artists,pvs,tags,tracks,webLinks' })
}

export default albumApi