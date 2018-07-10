import i18n from './../../common/i18n';

export const defaultSearchParams = {
    maxResults: 50,
    fields: 'MainPicture',
    nameMatchMode: 'auto',
    sort: 'Name',
    start: 0,
    artistTypes: '',
    artistId: [],
    tagId: [],
}

export const filterField = {
    artistTypes: 'artistTypes',
    sort: 'sort'
}

export const artistTypes = [
    {
        value: '',
        label: ''
    },
    {
        value: 'Circle',
        label: i18n.circle
    },
    {
        value: 'Illustrator',
        label: i18n.illustrator
    },
    {
        value: 'Producer',
        label: i18n.producer
    },
    {
        value: 'UTAU',
        label: i18n.utau
    },
    {
        value: 'Vocaloid',
        label: i18n.vocaloid
    }
];

export const sortItems = [
    {
        value: 'Name',
        label: i18n.name
    },
    {
        value: 'AdditionDate',
        label: i18n.additionDateDesc
    },
    {
        value: 'AdditionDateAsc',
        label: i18n.additionDateAsc
    },
    {
        value: 'ReleaseDate',
        label: i18n.voicebankReleaseDate
    },
    {
        value: 'SongCount',
        label: i18n.songCount
    },
    {
        value: 'SongRating',
        label: i18n.songRating
    },
    {
        value: 'FollowerCount',
        label: i18n.followerCount
    }
]

export const translateLinkType = (linkType) => {
    switch (linkType) {
        case 'Group': return 'Groups and labels';
        case 'Illustrator': return 'Illustrated by';
        case 'VoiceProvider': return 'Voice provider';
        case 'CharacterDesigner': return 'Character designer';
        default : return linkType;
    }
}

export const translateReverseLinkType = (linkType) => {
    switch (linkType) {
        case 'Illustrator': return 'Illustrator of';
        case 'VoiceProvider': return 'Voice provider of';
        case 'CharacterDesigner': return 'Designer of';
        default : return linkType;
    }
}