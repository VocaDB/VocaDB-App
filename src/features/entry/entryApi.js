import api from '../../common/api'

const entryApi = {
    search: query => api.entries.find({ query, 'fields': 'MainPicture', 'nameMatchMode': 'auto' })
}

export default entryApi