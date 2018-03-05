import api from './../../api'

const artistApi = {
    getArtist: id => api.artists.get(id)
}

export default artistApi