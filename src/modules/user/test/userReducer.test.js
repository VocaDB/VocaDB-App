import reducer, { defaultState } from '../userReducer'
import * as actions from '../userActions'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('User reducer test state', () => {

    let state = {}

    beforeEach(() => {
        state = {
            followedArtists: []
        }
    });

    it('Should set default state correctly', () => {
        expect(defaultState).toBeTruthy()
        expect(defaultState).toEqual(state)
    })

    it('Should follow artist', () => {
        const artist = mockGenerator.CreateArtist()
        const artist2 = mockGenerator.CreateArtist({ id: 2 })

        let exepctedState = { ...state, followedArtists: [ artist.id ] }
        let nextState = reducer(state, actions.followArtist(artist))

        expect(nextState).toEqual(exepctedState);

        exepctedState = { ...state, followedArtists: [ artist2.id, artist.id ] }
        nextState = reducer(nextState, actions.followArtist(artist2))

        expect(nextState).toEqual(exepctedState);
    })

    it('Should not add duplicated artist', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        state.followedArtists = [ artist2.id, artist1.id ];

        let exepctedState = { ...state, followedArtists: [ artist2.id, artist1.id ] }
        let nextState = reducer(state, actions.followArtist(artist2))

        expect(nextState).toEqual(exepctedState);
    })

    it('Should return state when invalid action called', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        state.followedArtists = [ artist1.id ];

        let nextState = reducer(state, actions.followArtist())

        expect(nextState).toEqual(state);
    })

    it('Should unFollow artist', () => {
        const artist1 = mockGenerator.CreateArtist({ id: 1 })
        const artist2 = mockGenerator.CreateArtist({ id: 2 })
        state.followedArtists = [ artist2.id, artist1.id  ];

        let exepctedState = { ...state, followedArtists: [ artist1.id ] }
        let nextState = reducer(state, actions.unFollowArtist(artist2))

        expect(nextState).toEqual(exepctedState);
    })
})