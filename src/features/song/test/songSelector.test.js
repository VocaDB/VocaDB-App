import {
    selectSong,
    selectLatestSongs,
    selectSongEntity,
    selectFollowedSongs,
    selectSongDetail } from './../songSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test song selector', () => {

    let state;
    let entities;
    let song1;
    let song2;

    beforeEach(() => {

        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })

        let webLink1 = mockGenerator.CreateWebLink({ id: 1 })
        let webLink2 = mockGenerator.CreateWebLink({ id: 2 })

        let tag1 = mockGenerator.CreateTag({ id: 1 })
        let tag2 = mockGenerator.CreateTag({ id: 2 })

        let artist1 = mockGenerator.CreateArtist({ id: 1 })
        let artist2 = mockGenerator.CreateArtist({ id: 2 })

        let album1 = mockGenerator.CreateAlbum({ id: 1 })

        let artistRole1 = mockGenerator.CreateArtistRole({ id: 1 })
        artistRole1.artist = artist1

        let artistRole2 = mockGenerator.CreateArtistRole({ id: 2 })
        artistRole2.artist = artist2

        song1.artists.push(artistRole1)
        song1.artists.push(artistRole2)
        song1.albums.push(album1.id)
        song1.tags.push({ count: 1, tag: tag1 })
        song1.tags.push({ count: 2, tag: tag2 })

        song2.artists.push(artistRole2)
        song2.webLinks.push(webLink1)
        song2.webLinks.push(webLink2)

        entities = {
            songs: {
                '1': song1,
                '2': song2
            }
        }

        state = {
            entities,
            song: {
                all: [],
                followed: [],
                detail: 0
            }
        }
    });


    it('should return song state correctly', () => {
        const actualResult = selectSong()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.song)
    })

    it('should return song entity state correctly', () => {
        const actualResult = selectSongEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.songs)
    })

    it('should return latest songs correctly', () => {
        state.song.all = [ song2.id, song1.id ]

        const actualResult = selectLatestSongs()(state);
        const expectedResult = [ song2, song1 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return empty of latest songs', () => {
        const actualResult = selectLatestSongs()(state);
        const expectedResult = [];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return empty of latest songs when entities is undefined', () => {
        state.entities = undefined

        const actualResult = selectLatestSongs()(state);
        const expectedResult = [];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should not return undefined song when not found in entities', () => {
        state.song.all = [ song2.id, song1.id ]
        state.entities = { songs: { '2': song2 } }

        const actualResult = selectLatestSongs()(state);
        const expectedResult = [ song2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return followed songs correctly', () => {
        state.song.followed = [ song2.id, song1.id ]

        const actualResult = selectFollowedSongs()(state);
        const expectedResult = [ song2, song1 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return empty followed songs when entity is undefined', () => {
        state.entities = undefined
        state.song.followed = [ song2.id, song1.id ]

        const actualResult = selectFollowedSongs()(state);
        const expectedResult = [];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return song detail correctly', () => {
        state.song.detail = song1.id

        const actualResult = selectSongDetail()(state);
        const expectedResult = song1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })
})