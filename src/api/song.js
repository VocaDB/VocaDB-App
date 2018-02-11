import * as app from './../app/actions'

const api = {
    getRecentSongs: () => app.fetchApi('songs', { 'sort': 'AdditionDate' }, 'recentSongs'),
    getPopularSongs: () => app.fetchApi('songs', { 'sort': 'AdditionDate' }, 'popularSongs'),
    getSong: id => app.fetchApi('songs', { id }, 'song')
}

export default api