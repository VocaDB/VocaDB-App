import api from '../../common/api'

const artistApi = {
    find: params => api.artists.find({ ...params, 'preferAccurateMatches': true }),
    getArtist: (id, params) => api.artists.get(id, { ...params, fields: 'Description,Tags,WebLinks', relations: 'All' })
}

export default artistApi