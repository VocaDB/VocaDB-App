import {
    selectEntry,
    selectEntryEntity,
    selectQuery,
    selectRecent,
    selectEntries } from './../entrySelector'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Test entry selector', () => {

    let state;
    let entities;
    let entry1;
    let entry2;

    beforeEach(() => {

        entry1 = mockGenerator.CreateEntry('Song', { id: 1 })
        entry2 = mockGenerator.CreateEntry('Artist', { id: 2 })

        entities = {
            entries: {
                '1': entry1,
                '2': entry2
            }
        }

        state = {
            entities,
            entry: {
                query: '',
                entries: [],
                recent: []
            }
        }
    });


    it('should return entry state', () => {
        const actualResult = selectEntry()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.entry)
    })

    it('should return entry entity state', () => {
        const actualResult = selectEntryEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.entries)
    })

    it('should return query', () => {
        state.entry.query = 'abc'

        const actualResult = selectQuery()(state);
        const expectedResult = 'abc';

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return recent', () => {
        state.entry.recent = [ entry1.id, entry2.id ]

        const actualResult = selectRecent()(state);
        const expectedResult = [ entry1, entry2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return entries', () => {
        state.entry.entries = [ entry1.id, entry2.id ]

        const actualResult = selectEntries()(state);
        const expectedResult = [ entry1, entry2 ];

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })
})