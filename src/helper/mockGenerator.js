
export const CreateSong = (config = {}) => ({
    id: (config.id) ? config.id : 1032,
    artistString: (config.artistString) ? config.artistString : 'doriko feat. 初音ミク',
    defaultName: (config.defaultName) ? config.defaultName : 'ロミオとシンデレラ',
    songType: (config.songType) ? config.songType : 'Original',
    createDate: (config.createDate) ? config.createDate : '2011-10-30T01:07:43',
    additionalNames: (config.additionalNames) ? config.additionalNames : 'Romeo to Cinderella, Romeo and Cinderella',
    status: (config.status) ? config.status : 'Finished',
    names: [],
    albums: [],
    artists: [],
    pvs: [],
    webLinks: [],
    tags: [],
    lyrics: [],
    publishDate: (config.publishDate) ? config.publishDate : '2011-10-30T01:07:43',
    thumbUrl: 'http://tn-skr1.smilevideo.jp/smile?i=6666016'
})

export const CreateArtist = (config = {}) => ({
    id: (config.id) ? config.id : 1,
    artistType: "Vocaloid",
    createDate: (config.createDate) ? config.createDate : '2011-01-15T22:23:15',
    defaultName: (config.defaultName) ? config.defaultName : '初音ミク',
    defaultNameLanguage: (config.defaultNameLanguage) ? config.defaultNameLanguage : 'Japanese',
    description: (config.description) ? config.description : 'Hatsune Miku (初音ミク) is a singing synthesizer application with a female persona',
    name: (config.name) ? config.name : '初音ミク',
    relations: {
        latestAlbums: [],
        latestEvents: [],
        latestSongs: [],
        popularAlbums: [],
        popularSongs: [],

    },
    releaseDate: "2007-08-31T00:00:00Z",
    status: "Locked",
    tags: [],
    webLinks: []
})

export const CreateArtistRole = (config = {}) => ({
    categories: (config.categories) ? config.categories : 'Producer',
    effectiveRoles: (config.categories) ? config.categories : 'Producer',
    id: (config.id) ? config.id : 917,
    isSupport: (config.isSupport) ? config.isSupport : false,
    name: (config.name) ? config.name : 'doriko',
    roles: (config.roles) ? config.roles : 'Default',
})

export const CreateAlbum = (config = {}) => ({
    id: (config.id) ? config.id : 1,
    artists: [],
    artistString: (config.artistString) ? config.artistString : '桜華P, No,666 feat. GUMI',
    createDate: (config.createDate) ? config.createDate : '2013-09-10T15:18:38',
    defaultName: (config.defaultName) ? config.defaultName : '"666" NUMBER TRIPLE SIX',
    defaultNameLanguage: (config.defaultNameLanguage) ? config.defaultNameLanguage : 'English',
    discType: (config.discType) ? config.discType : 'Album',
    name: (config.name) ? config.name : '"666" NUMBER TRIPLE SIX',
    ratingAverage: 0,
    ratingCount: 0,
    releaseDate: (config.releaseDate) ? config.releaseDate : {
        day: 8,
        formatted: "7/8/2012",
        isEmpty: false,
        month: 7,
        year: 2012
    },
    tracks: [],
    status: (config.status) ? config.status : 'Finished'
})

export const CreateTag = (config = {}) => ({
    id: (config.id) ? config.id : 1557,
    additionalNames: (config.additionalNames) ? config.additionalNames : 'Japanese',
    categoryName: (config.categoryName) ? config.categoryName : 'Languages',
    name: (config.name) ? config.name : '日本語',
    urlSlug: (config.urlSlug) ? config.urlSlug : 'japanese',
})

export const CreateWebLink = (config = {}) => ({
    category: (config.category) ? config.category : 'Official',
    description: (config.description) ? config.description : 'Producer\'s Website',
    id: (config.id) ? config.id : 19266,
    url: (config.url) ? config.url : 'http://doriko.jp/download/romeo.html'
})

export const CreatePV = (config = {}) => ({
    author: (config.author) ? config.author : 'doriko',
    disabled: (config.disabled) ? config.disabled : false,
    id: (config.id) ? config.id : 86120,
    length: (config.length) ? config.length : 280,
    name: (config.name) ? config.name : '「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク',
    pvId: (config.pvId) ? config.pvId : 'sm6666016',
    service: (config.service) ? config.service : 'NicoNicoDouga',
    pvType: (config.pvType) ? config.pvType : 'Original',
    thumbUrl: (config.thumbUrl) ? config.thumbUrl : 'http://tn-skr1.smilevideo.jp/smile?i=6666016',
    url: (config.url) ? config.url : 'http://www.nicovideo.jp/watch/sm6666016',
})

export const CreateLyric = (config = {}) => ({
    cultureCode: (config.cultureCode) ? config.cultureCode : 'en',
    id: (config.id) ? config.id : 3361,
    source: (config.source) ? config.source : 'Project DIVA F 2nd, marvelangga and ElectricRaichu',
    translationType: (config.translationType) ? config.translationType : 'Translation',
    url: (config.url) ? config.url : 'http://vocaloidlyrics.wikia.com/wiki/Romeo_and_Cinderella',
    value: (config.value) ? config.value : 'Don\'t make my love your tragic Juliet',
})

export const CreateEvent = (config = {}) => ({
    category: (config.category) ? config.category : 'Unspecified',
    date: (config.date) ? config.date : '2018-02-18T00:00:00Z',
    id: (config.id) ? config.id : 1716,
    mainPicture: {
        urlSmallThumb: 'https://static.vocadb.net/img/releaseeventseries/mainSmall/88.png?v=4',
        urlThumb: 'https://static.vocadb.net/img/releaseeventseries/mainThumb/88.png?v=4',
        urlTinyThumb: 'https://static.vocadb.net/img/releaseeventseries/mainTiny/88.png?v=4'
    },
    name: (config.name) ? config.name : 'VOCALOID-ManiaX 39',
    seriesId: (config.seriesId) ? config.seriesId : 88,
    seriesNumber: (config.seriesNumber) ? config.seriesNumber : 39,
    seriesSuffix: '',
    status: (config.status) ? config.status : 'Finished',
    urlSlug: (config.urlSlug) ? config.urlSlug : 'vocaloid-maniax-39',
    venueName: (config.venueName) ? config.venueName : 'MOGRA, Akihabara, Tokyo, Japan',

})

export const CreateEntry = (entryType, config = {}) => {
    let entry = {}

    if(entryType==='Song') {
        entry = CreateSong(config)
    } else if(entryType==='Artist') {
        entry = CreateArtist(config)
    } else if(entryType==='Album') {
        entry = CreateAlbum(config)
    }

    return { ...entry, entryType}
}