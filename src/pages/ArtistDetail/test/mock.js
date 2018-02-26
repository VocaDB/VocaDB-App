import * as mockGenerator from './../../../helper/mockGenerator'

const mock = mockGenerator.CreateArtist()

let mockSong_1 = mockGenerator.CreateSong({ id: 1 })
let mockSong_2 = mockGenerator.CreateSong({ id: 2 })
let mockAlbum_1 = mockGenerator.CreateAlbum({ id: 1 })
let mockAlbum_2 = mockGenerator.CreateAlbum({ id: 2 })
let mockTag_1 = mockGenerator.CreateTag({ id: 1 })
let mockWebLink_1 = mockGenerator.CreateWebLink({ id: 1 })

mock.relations.latestSongs = [ mockSong_1, mockSong_2 ]
mock.relations.latestAlbums = [ mockAlbum_1, mockAlbum_2 ]
mock.relations.popularSongs = [ mockSong_1 ]
mock.relations.popularAlbums = [ mockAlbum_1 ]
mock.tags = [ { count: 7, tag: mockTag_1 } ]
mock.webLinks = [ mockWebLink_1 ]

export default {
    "artistType": "Producer",
    "createDate": "2014-08-27T17:07:51",
    "defaultName": "雄之助",
    "defaultNameLanguage": "Japanese",
    "description": "",
    "id": 23981,
    "name": "雄之助",
    "pictureMime": "image/png",
    "relations": {
        "latestAlbums": [
            {
                "additionalNames": "",
                "artistString": "CircusP, 雄之助 feat. 初音ミク V4 (English)",
                "coverPictureMime": "image/jpeg",
                "createDate": "2017-12-23T20:45:18",
                "deleted": false,
                "discType": "Single",
                "id": 23882,
                "name": "Cybernetic",
                "ratingAverage": 5,
                "ratingCount": 1,
                "releaseDate": {
                    "day": 22,
                    "formatted": "12/22/2017",
                    "isEmpty": false,
                    "month": 12,
                    "year": 2017
                },
                "status": "Draft",
                "version": 2
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. various",
                "coverPictureMime": "image/jpeg",
                "createDate": "2017-11-03T11:27:23",
                "deleted": false,
                "discType": "Album",
                "id": 23604,
                "name": "Black or White",
                "ratingAverage": 4.85,
                "ratingCount": 7,
                "releaseDate": {
                    "day": 11,
                    "formatted": "11/11/2017",
                    "isEmpty": false,
                    "month": 11,
                    "year": 2017
                },
                "status": "Finished",
                "version": 9
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "coverPictureMime": "image/jpeg",
                "createDate": "2017-08-28T12:00:24",
                "deleted": false,
                "discType": "Single",
                "id": 23229,
                "name": "Lazy",
                "ratingAverage": 0,
                "ratingCount": 0,
                "releaseDate": {
                    "day": 28,
                    "formatted": "8/28/2017",
                    "isEmpty": false,
                    "month": 8,
                    "year": 2017
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2017-08-31T00:00:00Z",
                    "id": 1513,
                    "name": "ミク誕生祭 2017",
                    "seriesId": 9,
                    "seriesNumber": 2017,
                    "seriesSuffix": "",
                    "status": "Finished",
                    "urlSlug": "mikus-birthday-2017",
                    "version": 4
                },
                "status": "Approved",
                "version": 3
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. various",
                "coverPictureMime": "image/jpeg",
                "createDate": "2017-03-31T14:01:05",
                "deleted": false,
                "discType": "EP",
                "id": 22607,
                "name": "PaIII.Inception / PaIII.Sensation",
                "ratingAverage": 4,
                "ratingCount": 1,
                "releaseDate": {
                    "day": 31,
                    "formatted": "3/31/2017",
                    "isEmpty": false,
                    "month": 3,
                    "year": 2017
                },
                "status": "Approved",
                "version": 5
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-08-22T10:57:53",
                "deleted": false,
                "discType": "Single",
                "id": 19721,
                "name": "Pathos (Single)",
                "ratingAverage": 0,
                "ratingCount": 0,
                "releaseDate": {
                    "day": 22,
                    "formatted": "8/22/2016",
                    "isEmpty": false,
                    "month": 8,
                    "year": 2016
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2016-08-31T00:00:00Z",
                    "id": 1245,
                    "name": "ミク誕生祭 2016",
                    "seriesId": 9,
                    "seriesNumber": 2016,
                    "seriesSuffix": "",
                    "status": "Finished",
                    "urlSlug": "mikus-birthday-2016",
                    "version": 5
                },
                "status": "Finished",
                "version": 4
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. various",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-08-06T17:19:02",
                "deleted": false,
                "discType": "EP",
                "id": 18617,
                "name": "PaⅢ.SENSATION",
                "ratingAverage": 4.75,
                "ratingCount": 8,
                "releaseDate": {
                    "day": 14,
                    "formatted": "8/14/2016",
                    "isEmpty": false,
                    "month": 8,
                    "year": 2016
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2016-08-12T00:00:00Z",
                    "endDate": "2016-08-14T00:00:00Z",
                    "id": 1185,
                    "name": "Comiket 90",
                    "seriesId": 3,
                    "seriesNumber": 90,
                    "seriesSuffix": "",
                    "status": "Finished",
                    "urlSlug": "comiket-90",
                    "version": 3
                },
                "status": "Finished",
                "version": 4
            }
        ],
        "latestEvents": [
            {
                "additionalNames": "マジカルミライ クリエイターズマーケット 2017",
                "category": "AlbumRelease",
                "date": "2017-09-02T00:00:00Z",
                "endDate": "2017-09-03T00:00:00Z",
                "id": 1503,
                "mainPicture": {
                    "urlSmallThumb": "https://static.vocadb.net/img/releaseeventseries/mainSmall/104.png?v=1",
                    "urlThumb": "https://static.vocadb.net/img/releaseeventseries/mainThumb/104.png?v=1",
                    "urlTinyThumb": "https://static.vocadb.net/img/releaseeventseries/mainTiny/104.png?v=1"
                },
                "name": "Magical Mirai Creators Market 2017",
                "series": {
                    "additionalNames": "マジカルミライ クリエイターズマーケット",
                    "category": "AlbumRelease",
                    "deleted": false,
                    "description": "",
                    "id": 104,
                    "name": "Magical Mirai Creators Market",
                    "pictureMime": "image/png",
                    "status": "Finished",
                    "urlSlug": "magical-mirai-creators-market",
                    "version": 1
                },
                "seriesId": 104,
                "seriesNumber": 2017,
                "seriesSuffix": "",
                "status": "Finished",
                "urlSlug": "magical-mirai-creators-market-",
                "venueName": "Makuhari Messe",
                "version": 15
            }
        ],
        "latestSongs": [
            {
                "additionalNames": "",
                "artistString": "雄之助, CircusP feat. 初音ミク V4 (English)",
                "createDate": "2017-12-20T13:08:46",
                "defaultName": "Cybernetic",
                "defaultNameLanguage": "English",
                "favoritedTimes": 2,
                "id": 178125,
                "lengthSeconds": 197,
                "name": "Cybernetic",
                "publishDate": "2017-12-20T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
                "ratingScore": 12,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "http://tn.smilevideo.jp/smile?i=32449999",
                "version": 7
            },
            {
                "additionalNames": "Shinkonsui, Deep Coma",
                "artistString": "雄之助 feat. 初音ミク V4X (Sweet)",
                "createDate": "2017-12-01T12:04:21",
                "defaultName": "深昏睡",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 2,
                "id": 176196,
                "lengthSeconds": 280,
                "name": "深昏睡",
                "originalVersionId": 167947,
                "publishDate": "2017-12-01T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
                "ratingScore": 16,
                "songType": "Remix",
                "status": "Finished",
                "thumbUrl": "https://i1.sndcdn.com/artworks-000263630822-vzjfm2-large.jpg",
                "version": 3
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2017-11-03T11:31:43",
                "defaultName": "Crystal",
                "defaultNameLanguage": "English",
                "favoritedTimes": 3,
                "id": 173341,
                "lengthSeconds": 237,
                "name": "Crystal",
                "publishDate": "2017-11-11T00:00:00Z",
                "pvServices": "Youtube, SoundCloud, Bilibili",
                "ratingScore": 15,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "https://i.ytimg.com/vi/T83HT-rxW1w/default.jpg",
                "version": 7
            },
            {
                "additionalNames": "",
                "artistString": "雄之助 feat. 初音ミク",
                "createDate": "2017-11-03T11:31:43",
                "defaultName": "Black or White -Intro-",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 0,
                "id": 173339,
                "lengthSeconds": 61,
                "name": "Black or White -Intro-",
                "originalVersionId": 173340,
                "publishDate": "2017-11-11T00:00:00Z",
                "pvServices": "SoundCloud",
                "ratingScore": 2,
                "songType": "Remix",
                "status": "Finished",
                "thumbUrl": "https://i1.sndcdn.com/avatars-000189418542-96pu6l-large.jpg",
                "version": 2
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2017-11-03T11:31:43",
                "defaultName": "Black or White",
                "defaultNameLanguage": "English",
                "favoritedTimes": 5,
                "id": 173340,
                "lengthSeconds": 294,
                "name": "Black or White",
                "publishDate": "2017-11-02T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
                "ratingScore": 33,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=32170199",
                "version": 6
            },
            {
                "additionalNames": "",
                "artistString": "Various artists",
                "createDate": "2017-08-28T20:00:11",
                "defaultName": "CITRUS TRAIN",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 0,
                "id": 166436,
                "lengthSeconds": 256,
                "name": "CITRUS TRAIN",
                "originalVersionId": 166435,
                "publishDate": "2017-09-02T00:00:00Z",
                "pvServices": "Nothing",
                "ratingScore": 0,
                "songType": "Instrumental",
                "status": "Finished",
                "thumbUrl": "",
                "version": 4
            },
            {
                "additionalNames": "",
                "artistString": "Various artists",
                "createDate": "2017-08-28T19:55:53",
                "defaultName": "CITRUS TRAIN",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 0,
                "id": 166435,
                "lengthSeconds": 256,
                "name": "CITRUS TRAIN",
                "publishDate": "2017-09-02T00:00:00Z",
                "pvServices": "Nothing",
                "ratingScore": 0,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "",
                "version": 5
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2017-08-09T13:15:51",
                "defaultName": "BREAK IT",
                "defaultNameLanguage": "English",
                "favoritedTimes": 3,
                "id": 164687,
                "lengthSeconds": 253,
                "name": "BREAK IT",
                "publishDate": "2017-08-09T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 35,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "http://tn-skr3.smilevideo.jp/smile?i=31712326",
                "version": 6
            }
        ],
        "popularAlbums": [
            {
                "additionalNames": "Vocalo EDM3",
                "artistString": "Various artists",
                "coverPictureMime": "image/png",
                "createDate": "2016-04-16T05:23:00",
                "deleted": false,
                "discType": "Album",
                "id": 18131,
                "name": "ボカロEDM3",
                "ratingAverage": 5,
                "ratingCount": 3,
                "releaseDate": {
                    "day": 24,
                    "formatted": "4/24/2016",
                    "isEmpty": false,
                    "month": 4,
                    "year": 2016
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2016-04-24T00:00:00Z",
                    "id": 1191,
                    "name": "M3 2016 Spring",
                    "seriesId": 11,
                    "seriesNumber": 2016,
                    "seriesSuffix": "Spring",
                    "status": "Finished",
                    "urlSlug": "m3-2016-spring",
                    "version": 2
                },
                "status": "Finished",
                "version": 17
            },
            {
                "additionalNames": "GETUEISAIKA AZAYAKA",
                "artistString": "Various artists",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-04-07T19:09:04",
                "deleted": false,
                "discType": "Compilation",
                "id": 18067,
                "name": "月影彩花 爛",
                "ratingAverage": 5,
                "ratingCount": 1,
                "releaseDate": {
                    "day": 10,
                    "formatted": "4/10/2016",
                    "isEmpty": false,
                    "month": 4,
                    "year": 2016
                },
                "status": "Draft",
                "version": 4
            },
            {
                "additionalNames": "",
                "artistString": "ジグ feat. various",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-01-14T14:53:13",
                "deleted": false,
                "discType": "EP",
                "id": 16635,
                "name": "SATELLITE",
                "ratingAverage": 5,
                "ratingCount": 1,
                "releaseDate": {
                    "day": 14,
                    "formatted": "1/14/2016",
                    "isEmpty": false,
                    "month": 1,
                    "year": 2016
                },
                "status": "Draft",
                "version": 4
            },
            {
                "additionalNames": "",
                "artistString": "Various artists",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-07-01T21:23:24",
                "deleted": false,
                "discType": "Compilation",
                "id": 18396,
                "name": "Mirage",
                "ratingAverage": 5,
                "ratingCount": 1,
                "releaseDate": {
                    "day": 10,
                    "formatted": "7/10/2016",
                    "isEmpty": false,
                    "month": 7,
                    "year": 2016
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2016-07-10T00:00:00Z",
                    "id": 1217,
                    "name": "The Voc@loid M@ster 35",
                    "seriesId": 1,
                    "seriesNumber": 35,
                    "seriesSuffix": "",
                    "status": "Finished",
                    "urlSlug": "the-vocloid-mster-35",
                    "version": 1
                },
                "status": "Finished",
                "version": 9
            },
            {
                "additionalNames": "",
                "artistString": "雄之助 feat. GUMI, 初音ミク",
                "coverPictureMime": "image/jpeg",
                "createDate": "2015-10-09T20:45:53",
                "deleted": false,
                "discType": "EP",
                "id": 15210,
                "name": "Eclipse-Mini Album-",
                "ratingAverage": 4.88,
                "ratingCount": 9,
                "releaseDate": {
                    "day": 9,
                    "formatted": "10/9/2015",
                    "isEmpty": false,
                    "month": 10,
                    "year": 2015
                },
                "status": "Finished",
                "version": 3
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. various",
                "coverPictureMime": "image/jpeg",
                "createDate": "2016-03-27T13:10:36",
                "deleted": false,
                "discType": "Album",
                "id": 18001,
                "name": "Pathos",
                "ratingAverage": 4.75,
                "ratingCount": 16,
                "releaseDate": {
                    "day": 30,
                    "formatted": "4/30/2016",
                    "isEmpty": false,
                    "month": 4,
                    "year": 2016
                },
                "releaseEvent": {
                    "category": "Unspecified",
                    "date": "2016-04-29T00:00:00Z",
                    "id": 1190,
                    "name": "The Voc@loid M@ster 34",
                    "seriesId": 1,
                    "seriesNumber": 34,
                    "seriesSuffix": "",
                    "status": "Finished",
                    "urlSlug": "the-vocloid-mster-34",
                    "version": 3
                },
                "status": "Finished",
                "version": 11
            }
        ],
        "popularSongs": [
            {
                "additionalNames": "Coppélia",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2017-01-07T12:42:39",
                "defaultName": "Coppelia",
                "defaultNameLanguage": "English",
                "favoritedTimes": 7,
                "id": 145874,
                "lengthSeconds": 306,
                "name": "Coppelia",
                "publishDate": "2017-01-07T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
                "ratingScore": 71,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=30379473",
                "version": 9
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク Append (Solid)",
                "createDate": "2015-02-19T15:19:47",
                "defaultName": "Take Me!!",
                "defaultNameLanguage": "English",
                "favoritedTimes": 7,
                "id": 81310,
                "lengthSeconds": 329,
                "name": "Take Me!!",
                "publishDate": "2015-04-22T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 59,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=25612879",
                "version": 14
            },
            {
                "additionalNames": "Ai no Shoumei",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2015-05-23T06:50:12",
                "defaultName": "Iの証明",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 6,
                "id": 89076,
                "lengthSeconds": 261,
                "name": "Iの証明",
                "publishDate": "2015-05-23T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube",
                "ratingScore": 40,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "https://i.ytimg.com/vi/uj5axBu0htI/default.jpg",
                "version": 7
            },
            {
                "additionalNames": "",
                "artistString": "雄之助 feat. 初音ミク",
                "createDate": "2016-05-20T14:47:36",
                "defaultName": "ARTIFICIAL SKIN(Yunosuke Remix)",
                "defaultNameLanguage": "English",
                "favoritedTimes": 7,
                "id": 125382,
                "lengthSeconds": 243,
                "name": "ARTIFICIAL SKIN(Yunosuke Remix)",
                "originalVersionId": 88563,
                "publishDate": "2016-05-20T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 39,
                "songType": "Remix",
                "status": "Finished",
                "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=28883683",
                "version": 6
            },
            {
                "additionalNames": "El Dorado",
                "artistString": "雄之助, 攻 feat. 初音ミク Append (Solid)",
                "createDate": "2015-01-27T09:31:03",
                "defaultName": "エル・ドラド",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 5,
                "id": 79122,
                "lengthSeconds": 240,
                "name": "エル・ドラド",
                "originalVersionId": 78357,
                "publishDate": "2015-01-26T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 39,
                "songType": "Remaster",
                "status": "Finished",
                "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=25431537",
                "version": 6
            },
            {
                "additionalNames": "",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2017-07-13T13:10:04",
                "defaultName": "Lazy",
                "defaultNameLanguage": "English",
                "favoritedTimes": 4,
                "id": 161655,
                "lengthSeconds": 318,
                "name": "Lazy",
                "publishDate": "2017-07-13T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
                "ratingScore": 38,
                "songType": "Original",
                "status": "Approved",
                "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=31562013",
                "version": 10
            },
            {
                "additionalNames": "Passionate 3 Dot Sensation",
                "artistString": "雄之助, 攻 feat. various",
                "createDate": "2016-08-06T17:21:20",
                "defaultName": "PaⅢ.SENSATION",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 8,
                "id": 130561,
                "lengthSeconds": 233,
                "name": "PaⅢ.SENSATION",
                "publishDate": "2016-09-15T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 38,
                "songType": "Original",
                "status": "Finished",
                "thumbUrl": "https://i.ytimg.com/vi/OMQNhcGZbX4/default.jpg",
                "version": 7
            },
            {
                "additionalNames": "Loop Memory",
                "artistString": "雄之助, 攻 feat. 初音ミク",
                "createDate": "2015-10-17T17:32:09",
                "defaultName": "ループメモリー",
                "defaultNameLanguage": "Japanese",
                "favoritedTimes": 7,
                "id": 103741,
                "lengthSeconds": 343,
                "name": "ループメモリー",
                "originalVersionId": 69392,
                "publishDate": "2015-10-17T00:00:00Z",
                "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
                "ratingScore": 37,
                "songType": "Remaster",
                "status": "Finished",
                "thumbUrl": "http://tn-skr1.smilevideo.jp/smile?i=27385884",
                "version": 5
            }
        ]
    },
    "status": "Finished",
    "tags": [
        {
            "count": 1,
            "tag": {
                "additionalNames": "コンプレクストロ",
                "categoryName": "Genres",
                "id": 72,
                "name": "complextro",
                "urlSlug": "complextro"
            }
        },
        {
            "count": 1,
            "tag": {
                "additionalNames": "ダブステップ",
                "categoryName": "Genres",
                "id": 112,
                "name": "dubstep",
                "urlSlug": "dubstep"
            }
        },
        {
            "count": 2,
            "tag": {
                "additionalNames": "エレクトロハウス, electrohouse",
                "categoryName": "Genres",
                "id": 122,
                "name": "electro-house",
                "urlSlug": "electro-house"
            }
        },
        {
            "count": 1,
            "tag": {
                "additionalNames": "エレクトロポップ",
                "categoryName": "Genres",
                "id": 124,
                "name": "electropop",
                "urlSlug": "electropop"
            }
        },
        {
            "count": 3,
            "tag": {
                "additionalNames": "ダンス ミュージック, dance, dance music, electronic dance music",
                "categoryName": "Genres",
                "id": 1552,
                "name": "EDM",
                "urlSlug": "edm"
            }
        },
        {
            "count": 3,
            "tag": {
                "additionalNames": "転載禁止",
                "categoryName": "Editor notes",
                "id": 1695,
                "name": "do not reupload",
                "urlSlug": "do-not-reupload"
            }
        },
        {
            "count": 1,
            "tag": {
                "additionalNames": "テクノポップ, ミクノポップ",
                "categoryName": "Genres",
                "id": 1698,
                "name": "technopop",
                "urlSlug": "technopop"
            }
        },
        {
            "count": 2,
            "tag": {
                "additionalNames": "",
                "categoryName": "Genres",
                "id": 3114,
                "name": "melodic dubstep",
                "urlSlug": "melodic-dubstep"
            }
        }
    ],
    "version": 20,
    "webLinks": [
        {
            "category": "Official",
            "description": "NND Account",
            "id": 55821,
            "url": "http://www.nicovideo.jp/user/31764541"
        },
        {
            "category": "Official",
            "description": "Piapro",
            "id": 60123,
            "url": "http://piapro.jp/Yunosuke41"
        },
        {
            "category": "Official",
            "description": "NND MyList",
            "id": 60124,
            "url": "http://www.nicovideo.jp/mylist/38919429"
        },
        {
            "category": "Official",
            "description": "Twitter",
            "id": 63621,
            "url": "https://twitter.com/bass_ynk"
        },
        {
            "category": "Official",
            "description": "SoundCloud",
            "id": 68420,
            "url": "https://soundcloud.com/bass_ynk"
        },
        {
            "category": "Official",
            "description": "Facebook",
            "id": 79859,
            "url": "https://www.facebook.com/yunosuke.composer"
        },
        {
            "category": "Official",
            "description": "Tumblr",
            "id": 87095,
            "url": "http://yunosuke-official.tumblr.com/"
        },
        {
            "category": "Official",
            "description": "SoundCloud (Non-Vocaloid)",
            "id": 93508,
            "url": "https://soundcloud.com/yunosuke_jpn"
        },
        {
            "category": "Reference",
            "description": "UtaiteDB",
            "id": 97753,
            "url": "http://utaitedb.net/Ar/16606"
        },
        {
            "category": "Official",
            "description": "YouTube Channel",
            "id": 97754,
            "url": "https://www.youtube.com/channel/UCkv_bAMJEoNJWThutrtlUQQ"
        },
        {
            "category": "Official",
            "description": "Twitter (Eng)",
            "id": 107038,
            "url": "https://twitter.com/yunosuke_en"
        },
        {
            "category": "Official",
            "description": "Bandcamp",
            "id": 114865,
            "url": "https://yunosuke-official.bandcamp.com"
        },
        {
            "category": "Official",
            "description": "Bilibili",
            "id": 121319,
            "url": "http://space.bilibili.com/25480353/#!/index"
        },
        {
            "category": "Official",
            "description": "Weibo",
            "id": 121320,
            "url": "http://www.weibo.com/u/5876832665?refer_flag=1005050010_&is_hot=1&noscale_head=1#_0"
        }
    ]
}