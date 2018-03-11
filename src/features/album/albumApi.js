import api from '../../common/api'

const albumApi = {
    getRecentAlbums: () => api.albums.find({ 'sort': 'AdditionDate' }),
    getAlbum: id => api.albums.get(id)
}

export default albumApi