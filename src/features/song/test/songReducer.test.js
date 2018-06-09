import reducer from './../songReducer'
import * as actions from './../songActions'
import * as mockGenerator from '../../../common/helper/mockGenerator'
import { defaultSearchParams } from "../songConstant";

describe('Test song reducer', () => {

    let song1 = {};
    let song2 = {};

    beforeEach(() => {
        song1 = mockGenerator.CreateSong({ id: 1 })
        song2 = mockGenerator.CreateSong({ id: 2 })
    })

    it('should return previous state when incorrect action called', () => {
        let nextState = reducer({ a: '1' }, undefined)

        expect(nextState).toBeTruthy()
        expect(nextState.a).toBeTruthy()
    })

    it('should not merge duplicated params when fetch search song', () => {
        const expectedResult = { nameMatchMode: 'auto', artistId: [ 1, 2 ] }
        let currentState = {
            searchParams: { nameMatchMode: 'auto', artistId: [ 1, 2 ] }
        }

        let nextState = reducer(currentState, actions.fetchSearchSongs({ artistId: [ 2 ] }))

        expect(nextState).toBeTruthy()
        expect(nextState.searchParams).toBeTruthy()
        expect(nextState.searchParams).toEqual(expectedResult)
    })


    it('should return state correctly when fetch highlighted songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchHighlightedSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.highlighted).toBeTruthy()
        expect(nextState.highlighted).toEqual(expectedResult)
    })

    it('should return state correctly when fetch latest songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchLatestSongsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.all).toBeTruthy()
        expect(nextState.all).toEqual(expectedResult)
    })

    it('should return state correctly when fetch followed songs success', () => {
        const mockResponse = [ song1, song2 ]
        const expectedResult = [ song1.id, song2.id ]

        let nextState = reducer({}, actions.fetchFollowedSongsSuccess(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.followed).toBeTruthy()
        expect(nextState.followed).toEqual(expectedResult)
    })

    it('should add filter tag', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })

        let nextState = reducer({}, actions.addFilterTag(tag1))
        nextState = reducer(nextState, actions.addFilterTag(tag2))

        expect(nextState).toBeTruthy()
        expect(nextState.filterTags).toBeTruthy()
        expect(nextState.filterTags).toEqual([ tag1.id, tag2.id ])
    })

    it('should remove filter tag', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })
        let nextState = { filterTags: [ tag1.id, tag2.id ] }
        nextState = reducer(nextState, actions.removeFilterTag(tag1))

        expect(nextState).toBeTruthy()
        expect(nextState.filterTags).toBeTruthy()
        expect(nextState.filterTags).toEqual([ tag2.id ])
    })

    it('should add selected filter tag', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })

        let nextState = reducer({}, actions.addSelectedFilterTag(tag1))
        nextState = reducer(nextState, actions.addSelectedFilterTag(tag2))

        expect(nextState).toBeTruthy()
        expect(nextState.searchParams).toBeTruthy()
        expect(nextState.searchParams.tagId).toEqual([ tag1.id, tag2.id ])
    })

    it('should remove selected filter tag', () => {
        const tag1 = mockGenerator.CreateTag({ id: 1 })
        const tag2 = mockGenerator.CreateTag({ id: 2 })
        let nextState = {
            searchParams: {
                tagId: [ tag1.id, tag2.id ]
            }
        }
        nextState = reducer(nextState, actions.removeSelectedFilterTag(tag1))

        expect(nextState).toBeTruthy()
        expect(nextState.searchParams).toBeTruthy()
        expect(nextState.searchParams.tagId).toEqual([ tag2.id ])
    })

    it('should change ranking duration hour', () => {
        let nextState = reducer({}, actions.changeDurationHours(720))
        nextState = reducer({}, actions.changeDurationHours(24))

        expect(nextState).toBeTruthy()
        expect(nextState.ranking).toBeTruthy()
        expect(nextState.ranking.durationHours).toEqual(24)
    })

    it('should change ranking filter by', () => {
        let nextState = reducer({}, actions.changeFilterBy('CreateDate'))
        nextState = reducer({}, actions.changeFilterBy('PublishDate'))

        expect(nextState).toBeTruthy()
        expect(nextState.ranking).toBeTruthy()
        expect(nextState.ranking.filterBy).toEqual('PublishDate')
    })

    it('should change ranking vocalist', () => {
        let nextState = reducer({}, actions.changeVocalist('Vocaloid'))
        nextState = reducer({}, actions.changeVocalist('UTAU'))

        expect(nextState).toBeTruthy()
        expect(nextState.ranking).toBeTruthy()
        expect(nextState.ranking.vocalist).toEqual('UTAU')
    })

    it('should change ranking vocalist', () => {
        const mockResponse = [ song1, song2 ]

        let nextState = reducer({}, actions.updateRankingResult(mockResponse))

        expect(nextState).toBeTruthy()
        expect(nextState.ranking).toBeTruthy()
        expect(nextState.ranking.songs).toEqual([1, 2])
    })

        it('should add new search param', () => {

            let nextState = reducer({}, actions.updateSearchParams('songTypes', 'Cover'))

            expect(nextState).toBeTruthy()
            expect(nextState.searchPage).toBeTruthy()
            expect(nextState.searchPage.params).toBeTruthy()

            let expectedSearchParams = {
                songTypes: 'Cover'
            }

            expect(nextState.searchPage.params).toEqual(expectedSearchParams)
        })

    it('should set default and update search params', () => {

        let nextState = reducer({}, actions.updateSearchParams('songTypes', 'Cover'))

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            ...defaultSearchParams,
            songTypes: 'Cover'
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should update search params if exists', () => {

        let searchPage = {
            params: {
                start: 0,
                songTypes: 'Original',
                artistId: [ 1, 2 ],
                tagId: [ 3, 4 ]
            }
        }

        let nextState = reducer({ searchPage }, actions.updateSearchParams('songTypes', 'Cover'))

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            start: 0,
            songTypes: 'Cover',
            artistId: [ 1, 2 ],
            tagId: [ 3, 4 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should remove artist param by artist id', () => {
        let searchPage = {
            params: {
                artistId: [ 1, 2, 3 ]
            }
        }

        let nextState = reducer({ searchPage }, actions.removeSearchParamsArray('artistId', 3));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            artistId: [ 1, 2 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should remove original state when have no artist id', () => {
        let nextState = reducer({}, actions.removeSearchParamsArray('artistId', 5));
        expect(nextState).toEqual({})
    })

    it('should remove default state when try to remove non-exists search params artist id', () => {
        let searchPage = {
            params: {
                artistId: [ 1, 2, 3 ]
            }
        }

        let nextState = reducer({ searchPage }, actions.removeSearchParamsArray('artistId', 4));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()
        expect(nextState.searchPage.params).toEqual(searchPage.params)
    })

    it('should add artist id to search params', () => {

        let searchPage = {
            params: {
                songType: 'Cover'
            }
        }

        let nextState = reducer({ searchPage }, actions.addSearchParamsArray('artistId', 4));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            songType: 'Cover',
            artistId: [ 4 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should add artist id and set default to search params', () => {

        let nextState = reducer({}, actions.addSearchParamsArray('artistId', 4));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            ...defaultSearchParams,
            artistId: [ 4 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should append artist id to search params', () => {
        let searchPage = {
            params: {
                artistId: [ 1, 2, 3 ]
            }
        }

        let nextState = reducer({ searchPage }, actions.addSearchParamsArray('artistId', 4));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            artistId: [ 1, 2, 3, 4 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should not add duplicated artist id to search params', () => {
        let searchPage = {
            params: {
                artistId: [ 1, 2, 3 ]
            }
        }

        let nextState = reducer({ searchPage }, actions.addSearchParamsArray('artistId', 2));

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.params).toBeTruthy()

        let expectedSearchParams = {
            artistId: [ 1, 2, 3 ]
        }

        expect(nextState.searchPage.params).toEqual(expectedSearchParams)
    })

    it('should append search result', () => {
        let searchPage = {
            results: [ 1, 2 ,3 ]
        }

        let mockResult = [
            { id: 8, name: 'A' },
            { id: 2, name: 'B' },
            { id: 3, name: 'C' },
            { id: 4, name: 'D' },
            { id: 5, name: 'E' },
        ]

        let nextState = reducer({ searchPage }, actions.addSearchResult(mockResult))

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.results).toBeTruthy()

        let expectedSearchResults = [ 1, 2, 3, 8, 4, 5 ]

        expect(nextState.searchPage.results).toEqual(expectedSearchResults)
    })

    it('should set search result', () => {
        let searchPage = {
            results: [ 1, 2 ,3 ]
        }

        let mockResult = [
            { id: 8, name: 'A' },
            { id: 2, name: 'B' },
            { id: 3, name: 'C' },
            { id: 4, name: 'D' },
            { id: 5, name: 'E' },
        ]

        let nextState = reducer({ searchPage }, actions.setSearchResult(mockResult))

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toBeTruthy()
        expect(nextState.searchPage.results).toBeTruthy()

        let expectedSearchResults = [ 8, 2, 3, 4, 5 ]

        expect(nextState.searchPage.results).toEqual(expectedSearchResults)
    })

    it('should extend start search params from given results', () => {
        let searchPage = {
            params: {
                start: 0
            },
            results: [ 1, 2, 3 ]
        }

        let nextState = reducer({ searchPage }, actions.fetchMoreSearchResult())

        let expectedSeachPage = {
            params: { start: 3 },
            results: [ 1, 2, 3 ]
        }

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toEqual(expectedSeachPage)
    })

    it('should add default start search params when got empty state', () => {
        let nextState = reducer({}, actions.fetchMoreSearchResult())

        let expectedSeachPage = {
            params: { start: 0 },
            results: []
        }

        expect(nextState).toBeTruthy()
        expect(nextState.searchPage).toEqual(expectedSeachPage)
    })
})
