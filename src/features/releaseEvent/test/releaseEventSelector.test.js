import {
    selectReleaseEvent,
    selectLatestReleaseEvents,
    selectReleaseEventEntity,
    selectReleaseEventDetail,
    selectPublishedSongs } from './../releaseEventSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test releaseEvent selector', () => {

    let state;
    let entities;
    let releaseEvent1;
    let releaseEvent2;
    let song1;
    let song2;

    beforeEach(() => {

        releaseEvent1 = mockGenerator.CreateEvent({ id: 1 })
        releaseEvent2 = mockGenerator.CreateEvent({ id: 2 })

        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })

        entities = {
            releaseEvents: {
                '1': releaseEvent1,
                '2': releaseEvent2
            },
            songs: {
                '1': song1,
                '2': song2
            }
        }

        state = {
            entities,
            releaseEvent: {
                all: [],
                detail: 0
            }
        }
    });


    it('should return releaseEvent state correctly', () => {
        const actualResult = selectReleaseEvent()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.releaseEvent)
    })

    it('should return releaseEvent entity state correctly', () => {
        const actualResult = selectReleaseEventEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.releaseEvents)
    })

    it('should return latest releaseEvents correctly', () => {
        state.releaseEvent.all = [ releaseEvent2.id, releaseEvent1.id ]

        const actualResult = selectLatestReleaseEvents()(state);
        const expectedResult = [ releaseEvent2, releaseEvent1 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return empty of latest releaseEvents', () => {
        const actualResult = selectLatestReleaseEvents()(state);
        const expectedResult = [];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return empty of latest releaseEvents when entities is undefined', () => {
        state.entities = undefined

        const actualResult = selectLatestReleaseEvents()(state);
        const expectedResult = [];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should not return undefined releaseEvent when not found in entities', () => {
        state.releaseEvent.all = [ releaseEvent2.id, releaseEvent1.id ]
        state.entities = { releaseEvents: { '2': releaseEvent2 } }

        const actualResult = selectLatestReleaseEvents()(state);
        const expectedResult = [ releaseEvent2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return releaseEvent detail correctly', () => {
        state.releaseEvent.detail = releaseEvent1.id

        const actualResult = selectReleaseEventDetail()(state);
        const expectedResult = releaseEvent1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return published songs', () => {
        state.releaseEvent.detail = releaseEvent1.id
        state.releaseEvent.publishedSongs = [ 1, 2 ]
        const actualResult = selectPublishedSongs()(state);
        const expectedResult = [ song1, song2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })
})