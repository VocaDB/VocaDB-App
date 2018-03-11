import * as mockGenerator from '../../../common/helper/mockGenerator'

const track_1 = mockGenerator.CreateTrack({ id: 1, name: 'メルト' })
const song_1 = mockGenerator.CreateSong({ id: 1, defaultName: 'メルト', artistString: 'ryo'})
track_1.song = song_1

const track_2 = mockGenerator.CreateTrack({ id: 2, name: 'Melody line' })
const song_2 = mockGenerator.CreateSong({ id: 2, defaultName: 'Melody line', artistString: 'SmileR'})
track_2.song = song_2

const track_3 = mockGenerator.CreateTrack({ id: 3, name: '罪の名前' })
const song_3 = mockGenerator.CreateSong({ id: 3, defaultName: '罪の名前', artistString: 'ryo feat. 初音ミク V3 (Solid), 初音ミク V3 (English)'})
track_3.song = song_3

const track_4 = mockGenerator.CreateTrack({ id: 4, name: 'A', discNumber: 2 })
const song_4 = mockGenerator.CreateSong({ id: 4, defaultName: 'A', artistString: 'abcdef'})
track_4.song = song_4

export const singleDiscTracks = [ track_1, track_2, track_3 ]
export const multiDiscTracks = [ track_1, track_2, track_4 ]