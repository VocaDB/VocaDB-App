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

        const artistLink1 = mockGenerator.CreateArtist({ id: 25, name: 'Crypton'})
        const artistLink2 = mockGenerator.CreateArtist({ id: 686, name: 'Electro'})
        const artistLink3 = mockGenerator.CreateArtist({ id: 9213, name: 'KEI'})
        const artistLink4 = mockGenerator.CreateArtist({ id: 49761, name: '藤田咲'})
        const artistLink5 = mockGenerator.CreateArtist({ id: 7655, name: 'ろこる'})
        const artistLink6 = mockGenerator.CreateArtist({ id: 99, name: 'ABC'})

        artistLink1.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink1.id}`
        artistLink2.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink2.id}`
        artistLink3.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink3.id}`
        artistLink4.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink4.id}`
        artistLink5.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink5.id}`
        artistLink6.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink6.id}`

        state.entities.artists[artistLink1.id.toString()] = artistLink1;
        state.entities.artists[artistLink2.id.toString()] = artistLink2;
        state.entities.artists[artistLink3.id.toString()] = artistLink3;
        state.entities.artists[artistLink4.id.toString()] = artistLink4;
        state.entities.artists[artistLink5.id.toString()] = artistLink5;
        state.entities.artists[artistLink6.id.toString()] = artistLink6;

        artist1.artistLinks = [
            {
                artist: artistLink1.id, linkType: 'Group'
            },
            {
                artist: artistLink2.id, linkType: 'Group'
            },
            {
                artist: artistLink3.id, linkType: 'Illustrator'
            },
            {
                artist: artistLink4.id, linkType: 'VoiceProvider'
            },
            {
                artist: artistLink5.id, linkType: 'CharacterDesigner'
            },
            {
                artist: artistLink6.id, linkType: 'Other'
            }
        ]

        let expected = [
            {
                linkType: 'Groups and labels',
                artists: [
                    artistLink1,
                    artistLink2
                ]
            },
            {
                linkType: 'Illustrated by',
                artists: [
                    artistLink3
                ]
            },
            {
                linkType: 'Voice provider',
                artists: [
                    artistLink4
                ]
            },
            {
                linkType: 'Character designer',
                artists: [
                    artistLink5
                ]
            },
            {
                linkType: 'Other',
                artists: [
                    artistLink6
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
        const artistLink2 = mockGenerator.CreateArtist({ id: 686, name: 'Electro'})
        const artistLink3 = mockGenerator.CreateArtist({ id: 9213, name: 'KEI'})
        const artistLink4 = mockGenerator.CreateArtist({ id: 49761, name: '藤田咲'})
        const artistLink5 = mockGenerator.CreateArtist({ id: 7655, name: 'ろこる'})
        const artistLink6 = mockGenerator.CreateArtist({ id: 99, name: 'ABC'})

        artistLink2.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink2.id}`
        artistLink3.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink3.id}`
        artistLink4.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink4.id}`
        artistLink5.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink5.id}`
        artistLink6.image = `https://static.vocadb.net/img/artist/mainSmall/${artistLink6.id}`

        state.entities.artists[artistLink2.id.toString()] = artistLink2;
        state.entities.artists[artistLink3.id.toString()] = artistLink3;
        state.entities.artists[artistLink4.id.toString()] = artistLink4;
        state.entities.artists[artistLink5.id.toString()] = artistLink5;
        state.entities.artists[artistLink6.id.toString()] = artistLink6;

        artist1.artistLinksReverse = [
            {
                artist: artistLink2.id, linkType: 'Illustrator'
            },
            {
                artist: artistLink3.id, linkType: 'Illustrator'
            },
            {
                artist: artistLink4.id, linkType: 'VoiceProvider'
            },
            {
                artist: artistLink5.id, linkType: 'CharacterDesigner'
            },
            {
                artist: artistLink6.id, linkType: 'Other'
            },
            {
                artist: 123, linkType: 'Other' // Not exist
            }
        ]

        let expected = [
            {
                linkType: 'Illustrator of',
                artists: [
                    artistLink2,
                    artistLink3
                ]
            },
            {
                linkType: 'Voice provider of',
                artists: [
                    artistLink4
                ]
            },
            {
                linkType: 'Designer of',
                artists: [
                    artistLink5
                ]
            },
            {
                linkType: 'Other',
                artists: [
                    artistLink6
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