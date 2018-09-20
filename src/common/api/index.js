import request from './request'
import mockSongs from '../sample/songList'
import mockSong from '../sample/song'
import mockAlbums from '../sample/albums'
import mockAlbum from '../sample/album'
import mockArtst from '../sample/artist'
import mockEvents from '../sample/events'
import mockEvent from '../sample/event'
import mockEntries from '../sample/entries'
import mockTag from '../sample/tag'
import { AsyncStorage } from 'react-native'

const api = {
    songs: {
        highlighted: params => request('/songs/highlighted', params, mockSong),
        topRated: params => request('/songs/top-rated', params, mockSongs),
        find: params => request('/songs', params, mockSongs),
        get: (id, params) => request(`/songs/${id}`, params, mockSong),
        derived: (id, params) => request(`/songs/${id}/derived`, params, mockSongs),
        related: (id, params) => request(`/songs/${id}/related`, params, {})
    },
    albums: {
        newAlbum: params => request('/albums/new', params, mockAlbums),
        top: params => request('/albums/top', params, mockAlbums),
        find: params => request('/albums', params, mockAlbums),
        get: (id, params) => request(`/albums/${id}`, params, mockAlbum)
    },
    artists: {
        find: params => request('/artists', params, {}),
        get: (id, params) => request(`/artists/${id}`, params, mockArtst)
    },
    events: {
        find: params => request('/releaseEvents', params, mockEvents),
        get: (id, params) => request(`/releaseEvents/${id}`, params, mockEvent),
        getPublishedSongs: (id, params) => request(`/releaseEvents/${id}/published-songs`, params, mockSong),
        getAlbums: (id, params) => request(`/releaseEvents/${id}/albums`, params, mockAlbum),
    },
    entries: {
        find: params => request('/entries', params, mockEntries)
    },
    tags: {
        find: params => request(`/tags`, params),
        get: (id, params) => request(`/tags/${id}`, params, mockTag)
    },
    users: {
        // Mock auth response
        signIn: (username, password) => {
            return new Promise((resolve, reject) => setTimeout(() => resolve({ token: 'abc'}), 3000))
        },
        albums: (id, params) => request(`/users/${id}/albums`, params, [])
    },
    songLists: {
        songs: (id, params) =>request(`/songLists/${id}/songs`, params, {})
    }
}

export default api;