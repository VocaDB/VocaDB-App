import { fetchSearchSongs, fetchLatestSongs, fetchFollowedSongs, fetchSongDetail, fetchRanking } from './../songSagas'
import { selectSearchParams, selectRankingState } from './../songSelector'
import { delay } from 'redux-saga'
import api from './../songApi'
import { call, put, select } from 'redux-saga/effects'
import * as actions from './../songActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'
import { selectFollowedArtistIds } from './../../user/userSelector'

describe('Test song sagas', () => {
    it('Should fetch search song success', () => {
        const params = { artistIds: [ 1, 2 ] }
        const action = actions.fetchSearchSongs(params)
        const gen = fetchSearchSongs(action)

        expect(JSON.stringify(gen.next(params).value)).toEqual(JSON.stringify(select(selectSearchParams())));

        expect(gen.next(params).value).toEqual(call(delay, 500))

        expect(gen.next(params).value).toEqual(call(api.find, params));

        const mockSongItems = [ mock.CreateSong() ]
        const mockResponse = { items: mockSongItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchSearchSongsSuccess(mockSongItems, false)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch search song success with append', () => {
        const params = { artistIds: [ 1, 2 ], start: 20 }
        const action = actions.fetchSearchSongs(params)
        const gen = fetchSearchSongs(action)

        expect(JSON.stringify(gen.next(params).value)).toEqual(JSON.stringify(select(selectSearchParams())));

        expect(gen.next(params).value).toEqual(call(delay, 500))

        expect(gen.next(params).value).toEqual(call(api.find, params));

        const mockSongItems = [ mock.CreateSong() ]
        const mockResponse = { items: mockSongItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchSearchSongsSuccess(mockSongItems, true)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch song success', () => {
        const action = actions.fetchLatestSongs()
        const gen = fetchLatestSongs(action)

        expect(gen.next().value).toEqual(call(api.getRecentSongs));

        const mockSongItems = [ mock.CreateSong() ]
        const mockResponse = { items: mockSongItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchLatestSongsSuccess(mockSongItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch followed song by artists success', () => {
        const mockArtistIds = [ 1, 2 ]
        const action = actions.fetchFollowedSongs()
        const mockSongItems = [ mock.CreateSong() ]
        const mockResponse = { items: mockSongItems }

        const generator = fetchFollowedSongs(action)

        let next = generator.next()
        let selectArtistsIds = select(selectFollowedArtistIds());
        expect(JSON.stringify(next.value)).toEqual(JSON.stringify(selectArtistsIds));

        next = generator.next(mockArtistIds)
        expect(next.value).toEqual(call(api.getFollowedSongs, mockArtistIds));

        next = generator.next(mockResponse)
        expect(next.value).toEqual(put(actions.fetchFollowedSongsSuccess(mockSongItems)));

        next = generator.next()
        expect(next.done).toBeTruthy();
    })

    it('Should fetch empty followed songs when no artists', () => {
        const action = actions.fetchFollowedSongs()
        const mockSongItems = []
        const mockResponse = { items: mockSongItems }

        const generator = fetchFollowedSongs(action)

        let next = generator.next()
        let selectArtistsIds = select(selectFollowedArtistIds());
        expect(JSON.stringify(next.value)).toEqual(JSON.stringify(selectArtistsIds));

        next = generator.next(mockResponse)
        expect(next.value).toEqual(put(actions.fetchFollowedSongsSuccess(mockSongItems)));

        next = generator.next()
        expect(next.done).toBeTruthy();
    })

    it('Should fetch song detail success', () => {
        const action = actions.fetchSongDetail(1)
        const gen = fetchSongDetail(action)

        expect(gen.next().value).toEqual(call(api.getSong, 1));

        const mockSongItem = mock.CreateSong()
        expect(gen.next(mockSongItem).value).toEqual(put(actions.fetchSongDetailSuccess(mockSongItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should return error when no id', () => {
        const action = actions.fetchSongDetail()
        const gen = fetchSongDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch ranking songs', () => {
        const action = actions.changeVocalist('UTAU')
        const mockSongItems = [ mock.CreateSong() ]

        const generator = fetchRanking(action)

        let next = generator.next()
        let rankingState = select(selectRankingState());
        expect(JSON.stringify(next.value)).toEqual(JSON.stringify(rankingState));

        const params = {
            durationHours: rankingState.durationHours,
            filterBy: rankingState.filterBy,
            vocalist: rankingState.vocalist
        }

        next = generator.next(params)
        expect(next.value).toEqual(call(api.getTopRated, params));

        next = generator.next(mockSongItems)
        expect(next.value).toEqual(put(actions.updateRankingResult(mockSongItems)));

        next = generator.next()
        expect(next.done).toBeTruthy();
    })
})