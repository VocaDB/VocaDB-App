import * as mockGenerator from './../../../helper/mockGenerator'

const mock = mockGenerator.CreateSong()

let mockArtist_1 = mockGenerator.CreateArtist({ id: 1 })
let mockArtistRole_1 = mockGenerator.CreateArtistRole({ id: 1 })
mockArtistRole_1.artist = mockArtist_1
let mockAlbum_1 = mockGenerator.CreateAlbum({ id: 1 })
let mockAlbum_2 = mockGenerator.CreateAlbum({ id: 2 })
let mockLyric_1 = mockGenerator.CreateLyric({ id: 1 })
let mockLyric_2 = mockGenerator.CreateLyric({ id: 2 })
let mockPV_1 = mockGenerator.CreatePV({ id: 1 })
let mockPV_2 = mockGenerator.CreatePV({ id: 1 })
let mockTag_1 = mockGenerator.CreateTag({ id: 1 })
let mockWebLink_1 = mockGenerator.CreateWebLink({ id: 1 })

mock.albums = [ mockAlbum_1, mockAlbum_2 ]
mock.artists = [ mockArtistRole_1 ]
mock.pvs = [ mockPV_1, mockPV_2 ]
mock.lyrics = [ mockLyric_1, mockLyric_2 ]
mock.tags = [ { count: 7, tag: mockTag_1 } ]
mock.webLinks = [ mockWebLink_1 ]

export default mock
