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
        value: 'Unknow'
    },
    {
        value: 'Album'
    },
    {
        value: 'Single'
    },
    {
        value: 'EP'
    },
    {
        value: 'SplitAlbum'
    },
    {
        value: 'Compilation'
    },
    {
        value: 'Artbook'
    },
    {
        value: 'Game'
    },
    {
        value: 'Fanmade'
    },
    {
        value: 'Instrumental'
    },
    {
        value: 'Other'
    }
]

export const sortItems = [
    {
        value: ''
    },
    {
        value: 'None'
    },
    {
        value: 'Name'
    },
    {
        value: 'AdditionDate'
    },
    {
        value: 'FavoritedTimes'
    },
    {
        value: 'RatingScore'
    }
]