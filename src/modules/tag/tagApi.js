import api from './../../api'

const tagApi = {
    getTag: id => api.tags.get(id)
}

export default tagApi