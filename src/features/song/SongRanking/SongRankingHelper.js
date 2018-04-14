export const durationHoursHelper = {
    labels: {
        Daily: 'Daily',
        Weekly: 'Weekly',
        Monthly: 'Monthly',
        Overall: 'Overall'
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
        return this.labels[selectedKey]
    },
    labelsToArray: function() {
        return _.keys(this.labels)
    },
    indexToValue: function(index) {
        const label = this.labelsToArray()[index];
        return this.labelToValue(label);
    },
    indexOfLabel: function(label) {
        return this.labelsToArray().indexOf(label)
    },
    valueToIndex: function(value) {
        return _.values(this.values).indexOf(value)
    }
}

export const filterByHelper = {
    labels: {
        NewlyAdded: 'Newly Added',
        NewlyPublished: 'Newly published',
        Popularity: 'Popularity'
    },
    values: {
        NewlyAdded: 'CreateDate',
        NewlyPublished: 'PublishDate',
        Popularity: 'Popularity'
    },
    labelToValue: function(label) {
        return this.values[label];
    },
    valueToLabel: function(value) {
        const selectedKey = _.findKey(this.values, v => v === value)
        return this.labels[selectedKey]
    },
    labelsToArray: function() {
        return _.keys(this.labels)
    },
    labelsToSelectItems: function() {
        return _.keys(this.labels).map(value => ({ value }))
    },
    indexToValue: function(index) {
        const label = this.labelsToArray()[index];
        return this.labelToValue(label);
    },
    indexOfLabel: function(label) {
        return this.labelsToArray().indexOf(label)
    }
}

export const vocalistHelper = {
    labels: {
        All: 'All',
        Vocaloid: 'Vocaloid',
        UTAU: 'UTAU',
        Other: 'Other'
    },
    values: {
        All: 'All',
        Vocaloid: 'Vocaloid',
        UTAU: 'UTAU',
        Other: 'CeVIO'
    },
    labelToValue: function(label) {
        return this.values[label];
    },
    valueToLabel: function(value) {
        const selectedKey = _.findKey(this.values, v => v === value)
        return this.labels[selectedKey]
    },
    labelsToArray: function() {
        return _.keys(this.labels)
    },
    labelsToSelectItems: function() {
        return _.keys(this.labels).map(value => ({ value }))
    },
    indexToValue: function(index) {
        const label = this.labelsToArray()[index];
        return this.labelToValue(label);
    },
    indexOfLabel: function(label) {
        return this.labelsToArray().indexOf(label)
    }
}
