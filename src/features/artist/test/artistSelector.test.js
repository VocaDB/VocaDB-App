import {
    selectArtist,
    selectArtistEntity,
    selectArtistDetail,
    selectIsFollowedArtist,
    selectArtistLinks } from './../artistSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'
import Routes from './../../../app/appRoutes'

describe('Test artist selector', () => {

    let state;
    let entities;
    let artist1;
    let artist2;

    beforeEach(() => {

        artist1 = mockGenerator.CreateArtist({ id: 1 })
        artist2 = mockGenerator.CreateArtist({ id: 2 })

        entities = {
            artists: {
                '1': artist1,
                '2': artist2
            }
        }

        state = {
            entities,
            artist: {
                detail: 0
            }
        }
    });


    it('should return artist state correctly', () => {
        const actualResult = selectArtist()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.artist)
    })

    it('should return artist entity state correctly', () => {
        const actualResult = selectArtistEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.artists)
    })

    it('should return artist detail correctly', () => {
        state.artist.detail = artist1.id
        state.nav = {
            index: 0,
            routes: [
                {
                    key: '1',
                    routeName: Routes.ArtistDetail,
                    params: {
                        id: artist1.id
                    }
                }
            ]
        }

        const actualResult = selectArtistDetail()(state);

        artist1.image = `https://static.vocadb.net/img/artist/mainSmall/${artist1.id}`
        const expectedResult = artist1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return followed artist is true', () => {
        state.artist = {
            followed: [ 5, 4, 3, 2, 1 ]
        }

        state.nav = {
            index: 0,
            routes: [
                {
                    key: '1',
                    routeName: Routes.ArtistDetail,
                    params: {
                        id: artist1.id
                    }
                }
            ]
        }

        const actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toBeTruthy();
    })

    it('should return followed artist is false', () => {
        let actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toEqual(false);

        state.artist.detail = artist1.id
        state.artist = {
            detail: artist1.id,
            followed: [ 5, 4, 3, 2 ]
        }

        actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toEqual(false);
    })

    it('should grouping artist links', () => {

        let artistLinks = [
            {
                artist: { id: 25, name: 'Crypton' }, linkType: 'Group'
            },
            {
                artist: { id: 686, name: 'Electro' }, linkType: 'Group'
            },
            {
                artist: { id: 9213, name: 'KEI' }, linkType: 'Illustrator'
            },
            {
                artist: { id: 49761, name: '藤田咲' }, linkType: 'VoiceProvider'
            },
            {
                artist: {}, linkType: 'CharacterDesigner'
            }
        ]

        let expected = [
            {
                title: 'Groups and labels',
                artists: [
                    { id: 25, name: 'Crypton' },
                    { id: 686, name: 'Electro' }
                ]
            },
            {
                title: 'Illustrated by',
                artists: [
                    { id: 9213, name: 'KEI' }
                ]
            },
            {
                title: 'Voice provider',
                artists: [
                    { id: 49761, name: '藤田咲' }
                ]
            },
            {
                title: 'Character designer',
                artists: [
                    { id: 7655, name: 'ろこる' }
                ]
            }
        ];

        const actualResult = selectArtistLinks()(state);

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expected);
    })
})