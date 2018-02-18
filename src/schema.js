import { schema } from 'normalizr'

const event = new schema.Entity('events')
const entry = new schema.Entity('entries');
const album = new schema.Entity('albums');
const lyric = new schema.Entity('lyrics');
const webLink = new schema.Entity('webLinks');
const pv = new schema.Entity('pvs');
const tag = new schema.Entity('tags')
const artist = new schema.Entity('artists');
const artistRole = new schema.Entity('artistRoles')
const song = new schema.Entity('songs');

artist.define({
    relations: {
        latestAlbums: [ album ],
        latestEvents: [ event ],
        latestSongs: [ song ],
        popularAlbums: [ album ],
        popularSongs: [ song ]
    },
    tags: [
        {
            tag: tag
        }
    ],
    webLinks: [ webLink ]
})

artistRole.define({
    artist
})

song.define({
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
})

export default  {
    'songs': song,
    'events': event,
    'albums': album,
    'entries': entry,
    'artists': artist
}