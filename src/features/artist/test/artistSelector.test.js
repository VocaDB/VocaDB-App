import {
    selectArtist,
    selectArtistEntity,
    selectArtistDetail,
    selectIsFollowedArtist,
    selectArtistLinks,
    selectArtistLinksReverse,
    selectBaseVoicebank } from './../artistSelector'
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
            },
            nav: {
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
        artist1.artistLinks = [
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
                artist: { id: 7655, name: 'ろこる' }, linkType: 'CharacterDesigner'
            },
            {
                artist: { id: 99, name: 'ABC' }, linkType: 'Other'
            }
        ]

        let expected = [
            {
                linkType: 'Groups and labels',
                artists: [
                    { id: 25, name: 'Crypton' },
                    { id: 686, name: 'Electro' }
                ]
            },
            {
                linkType: 'Illustrated by',
                artists: [
                    { id: 9213, name: 'KEI' }
                ]
            },
            {
                linkType: 'Voice provider',
                artists: [
                    { id: 49761, name: '藤田咲' }
                ]
            },
            {
                linkType: 'Character designer',
                artists: [
                    { id: 7655, name: 'ろこる' }
                ]
            },
            {
                linkType: 'Other',
                artists: [
                    { id: 99, name: 'ABC' }
                ]
            }
        ];

        const actualResult = selectArtistLinks()(state);

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expected);
    })

    it('should return null when artist links does not exist', () => {
        const actualResult = selectArtistLinks()(state);
        expect(actualResult).toEqual(null);
    })

    it('should grouping artist links reverse', () => {
        artist1.artistLinksReverse = [
            {
                artist: { id: 9213, name: 'KEI' }, linkType: 'Illustrator'
            },
            {
                artist: { id: 1, name: 'MEI' }, linkType: 'Illustrator'
            },
            {
                artist: { id: 49761, name: '藤田咲' }, linkType: 'VoiceProvider'
            },
            {
                artist: { id: 7655, name: 'ろこる' }, linkType: 'CharacterDesigner'
            },
            {
                artist: { id: 99, name: 'ABC' }, linkType: 'Other'
            }
        ]

        let expected = [
            {
                linkType: 'Illustrator of',
                artists: [
                    { id: 9213, name: 'KEI' },
                    { id: 1, name: 'MEI' }
                ]
            },
            {
                linkType: 'Voice provider of',
                artists: [
                    { id: 49761, name: '藤田咲' }
                ]
            },
            {
                linkType: 'Designer of',
                artists: [
                    { id: 7655, name: 'ろこる' }
                ]
            },
            {
                linkType: 'Other',
                artists: [
                    { id: 99, name: 'ABC' }
                ]
            }
        ];

        const actualResult = selectArtistLinksReverse()(state);

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expected);
    })

    it('should return null when artist links reverse does not exist', () => {
        const actualResult = selectArtistLinksReverse()(state);
        expect(actualResult).toEqual(null);
    })

    it('should return base voicebank', () => {
        artist1.baseVoicebank = artist2.id

        const actualResult = selectBaseVoicebank()(state);
        artist2.image = `https://static.vocadb.net/img/artist/mainSmall/${artist2.id}`

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(artist2);
    })

    it('should return base voicebank null if id not found', () => {
        artist1.baseVoicebank = 99

        const actualResult = selectBaseVoicebank()(state);

        expect(actualResult).toEqual(null);
    })

    it('should return base voicebank null if not exists', () => {
        const actualResult = selectBaseVoicebank()(state);

        expect(actualResult).toEqual(null);
    })
})