import i18n from './../../common/i18n';

export const defaultSearchParams = {
    maxResults: 30,
    nameMatchMode: 'auto',
    fields: 'MainPicture',
    sort: 'Name'
}

export const filterField = {
    discTypes: 'discTypes',
    sort: 'sort'
}

export const albumTypeName = {
    album: 'Album',
    single: 'Single',
    ep: 'EP',
    splitAlbum: 'splitAlbum',
    compilation: 'compilation',
    artbook: 'artbook',
    game: 'Game',
    fanmade: 'Fanmade',
    instrumental: 'Instrumental',
    other: 'Other'
}

export const translateAlbumType = (albumType) => {
    switch (albumType) {
        case albumTypeName.album: return i18n.originalAlbum;
        case albumTypeName.single: return i18n.single;
        case albumTypeName.ep: return i18n.ep;
        case albumTypeName.splitAlbum: return i18n.splitAlbum;
        case albumTypeName.compilation: return i18n.compilation;
        case albumTypeName.artbook: return i18n.artbook;
        case albumTypeName.game: return i18n.game;
        case albumTypeName.fanmade: return i18n.fanmade;
        case albumTypeName.instrumental: return i18n.instrumental;
        case albumTypeName.other: return i18n.other;
        default : return albumType;
    }
}


export const discTypes = [
    {
        value: ''
    },
    {
        value: 'Unknow',
        label: 'Unknow'
    },
    {
        value: 'Album',
        label: i18n.album
    },
    {
        value: 'Single',
        label: i18n.single
    },
    {
        value: 'EP',
        label: i18n.ep
    },
    {
        value: 'SplitAlbum',
        label: i18n.splitAlbum
    },
    {
        value: 'Compilation',
        label: i18n.compilation
    },
    {
        value: 'Artbook',
        label: i18n.artbook
    },
    {
        value: 'Game',
        label: i18n.game
    },
    {
        value: 'Fanmade',
        label: i18n.fanmade
    },
    {
        value: 'Instrumental',
        label: i18n.instrumental
    },
    {
        value: 'Other',
        label: i18n.other
    }
]

export const sortItems = [
    {
        value: '',
        label: ''
    },
    {
        value: 'None',
        label: 'None'
    },
    {
        value: 'Name',
        label: i18n.name
    },
    {
        value: 'AdditionDate',
        label: i18n.additionDate
    },
    {
        value: 'FavoritedTimes',
        label: i18n.favoritedTimes
    },
    {
        value: 'RatingScore',
        label: i18n.ratingScore
    }
]