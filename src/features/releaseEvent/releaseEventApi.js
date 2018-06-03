import api from '../../common/api'
import { dateAfterToday, yesterday } from './../../common/utilities/dateUtils'

const releaseEventApi = {
    find: params => api.events.find({ ...params, 'nameMatchMode': 'auto', fields: 'MainPicture,Series' }),
    getRecentReleaseEvents: params => api.events.find({
        ...params,
        'sort': 'Date',
        'fields': 'MainPicture',
        'afterDate': yesterday(),
        'beforeDate': dateAfterToday(30)
    }),
    getReleaseEvent: (id, params) => api.events.get(id, { ...params, fields: 'WebLinks,Description,Artists,MainPicture,Series,SongList' }),
    getPublishedSongs: (id, params) => api.events.getPublishedSongs(id, { ...params, fields: 'ThumbUrl' }),
    getAlbums: (id, params) => api.events.getAlbums(id, { ...params, fields: 'MainPicture' }),
    getSongList: (songListId, params) => api.songLists.songs(songListId, { ...params, fields: 'ThumbUrl', maxResults: 50 })
}

export default releaseEventApi