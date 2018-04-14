import api from '../../common/api'

const artistApi = {
    find: params => api.artists.find({ ...params, 'preferAccurateMatches': true }),
    getArtist: id => api.artists.get(id, { fields: 'Description,Tags,WebLinks', relations: 'All' })
}

export default artistApi