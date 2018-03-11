import { createSelector } from 'reselect';

export const selectReleaseEvent = () => state => state.releaseEvent
export const selectReleaseEventEntity = () => state => (state.entities && state.entities.releaseEvents)? state.entities.releaseEvents : {}
export const selectLatestReleaseEventIds = () => createSelector(
    selectReleaseEvent(),
    releaseEvent => releaseEvent.all
)
export const selectReleaseEventDetailId = () => createSelector(
    selectReleaseEvent(),
    releaseEvent => releaseEvent.detail
)

export const selectLatestReleaseEvents = () => createSelector(
    selectLatestReleaseEventIds(),
    selectReleaseEventEntity(),
    (releaseEventIds, releaseEventEntity) => releaseEventIds
        .filter(id => (id != undefined && releaseEventEntity[id.toString()]))
        .map(id => releaseEventEntity[id.toString()])
)

export const selectReleaseEventDetail = () => createSelector(
    selectReleaseEventDetailId(),
    selectReleaseEventEntity(),
    (releaseEventDetailId, releaseEventEntity) => releaseEventEntity[releaseEventDetailId.toString()]
)