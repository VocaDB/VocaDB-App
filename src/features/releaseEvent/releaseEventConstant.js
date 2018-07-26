import _ from 'lodash';
import i18n from './../../common/i18n';

export const defaultSearchParams = {
    maxResults: 50,
    fields: 'MainPicture',
    sort: 'Date',
    category: 'Unspecified',
    afterDate: '',
    beforeDate: '',
}

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

export const categoryItems = [
    {
        label: i18n.unspecified,
        value: 'Unspecified'
    },
    {
        label: i18n.albumRelease,
        value: 'AlbumRelease'
    },
    {
        label: i18n.anniversary,
        value: 'Anniversary'
    },
    {
        label: i18n.club,
        value: 'Club'
    },
    {
        label: i18n.concert,
        value: 'Concert'
    },
    {
        label: i18n.contest,
        value: 'Contest'
    },
    {
        label: i18n.convention,
        value: 'Convention'
    },
    {
        label: i18n.other,
        value: 'Other'
    }
]

export const sortItems = [
    {
        value: '',
        label: ''
    },
    {
        value: 'None',
        label: ''
    },
    {
        value: 'Name',
        label: i18n.name
    },
    {
        value: 'Date',
        label: i18n.date
    },
    {
        value: 'AdditionDate',
        label: i18n.additionDate
    },
    {
        value: 'SeriesName',
        label: i18n.seriesName
    }
]