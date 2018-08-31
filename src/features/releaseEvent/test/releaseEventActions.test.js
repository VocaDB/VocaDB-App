import { fetchLatestReleaseEvents, fetchReleaseEventDetail } from "../releaseEventActions";

describe('Test releaseEvent action', () => {
    it('should create fetch latest releaseEvent action success', () => {
        const actualResult = fetchLatestReleaseEvents();
        const expectedPayload = { loading: true }

        expect(actualResult).toBeTruthy()
        expect(actualResult.error).toEqual(false)
        expect(actualResult.payload).toEqual(expectedPayload)
        expect(actualResult.type).toBeTruthy()
    })
})