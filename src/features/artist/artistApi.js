import api from '../../common/api'

const artistApi = {
    find: params => api.artists.find({ ...params, 'preferAccurateMatches': true, maxResults: 50 }),
    getArtist: (id, params) => api.artists.get(id, { ...params, fields: 'MainPicture,Description,Tags,WebLinks,AdditionalNames,BaseVoicebank,ArtistLinks,ArtistLinksReverse', relations: 'All' })
}

export default artistApi