export default {
    useMock : false,
    host: 'https://vocadb.net/api',
    maxRecentSearch: 10,
    enableAuth: false
}

export const host = 'https://vocadb.net';
export const staticHost = 'https://static.vocadb.net';
export const songDetailUrl = id => `${host}/S/${id}`
export const artistDetailUrl = id => `${host}/Ar/${id}`
export const albumDetailUrl = id => `${host}/Al/${id}`
export const tagDetailUrl = id => `${host}/T/${id}`
export const releaseEventDetailUrl = id => `${host}/E/${id}`
