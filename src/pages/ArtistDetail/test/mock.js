import * as mockGenerator from '../../../common/helper/mockGenerator'

const mock = mockGenerator.CreateArtist()

let mockSong_1 = mockGenerator.CreateSong({ id: 1 })
let mockSong_2 = mockGenerator.CreateSong({ id: 2 })
let mockAlbum_1 = mockGenerator.CreateAlbum({ id: 1 })
let mockAlbum_2 = mockGenerator.CreateAlbum({ id: 2 })
let mockTag_1 = mockGenerator.CreateTag({ id: 1 })
let mockWebLink_1 = mockGenerator.CreateWebLink({ id: 1 })

mock.relations.latestSongs = [ mockSong_1, mockSong_2 ]
mock.relations.latestAlbums = [ mockAlbum_1, mockAlbum_2 ]
mock.relations.popularSongs = [ mockSong_1 ]
mock.relations.popularAlbums = [ mockAlbum_1 ]
mock.tags = [ { count: 7, tag: mockTag_1 } ]
mock.webLinks = [ mockWebLink_1 ]

export default mock