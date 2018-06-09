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
        value: 'Unspecified'
    },
    {
        value: 'Original'
    },
    {
        value: 'Remaster'
    },
    {
        value: 'Remix'
    },
    {
        value: 'Cover'
    },
    {
        value: 'Instrumental'
    },
    {
        value: 'Mashup'
    },
    {
        value: 'MusicPV'
    },
    {
        value: 'DramaTV'
    },
    {
        value: 'Other'
    }
]