import { fetchLatestReleaseEvents, fetchReleaseEventDetail } from './../releaseEventSagas'
import api from './../releaseEventApi'
import { call, put, all } from 'redux-saga/effects'
import * as actions from './../releaseEventActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'

describe('Test releaseEvent sagas', () => {
    it('Should fetch releaseEvent success', () => {
        const action = actions.fetchLatestReleaseEvents()
        const gen = fetchLatestReleaseEvents(action)

        expect(gen.next().value).toEqual(call(api.getRecentReleaseEvents));

        const mockReleaseEventItems = [ mock.CreateEvent() ]
        const mockResponse = { items: mockReleaseEventItems }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchLatestReleaseEventsSuccess(mockReleaseEventItems)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch releaseEvent detail success', () => {
        const action = actions.fetchReleaseEventDetail(1)
        const gen = fetchReleaseEventDetail(action)

        const mockReleaseEventItem = mock.CreateEvent()
        const mockSongs = [ mock.CreateSong({ id: 1 }), mock.CreateSong({ id: 2 }) ]
        const mockAlbums = [ mock.CreateAlbum({ id: 1 }), mock.CreateAlbum({ id: 2 }) ]

        expect(gen.next([mockReleaseEventItem, mockSongs, mockAlbums]).value).toEqual(all([
            call(api.getReleaseEvent, 1),
            call(api.getPublishedSongs, 1),
            call(api.getAlbums, 1)
        ]));

        // expect(gen.next(mockReleaseEventItem).value).toEqual(put(actions.fetchReleaseEventDetailSuccess(mockReleaseEventItem)));
        // expect(gen.next(mockSongs).value).toEqual(put(actions.fetchReleaseEventPublishedSongsSuccess(mockSongs)));
        // expect(gen.next(mockAlbums).value).toEqual(put(actions.fetchReleaseEventAlbumsSuccess(mockAlbums)));
        //u
        // expect(gen.next().value).toEqual(put(actions.fetchReleaseEventDetailSuccess(mockReleaseEventItem)));
        // expect(gen.next()).toEqual({});
    })

    it('Should return error when no id', () => {
        const action = actions.fetchReleaseEventDetail()
        const gen = fetchReleaseEventDetail(action)

        expect(gen.next().value).toEqual(put(appActions.requestError(new Error("id is undefined"))));

        expect(gen.next().done).toBeTruthy();
    })
})