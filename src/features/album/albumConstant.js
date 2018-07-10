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