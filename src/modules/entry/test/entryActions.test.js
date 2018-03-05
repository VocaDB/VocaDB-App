import * as actions from '../entryActions';
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Test entry action', () => {
    it('should create clear search action', () => {
        const actualResult = actions.clearSearch()
        const expectedPayload = undefined

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create search entries action', () => {
        const actualResult = actions.searchEntries('abc')
        const expectedPayload = { query: 'abc' }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create search entries success action', () => {
        const mockEntry1 = mockGenerator.CreateEntry('Song', { id: 1 })
        const mockEntry2 = mockGenerator.CreateEntry('Artist', { id: 2 })
        const mockList = [ mockEntry1, mockEntry2 ]
        const actualResult = actions.searchEntriesSuccess(mockList)
        const expectedPayload = {
            entities: {
                entries: {
                    '1': mockEntry1,
                    '2': mockEntry2
                }
            },
            result: [ 1, 2 ]
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create save recent search action', () => {
        const mockEntry = mockGenerator.CreateEntry('Song', { id: 1 })
        const actualResult = actions.saveRecentSearch(mockEntry)
        const expectedPayload = { entry: mockEntry }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})