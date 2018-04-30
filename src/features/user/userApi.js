import api from '../../common/api'

const userApi = {
    signIn: (username, password) => api.users.signIn(username, password),
    albums: (id, params) => api.users.albums(id, { ...params, fields: 'MainPicture' })
}

export default userApi