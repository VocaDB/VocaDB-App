import * as actions from "../tagActions";
import * as mockGenerator from './../../../helper/mockGenerator';

describe('Test tag action', () => {
    it('should create fetch tag detail action', () => {
        const actualResult = actions.fetchTagDetail(1);
        const expectedPayload = { loading: true, id: 1 }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })

    it('should create fetch tag detail success action', () => {
        const mockTag1 = mockGenerator.CreateTag({ id: 1 })
        const actualResult = actions.fetchTagDetailSuccess(mockTag1);
        const expectedPayload = {
            entities: {
                tags: {
                    '1': mockTag1
                }
            },
            result: 1
        }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})