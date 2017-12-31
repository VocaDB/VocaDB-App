import axios from 'axios'
import config from './../constants/config'

const axiosAPI = axios.create({
    baseURL: config.host
});

const request = (endpoint, params, mockData) => {
    if(config.useMock) {
        return new Promise((resolve, reject) => setTimeout(() => resolve(mockData), 3000))
    }
    return axiosAPI.get(endpoint).then(response => response.data)
}

export default request
