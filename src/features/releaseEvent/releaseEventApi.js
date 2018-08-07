import api from '../../common/api';
import { dateAfterToday, yesterday, daysAgo } from './../../common/utilities/dateUtils';

const releaseEventApi = {
    find: params => api.events.find({ ...params, 'nameMatchMode': 'auto', fields: 'MainPicture,Series' }),
    getRecentReleaseEvents: params => api.events.find({
        ...params,
        maxResults: 20,
        'sort': 'Date',
        'fields': 'MainPicture',
        'afterDate': daysAgo(3),
        'beforeDate': dateAfterToday(12)
    }),
    getReleaseEvent: (id, params) => api.events.get(id, { ...params, fields: 'WebLinks,Description,Artists,MainPicture,Series,SongList' }),
    getPublishedSongs: (id, params) => api.events.getPublishedSongs(id, { ...params, fields: 'ThumbUrl' }),
    getAlbums: (id, params) => api.events.getAlbums(id, { ...params, fields: 'MainPicture' }),
    getSongList: (songListId, params) => api.songLists.songs(songListId, { ...params, fields: 'ThumbUrl', maxResults: 50 })
}

export default releaseEventApi