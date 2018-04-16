import api from '../../common/api'

const userApi = {
    signIn: (username, password) => api.users.signIn(username, password),
}

export default userApi