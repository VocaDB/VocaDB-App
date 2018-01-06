import { prependEntries } from "./search.utils";
import config from "../../constants/config";

const genEntries = size => {
    let entries = []
    for(let i =0; i<size; i++) {
        entries.push({
            id: i,
            entryType: 'Artist',
            name: 'Miku'
        })
    }
    return entries
}

describe('Prepend entries test', () => {
    it('should return new list', () => {
        expect(prependEntries(undefined, { id: 1, name: 'Miku' })).toEqual([{ id: 1, name: 'Miku' }])
    })

    it('should prepend exists list', () => {
        expect(prependEntries([{ id: 1, name: 'Miku' }], { id: 2, name: 'Luka' })).toEqual([{ id: 2, name: 'Luka' }, { id: 1, name: 'Miku' }])
    })

    it('should not prepend duplicated id', () => {
        expect(prependEntries([{ id: 1, name: 'Miku' }], { id: 1, name: 'Luka' })).toEqual([{ id: 1, name: 'Miku' }])
    })

    it('should remove last item when prepend exceed maximum', () => {

        let recentList = genEntries(config.maxRecentSearch);
        let newEntry = { id: 99, entryType: 'Song', name: 'Melt' }
        let newRecentList = [newEntry, ...recentList]
        newRecentList.pop()

        expect(prependEntries(recentList, newEntry)).toEqual(newRecentList)
    })
})