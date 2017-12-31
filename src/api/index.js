import request from './request'
import mockSongs from './../sample/songList'
import mockSong from './../sample/song'

const api = {
    songs: {
        find: params => request('/songs', params, mockSongs),
        get: (id, params) => request(`/songs/${id}`, params, mockSong)
    }
}

export default api;