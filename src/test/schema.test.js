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
})
