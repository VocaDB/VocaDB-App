import {
    selectTag,
    selectTagEntity,
    selectTagDetail,
    selectTopSongs,
    selectTopArtists,
    selectTopAlbums,
    selectTagDetailLatestSongs } from './../tagSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'
import Routes from './../../../app/appRoutes'

describe('Test tag selector', () => {

    let state;
    let entities;
    let tag1;
    let tag2;
    let song1;
    let song2;
    let artist1;
    let artist2;
    let album1;
    let album2;

    beforeEach(() => {

        tag1 = mockGenerator.CreateTag({ id: 1 })
        tag2 = mockGenerator.CreateTag({ id: 2 })

        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })
        song1.image = 'https://tn-skr1.smilevideo.jp/smile?i=6666016'
        song2.image = 'https://tn-skr1.smilevideo.jp/smile?i=6666016'

        artist1 = mockGenerator.CreateArtist({ id: 1 })
        artist2 = mockGenerator.CreateArtist({ id: 2 })
        artist1.image = 'https://vocadb.net/Artist/Picture/1'
        artist2.image = 'https://vocadb.net/Artist/Picture/2'

        album1 = mockGenerator.CreateAlbum({ id: 1 })
        album2 = mockGenerator.CreateAlbum({ id: 2 })
        album1.image = 'https://vocadb.net/Album/CoverPicture/1'
        album2.image = 'https://vocadb.net/Album/CoverPicture/2'

        entities = {
            tags: {
                '1': tag1,
                '2': tag2
            },
            songs: {
                '1': song1,
                '2': song2
            },
            albums: {
                '1': album1,
                '2': album2
            },
            artists: {
                '1': artist1,
                '2': artist2
            }
        }

        state = {
            entities,
            tag: {
                detail: 0,
                topSongs: [],
                topArtists: [],
                topAlbums: []
            },
            nav: {
                index: 0,
                routes: [
                    {
                        key: '1',
                        routeName: Routes.TagDetail,
                        params: {
                            id: tag1.id
                        }
                    }
                ]
            }
        }
    });


    it('should return tag state correctly', () => {
        const actualResult = selectTag()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.tag)
    })

    it('should return tag entity state correctly', () => {
        const actualResult = selectTagEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.tags)
    })

    it('should return tag detail correctly', () => {
        state.tag.detail = tag1.id

        const actualResult = selectTagDetail()(state);
        const expectedResult = tag1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return top songs', () => {
        state.tag.topSongs = [ song1.id, song2.id ]

        const actualResult = selectTopSongs()(state);
        const expectedResult = [ song1, song2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return top artists', () => {
        state.tag.topArtists = [ artist1.id, artist2.id ]

        const actualResult = selectTopArtists()(state);
        const expectedResult = [ artist1, artist2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return top albums', () => {
        state.tag.topAlbums = [ album1.id, album2.id ]

        const actualResult = selectTopAlbums()(state);
        const expectedResult = [ album1, album2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return latest songs by tag detail id',  () => {
        state.tag.detail = 345
        state.tag.latestSongsByTagId = {
            '345': [ 1, 2 ]
        }

        const actualResult = selectTagDetailLatestSongs()(state);
        const expectedResult = [ song1, song2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })
})