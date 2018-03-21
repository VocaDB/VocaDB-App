import api from '../../common/api'
import { dateAfterToday, yesterday } from './../../common/utilities/dateUtils'

const releaseEventApi = {
    find: params => api.events.find(params),
    getRecentReleaseEvents: () => api.events.find({
        'sort': 'Date',
        'fields': 'MainPicture',
        'afterDate': yesterday(),
        'beforeDate': dateAfterToday(30)
    }),
    getReleaseEvent: id => api.events.get(id)
}

export default releaseEventApi