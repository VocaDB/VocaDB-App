import api from '../../common/api'

const releaseEventApi = {
    getRecentReleaseEvents: () => api.events.find({ 'sort': 'AdditionDate', 'fields': 'MainPicture' }),
    getReleaseEvent: id => api.events.get(id)
}

export default releaseEventApi