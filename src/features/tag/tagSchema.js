import { schema } from 'normalizr'
import songSchema from './../song/songSchema'
import artistSchema from './../artist/artistSchema'
import albumSchema from './../album/albumSchema'

const tagSchema = new schema.Entity('tags', {
    topSongs: [ songSchema ],
    topArtists: [ artistSchema ],
    topAlbums: [ albumSchema ]
});

export default tagSchema;