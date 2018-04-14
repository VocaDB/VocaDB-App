import React from 'react';
import { View, Text, ActivityIndicator } from 'react-native';
import PropTypes from 'prop-types'
import { Dropdown } from 'react-native-material-dropdown';
import Page from '../../../components/Page'
import Content from '../../../components/Content'
import { ButtonGroup } from 'react-native-elements'
import { SongRankingList  } from './../../song/songHOC'
import _ from 'lodash'
import Theme from '../../../theme'
import { durationHoursHelper, filterByHelper, vocalistHelper } from './SongRankingHelper'

class SongRanking extends React.Component {

    componentDidMount() {
        if(!this.props.songs || !this.props.songs.length) {
            this.props.onDurationHoursChanged()
        }
    }

    render () {

        const renderResult = () => {
            if(!this.props.songs || !this.props.songs.length) {
                return <ActivityIndicator size="large" color="#0000ff" />;
            }

            return <SongRankingList data={this.props.songs} />;
        }

        return (
            <Page>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    <View style={{ justifyContent: 'center' }}>
                        <ButtonGroup
                            onPress={i => this.props.onDurationHoursChanged(durationHoursHelper.indexToValue(i))}
                            selectedIndex={durationHoursHelper.valueToIndex(this.props.durationHours)}
                            selectedButtonStyle={{ backgroundColor: Theme.accentColor }}
                            selectedTextStyle={{ color: 'white' }}
                            buttons={durationHoursHelper.labelsToArray()}
                        />
                    </View>
                    <View style={{ flexDirection: 'row', padding: 8 }}>
                        <View style={{ flex: 1, padding: 4 }}>
                            <Dropdown
                                label='Filter by'
                                value={filterByHelper.valueToLabel(this.props.filterBy)}
                                onChangeText={text => {
                                    this.props.onFilterByChanged(filterByHelper.labelToValue(text))
                                }}
                                data={filterByHelper.labelsToSelectItems()}
                            />
                        </View>
                        <View style={{ flex: 1, padding: 4 }}>
                            <Dropdown
                                label='Vocalist'
                                value={vocalistHelper.valueToLabel(this.props.vocalist)}
                                onChangeText={text => {
                                    this.props.onVocalistChanged(vocalistHelper.labelToValue(text))
                                }}
                                data={vocalistHelper.labelsToSelectItems()}
                            />
                        </View>
                    </View>

                    {renderResult()}
                </View>
            </Page>
        );
    }
}

SongRanking.propTypes = {
    songs: PropTypes.array,
    durationHours: PropTypes.number,
    filterBy: PropTypes.string,
    vocalist: PropTypes.string,
    onFilterByChanged: PropTypes.func,
    onDurationHoursChanged: PropTypes.func,
    onVocalistChanged: PropTypes.func

}

SongRanking.defaultProps = {
    songs: [],
    durationHours: durationHoursHelper.values.Weekly,
    filterBy: filterByHelper.values.NewlyAdded,
    vocalist: vocalistHelper.values.All,
    onFilterByChanged: value => console.log('filter by ' + value),
    onDurationHoursChanged: value => console.log('Duration ' + value),
    onVocalistChanged: value => console.log('Vocalist ' + value)
}


export default SongRanking;