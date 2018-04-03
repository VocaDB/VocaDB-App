import { schema } from 'normalizr'
import songSchema from './../song/songSchema'
import albumSchema from './../album/albumSchema'

const releaseEvent = new schema.Entity('releaseEvents', {
    songs: [ songSchema ],
    albums: [ albumSchema ]
});

export default releaseEvent;