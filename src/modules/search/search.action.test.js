import * as actions from './search.action'
import * as actionTypes from './search.action.type'

describe('Search action test', () => {
    it('should save new entry to recent list', () => {

        const newEntry = {
            id: 2,
            name: 'Gumi'
        }

        const expectedAction = {
            type: actionTypes.SAVE_RECENT,
            payload: {
                entry: newEntry,
            },
            error: false
        }

        expect(actions.saveRecent(newEntry)).toEqual(expectedAction)
    })
})