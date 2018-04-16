import axios from 'axios'
import config from '../constants/config'
import cache from 'memory-cache'
import hash from 'object-hash'
import { AsyncStorage } from 'react-native'
import { authKey } from './../constants/storageKey'

const axiosAPI = axios.create({
    baseURL: config.host
});

const toMinute = (ms) => ms * 60000
const enableCache = false;

const request = async function(endpoint, params, mockData) {
    if(config.useMock) {
        return new Promise((resolve, reject) => setTimeout(() => resolve(mockData), 500))
    }

    // TODO Attach token to every request
    const token = await AsyncStorage.getItem(authKey.token);

    const requestHash = hash({ e: endpoint, p: params })
    const responseCache = cache.get(requestHash)

    if(responseCache) {
       return responseCache;
    }

    return axiosAPI.get(endpoint, { params })
        .then(response => {
            cache.put(requestHash, response.data, toMinute(5))
            return response.data
        })
        .catch(error => console.log(error))
}

export default request
