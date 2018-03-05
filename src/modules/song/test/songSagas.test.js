import { fetchLatestSongs, fetchFollowedSongs, fetchSongDetail } from './../songSagas'
import api from './../songApi'
import { call, put, select } from 'redux-saga/effects'
import * as actions from './../songActions'
import * as appActions from './../../../app/appActions'
import * as mock from './../../../helper/mockGenerator'
import { selectFollowedArtistIds } from './../../user/userSelector'

describe('Test song sagas', () => {
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
})