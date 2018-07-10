import _ from 'lodash';
import i18n from './../../../common/i18n';

export const durationHoursHelper = {
    labels: {
        Daily: i18n.daily,
        Weekly: i18n.weekly,
        Monthly: i18n.monthly,
        Overall: i18n.overall
    },
    values: {
        Daily: 24,
        Weekly: 168,
        Monthly: 720,
        Overall: 0
    },
    labelToValue: function(label) {
        return this.values[label];
    },
    valueToLabel: function(value) {
        const selectedKey = _.findKey(this.values, v => v === value)
        return this.labels[selectedKey];
    },
    labelsToArray: function() {
        return _.values(this.labels);
    },
    indexToValue: function(index) {
        const label = _.keys(this.labels)[index];
        return this.labelToValue(label);
    },
    indexOfLabel: function(label) {
        return this.labelsToArray().indexOf(label);
    },
    valueToIndex: function(value) {
        return _.values(this.values).indexOf(value);
    }
}

export const filterItems = [
    {
        label: i18n.newlyAdded,
        value: 'CreateDate'
    },
    {
        label: i18n.newlyPublished,
        value: 'PublishDate'
    },
    {
        label: i18n.popularity,
        value: 'Popularity'
    }
]

export const vocalistItems = [
    {
        label: i18n.all,
        value: 'All'
    },
    {
        label: i18n.vocaloid,
        value: 'Vocaloid'
    },
    {
        label: i18n.utau,
        value: 'UTAU'
    },
    {
        label: 'CeVIO',
        value: 'Other'
    }
]