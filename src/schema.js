import { schema } from 'normalizr'

export const album = new schema.Entity('albums');
export const artist = new schema.Entity('artists');
export const lyric = new schema.Entity('lyrics');
export const webLink = new schema.Entity('webLinks');
export const pv = new schema.Entity('pvs');
export const tag = new schema.Entity('tags')
export const artistRole = new schema.Entity('artistRoles', {
    artist: artist
})
export const song = new schema.Entity('songs', {
    lyrics: [ lyric ],
    albums: [ album ],
    artists: [ artistRole ],
    webLinks: [ webLink ],
    pvs: [ pv ],
    tags: [
        {
            tag: tag
        }
    ]
});

export default  {
    'songs' : song
}