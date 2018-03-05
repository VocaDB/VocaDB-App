import { schema } from 'normalizr'
import artistRoleSchema from './../artistRole/artistRoleSchema'
import lyricSchema from './../lyric/lyricSchema'
import albumSchema from './../album/albumSchema'
import webLinkSchema from './../webLink/webLinkSchema'
import pvSchema from './../pv/pvSchema'
import tagSchema from './../tag/tagSchema'

const song = new schema.Entity('songs');

song.define({
    lyrics: [ lyricSchema ],
    albums: [ albumSchema ],
    artists: [ artistRoleSchema ],
    webLinks: [ webLinkSchema ],
    pvs: [ pvSchema ],
    tags: [
        {
            tag: tagSchema
        }
    ]
})

export default song;