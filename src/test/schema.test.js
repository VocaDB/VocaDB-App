import { normalize } from 'normalizr'
import schemas from './../schema'

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
})
