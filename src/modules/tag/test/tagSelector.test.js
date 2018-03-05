import {
    selectTag,
    selectTagEntity,
    selectTagDetail } from './../tagSelector'
import * as mockGenerator from './../../../helper/mockGenerator'

describe('Test tag selector', () => {

    let state;
    let entities;
    let tag1;
    let tag2;

    beforeEach(() => {

        tag1 = mockGenerator.CreateTag({ id: 1 })
        tag2 = mockGenerator.CreateTag({ id: 2 })

        entities = {
            tags: {
                '1': tag1,
                '2': tag2
            }
        }

        state = {
            entities,
            tag: {
                detail: 0
            }
        }
    });


    it('should return tag state correctly', () => {
        const actualResult = selectTag()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(state.tag)
    })

    it('should return tag entity state correctly', () => {
        const actualResult = selectTagEntity()(state);
        expect(actualResult).toBeTruthy()
        expect(actualResult).toEqual(entities.tags)
    })

    it('should return tag detail correctly', () => {
        state.tag.detail = tag1.id

        const actualResult = selectTagDetail()(state);
        const expectedResult = tag1;

        expect(actualResult).toBeTruthy();
        expect(actualResult).toEqual(expectedResult)
    })
})