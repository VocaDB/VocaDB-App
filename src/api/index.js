import axios from 'axios'

const api = axios.create({
    baseURL: 'http://127.0.0.1:8080'
});

const passResponse = response => response.data

const vocadb = {
    songs: {
        list: () => api(`/songs`).then(passResponse),
        get: id => api(`/songs/${id}`).then(passResponse)
    }
}

export default vocadb
