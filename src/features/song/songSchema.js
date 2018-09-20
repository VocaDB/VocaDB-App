import { schema } from 'normalizr';
import albumSchema from './../album/albumSchema';

const song = new schema.Entity('songs', {
    albums: [ albumSchema ],
    alternate: [ new schema.Entity('songs') ]
});

export default song;