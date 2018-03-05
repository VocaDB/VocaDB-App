import { selectLoading, selectError } from '../appSelector'

describe('Test app selector', () => {

    let state;

    beforeEach(() => {
        state = {
            loading: false,
            error: false
        }
    });

    it('should return app error is true', () => {
        state.error = true
        const actualResult = selectError()(state);
        expect(actualResult).toBeTruthy()
    })

    it('should return app loading is true', () => {
        state.loading = true
        const actualResult = selectLoading()(state);
        expect(actualResult).toBeTruthy()
    })
})