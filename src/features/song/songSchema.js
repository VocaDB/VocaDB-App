import { schema } from 'normalizr'
import albumSchema from './../album/albumSchema'

const song = new schema.Entity('songs', {
    albums: [ albumSchema ]
});

export default song;