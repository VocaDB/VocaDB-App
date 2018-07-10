import i18n from './../../common/i18n';

export const defaultSearchParams = {
    nameMatchMode: 'auto',
    maxResults: 50,
    start: 0,
    fields: 'thumbUrl',
    songTypes: '',
    artistId: [],
    tagId: [],
    sort: 'Name'
}

export const songTypeName = {
    original: 'Original',
    remaster: 'Remaster',
    remix: 'Remix',
    cover: 'Cover',
    instrumental: 'Instrumental',
    mashup: 'Mashup',
    musicPV: 'MusicPV',
    dramaPV: 'DramaPV',
    other: 'Other'
}

export const songTypeItems = [
    {
        value: 'Unspecified',
        label: i18n.unspecified
    },
    {
        value: songTypeName.original,
        label: i18n.originalSong
    },
    {
        value: songTypeName.remaster,
        label: i18n.remaster
    },
    {
        value: songTypeName.remix,
        label: i18n.remix
    },
    {
        value: songTypeName.cover,
        label: i18n.cover
    },
    {
        value: songTypeName.instrumental,
        label: i18n.instrumental
    },
    {
        value: songTypeName.mashup,
        label: i18n.mashup
    },
    {
        value: songTypeName.musicPV,
        label: i18n.musicPV
    },
    {
        value: songTypeName.dramaPV,
        label: i18n.dramaPV
    },
    {
        value: songTypeName.other,
        label: i18n.other
    }
]

export const songSortItems = [
    {
        value: 'Name',
        label: i18n.name
    },
    {
        value: 'AdditionDate',
        label: i18n.additionDate
    },
    {
        value: 'PublishDate',
        label: i18n.publishDate
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