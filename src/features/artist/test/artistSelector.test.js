import {
    selectArtist,
    selectArtistEntity,
    selectArtistDetail,
    selectIsFollowedArtist } from './../artistSelector'
import * as mockGenerator from '../../../common/helper/mockGenerator'

describe('Test artist selector', () => {

    let state;
    let entities;
    let artist1;
    let artist2;

    beforeEach(() => {

        artist1 = mockGenerator.CreateArtist({ id: 1 })
        artist2 = mockGenerator.CreateArtist({ id: 2 })

        entities = {
            artists: {
                '1': artist1,
                '2': artist2
            }
        }

        state = {
            entities,
            artist: {
                detail: 0
            }
        }
    });


    it('should return artist state correctly', () => {
        const actualResult = selectArtist()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.artist)
    })

    it('should return artist entity state correctly', () => {
        const actualResult = selectArtistEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.artists)
    })

    it('should return artist detail correctly', () => {
        state.artist.detail = artist1.id

        const actualResult = selectArtistDetail()(state);
        const expectedResult = artist1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })

    it('should return followed artist is true', () => {
        state.artist = {
            detail: artist1.id,
            followed: [ 5, 4, 3, 2, 1 ]
        }

        const actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toBeTruthy();
    })

    it('should return followed artist is false', () => {
        let actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toEqual(false);

        state.artist.detail = artist1.id
        state.artist = {
            detail: artist1.id,
            followed: [ 5, 4, 3, 2 ]
        }

        actualResult = selectIsFollowedArtist()(state);

        expect(actualResult).toEqual(false);
    })
})