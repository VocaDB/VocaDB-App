import { schema } from 'normalizr'
import songSchema from './../song/songSchema'
import albumSchema from './../album/albumSchema'
import eventSchema from './../releaseEvent/releaseEventSchema'

const artistSchema = new schema.Entity('artists', {
    relations: {
        latestAlbums: [ albumSchema ],
        latestEvents: [ eventSchema ],
        latestSongs: [ songSchema ],
        popularAlbums: [ albumSchema ],
        popularSongs: [ songSchema ],

    }
});

export default artistSchema;