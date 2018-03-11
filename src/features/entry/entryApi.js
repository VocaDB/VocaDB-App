import api from '../../common/api'

const entryApi = {
    search: query => api.entries.find({ query, 'fields': 'MainPicture' })
}

export default entryApi