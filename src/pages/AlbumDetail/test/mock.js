import * as mockGenerator from '../../../common/helper/mockGenerator'

const mock = mockGenerator.CreateAlbum()

let mockPV_1 = mockGenerator.CreatePV({ id: 1 })
let mockEvent = mockGenerator.CreateEvent({ id: 1 })
let mockArtist_1 = mockGenerator.CreateArtist({ id: 1 })
let mockArtistRole_1 = mockGenerator.CreateArtistRole({ id: 1 })
delete mockArtistRole_1.id
mockArtistRole_1.artist = mockArtist_1
let mockTag_1 = mockGenerator.CreateTag({ id: 1 })
let mockWebLink_1 = mockGenerator.CreateWebLink({ id: 1 })

mock.tracks = []
mock.pvs = [ mockPV_1 ]
mock.artists = [ mockArtistRole_1 ]
mock.releaseEvent = mockEvent
mock.tags = [ { count: 7, tag: mockTag_1 } ]
mock.webLinks = [ mockWebLink_1 ]

export default mock