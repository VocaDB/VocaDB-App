import i18n from './../../common/i18n';

export const defaultSearchParams = {
    maxResults: 50,
    fields: 'MainPicture',
    nameMatchMode: 'auto',
    sort: 'Name',
    start: 0,
    artistTypes: '',
    tagId: [],
    query: ''
}

export const filterField = {
    artistTypes: 'artistTypes',
    sort: 'sort'
}

export const artistTypes = [
    {
        value: '',
        label: i18n.unspecified
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

export const translateArtistType = (artistType) => {
    switch (artistType) {
        case 'Circle': return i18n.circle;
        case 'Label': return i18n.label;
        case 'Producer': return i18n.producer;
        case 'Animator': return i18n.animator;
        case 'Illustrator': return i18n.illustrator;
        case 'Lyricist': return i18n.lyricist;
        case 'Vocalist': return i18n.vocalist;
        case 'Vocaloid': return i18n.vocaloid;
        case 'UTAU': return i18n.utau;
        case 'CeVIO': return i18n.cevio;
        case 'OtherVoiceSynthesizer': return i18n.otherVoiceSynthesizer;
        case 'OtherVocalist': return i18n.otherVocalist;
        case 'OtherGroup': return i18n.otherGroup;
        case 'OtherIndividual': return i18n.otherIndividual;
        case 'Other': return i18n.other;
        default : return artistType;
    }
}

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