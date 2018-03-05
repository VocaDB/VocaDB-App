import api from './../../api'

const entryApi = {
    search: query => api.entries.find({ query, 'fields': 'MainPicture' })
}

export default entryApi