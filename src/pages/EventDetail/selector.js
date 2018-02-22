import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectEventEntity } from './../../selectors'

const selectEventDetail = () => (state) => state.get('eventDetail');
const selectEventResult = () => createSelector(selectEventDetail(), state => state.get('event', 0))
const selectLoading = () => createSelector(selectEventDetail(), state => state.get('loading', false))

const selectEvent = () => createSelector(
    selectEventDetail(),
    selectEventEntity(),
    (eventDetailState, eventEntity) => {
        let eventId = eventDetailState.get('event')

        if(!eventId || !eventEntity.has(eventId.toString())) {
            return {};
        }

        return eventEntity.get(eventId.toString()).toJS();
    }
);

export {
    selectEventDetail,
    selectEventResult,
    selectEvent,
    selectLoading
};