import _ from 'lodash'

export const defaultSearchParams = { maxResults: 50, fields: 'MainPicture', sort: 'Date' }

export const filterField = {
    afterDate: 'afterDate',
    beforeDate: 'beforeDate',
    category: 'category'
}

export const category = {
    unspecified: 'Unspecified',
    albumRelease: 'AlbumRelease',
    anniversary: 'Anniversary',
    club: 'Club',
    concert: 'Concert',
    contest: 'Contest',
    convention: 'Convention',
    other: 'Other'
}

export const categoryItems = _.values(category).map(value => ({ value }))