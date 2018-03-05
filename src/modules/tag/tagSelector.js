import { createSelector } from 'reselect';

export const selectTag = () => state => state.tag
export const selectTagEntity = () => state => (state.entities && state.entities.tags)? state.entities.tags : {}
export const selectTagDetailId = () => createSelector(
    selectTag(),
    tag => tag.detail
)

export const selectTagDetail = () => createSelector(
    selectTagDetailId(),
    selectTagEntity(),
    (tagDetailId, tagEntity) => tagEntity[tagDetailId.toString()]
)