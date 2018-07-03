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
        value: ''
    },
    {
        value: 'Circle'
    },
    {
        value: 'Illustrator'
    },
    {
        value: 'Producer'
    },
    {
        value: 'UTAU'
    },
    {
        value: 'Vocaloid'
    }
];

export const sortItems = [
    {
        value: 'Name'
    },
    {
        value: 'AdditionDate'
    },
    {
        value: 'AdditionDateAsc'
    },
    {
        value: 'ReleaseDate'
    },
    {
        value: 'SongCount'
    },
    {
        value: 'SongRating'
    },
    {
        value: 'FollowerCount'
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