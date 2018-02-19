import { normalize } from 'normalizr'
import schemas from './../schema'
import * as mockGenerator from './../helper/mockGenerator'

describe('Normalize', () => {
    it('should normalize song with albums', () => {
        const data = {
            "defaultName": "ロミオとシンデレラ",
            "id": 1032,
            "albums": [
                {
                    "id": 17,
                    "name": "ロミオとシンデレラ",
                }
            ]
        }

        const expected = {
            "entities": {
                "albums": {
                    "17": {
                        "id": 17,
                        "name": "ロミオとシンデレラ"
                    }
                },
                "songs": {
                    "1032": {
                        "id": 1032,
                        "defaultName": "ロミオとシンデレラ",
                        "albums": [17]
                    }
                }
            },
            "result": 1032
        }

        expect(normalize(data, schemas['songs'])).toEqual(expected)
    });

    it('should normalize song with tags', () => {
        const data = {
            "defaultName": "ロミオとシンデレラ",
            "id": 1032,
            "tags": [
                {
                    "count": 3,
                    "tag": {
                        "additionalNames": "ギターソロ",
                        "id": 175,
                        "name": "guitar solo",
                        "urlSlug": "guitar-solo"
                    }
                }
            ]
        }

        const expected = {
            "entities": {
                "tags": {
                    "175": {
                        "additionalNames": "ギターソロ",
                        "id": 175,
                        "name": "guitar solo",
                        "urlSlug": "guitar-solo"
                    }
                },
                "songs": {
                    "1032": {
                        "id": 1032,
                        "defaultName": "ロミオとシンデレラ",
                        "tags": [
                            {
                                "count": 3,
                                "tag": 175
                            }
                        ]
                    }
                }
            },
            "result": 1032
        }

        expect(normalize(data, schemas['songs'])).toEqual(expected)
    });

    it('should normalize event list', () => {
        const data = {
            'id': 1,
            'name': 'eventA',
            'venueName': 'B'
        }

        const expected = {
            'entities': {
                'events': {
                    '1': data
                }
            },
            'result': [ 1 ]
        }

        expect(normalize([ data ], [ schemas['events'] ])).toEqual(expected)
    })

    it('should normalize artist detail', () => {
        const data = {
            'id': 1,
            'name': 'Hatsune Miku',
            'relations': {
                'latestAlbums': [
                    {
                        'id': 24202,
                        'name': 'EXIT TUNES'
                    }
                ],
                'latestEvents': [
                    {
                        'id': 1618,
                        'name': 'SNOW MIKU LIVE! 2018'
                    }
                ],
                'latestSongs': [
                    {
                        'id': 184598,
                        'name': 'ユメノメモリ'
                    }
                ],
                'popularAlbums': [
                    {
                        'id': 1227,
                        'name': 'アカツキアライヴァル'
                    }
                ],
                'popularSongs': [
                    {
                        'id': 1501,
                        'name': 'ローリンガール'
                    }
                ]
            }
        }

        const expected = {
            'entities': {
                'artists': {
                    '1': {
                        'id': 1,
                        'name': 'Hatsune Miku',
                        'relations': {
                            'latestAlbums': [ 24202 ],
                            'latestEvents': [ 1618 ],
                            'latestSongs': [ 184598 ],
                            'popularAlbums': [ 1227 ],
                            'popularSongs': [ 1501 ]
                        }
                    }
                },
                'events': {
                    '1618': {
                        'id': 1618,
                        'name': 'SNOW MIKU LIVE! 2018'
                    }
                },
                'albums': {
                    '24202': {
                        'id': 24202,
                        'name': 'EXIT TUNES'
                    },
                    '1227': {
                        'id': 1227,
                        'name': 'アカツキアライヴァル'
                    }
                },
                'songs': {
                    '184598': {
                        'id': 184598,
                        'name': 'ユメノメモリ'
                    },
                    '1501': {
                        'id': 1501,
                        'name': 'ローリンガール'
                    }
                }
            },
            'result': 1
        }

        expect(normalize(data, schemas['artists'])).toEqual(expected)
    })


    it('should normalize album', () => {
        const album = mockGenerator.CreateAlbum({ id: 1 })
        const artist_1 = mockGenerator.CreateArtist({ id: 1 })
        const artistRole_1 = mockGenerator.CreateArtistRole({ id: 2 })
        delete artistRole_1.id
        artistRole_1.artist = artist_1
        const tag_1 = mockGenerator.CreateTag({ id: 1 })
        const pv_1 = mockGenerator.CreatePV({ id: 1 })
        const releaseEvent = mockGenerator.CreateEvent({ id: 1 })
        album.artists = [ artistRole_1 ]
        album.tags = [ { count: 1, tag: tag_1 } ]
        album.pvs = [ pv_1 ]
        album.releaseEvent = releaseEvent

        const expectedAlbum = mockGenerator.CreateAlbum({ id: 1 })
        const expectedArtistRole_1 = mockGenerator.CreateArtistRole({ id: 2 })
        delete expectedArtistRole_1.id
        expectedArtistRole_1.artist = artist_1.id
        expectedAlbum.artists = [ expectedArtistRole_1 ]
        expectedAlbum.tags = [ { count: 1, tag: tag_1.id }  ]
        expectedAlbum.pvs = [ pv_1.id ]
        expectedAlbum.releaseEvent = releaseEvent.id

        const expected = {
            'entities': {
                'albums': {
                    '1': expectedAlbum
                },
                'artists': {
                    '1': artist_1
                },
                'tags': {
                    '1': tag_1
                },
                'pvs': {
                    '1': pv_1
                },
                'events': {
                    '1': releaseEvent
                }
            },
            'result': album.id
        }

        expect(normalize(album, schemas['albums'])).toEqual(expected)
    })
})
