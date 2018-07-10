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
        case 'Group': return i18n.groupAndLabels;
        case 'Illustrator': return i18n.illustratedBy;
        case 'VoiceProvider': return i18n.voiceProvider;
        case 'CharacterDesigner': return i18n.characterDesigner;
        default : return linkType;
    }
}

export const translateReverseLinkType = (linkType) => {
    switch (linkType) {
        case 'Illustrator': return i18n.illustratorOf;
        case 'VoiceProvider': return i18n.voiceProviderOf;
        case 'CharacterDesigner': return i18n.designerOf;
        default : return linkType;
    }
}