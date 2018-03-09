import axios from 'axios'
import config from '../constants/config'

const axiosAPI = axios.create({
    baseURL: config.host
});

const request = (endpoint, params, mockData) => {

    console.log('endpoint : ' + endpoint)
    console.log(params)

    if(config.useMock) {
        return new Promise((resolve, reject) => setTimeout(() => resolve(mockData), 500))
    }
    return axiosAPI.get(endpoint, { params }).then(response => response.data)
}

export default request
