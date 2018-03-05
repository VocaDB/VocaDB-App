import {
    selectSong,
    selectLatestSongs,
    selectSongEntity,
    selectFollowedSongs,
    selectSongDetail } from './../songSelector'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Test song selector', () => {

    let state;
    let entities;
    let song1;
    let song2;

    beforeEach(() => {

        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })

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