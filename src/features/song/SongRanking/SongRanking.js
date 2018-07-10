import React from 'react';
import { View, Text, ActivityIndicator } from 'react-native';
import PropTypes from 'prop-types';
import { Dropdown } from 'react-native-material-dropdown';
import { ButtonGroup } from 'react-native-elements';
import { SongRankingList  } from './../../song/songHOC';
import Theme from '../../../theme';
import { durationHoursHelper, filterItems, vocalistItems } from './SongRankingHelper';
import Icon from './../../../components/Icon';
import i18n from './../../../common/i18n';

class SongRanking extends React.Component {

    state = {
        showFilter: false
    }

    componentDidMount() {
        if(!this.props.songs || !this.props.songs.length) {
            this.props.onDurationHoursChanged()
        }
    }

    showFilter() {
        this.setState({ showFilter: true })
    }

    hideFilter() {
        this.setState({ showFilter: false })
    }

    render () {

        const renderResult = () => {
            if(!this.props.songs || !this.props.songs.length) {
                return <ActivityIndicator size="large" color="#0000ff" />;
            }

            return <SongRankingList data={this.props.songs} onPressItem={this.props.onPressSong} />;
        }

        const renderFilter = () => {
            if(this.state.showFilter) {
                return (
                    <View>
                        <View style={{ flexDirection: 'row', paddingHorizontal: 8 }}>
                            <View style={{ flex: 1, padding: 4 }}>
                                <Dropdown
                                    label={i18n.filter}
                                    value={this.props.filterBy}
                                    onChangeText={value => {
                                        this.props.onFilterByChanged(value)
                                    }}
                                    data={filterItems}
                                    valueExtractor={item => item.value}
                                    labelExtractor={item => item.label}
                                />
                            </View>
                            <View style={{ flex: 1, padding: 4 }}>
                                <Dropdown
                                    label={i18n.vocalist}
                                    value={this.props.vocalist}
                                    onChangeText={value => {
                                        this.props.onVocalistChanged(value)
                                    }}
                                    data={vocalistItems}
                                    valueExtractor={item => item.value}
                                    labelExtractor={item => item.label}
                                />
                            </View>
                        </View>
                        <View style={{ alignItems: 'center' }}>
                            <Icon name='ios-arrow-up' size='small' onPress={() => this.hideFilter()} />
                        </View>
                    </View>
                )
            }

            return (
                <View style={{ alignItems: 'center' }}>
                    <Icon name='ios-arrow-down' size='small' onPress={() => this.showFilter()} />
                </View>
            )
        }

        return (
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
                    {renderFilter()}

                    {renderResult()}
                </View>
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
    filterBy: 'NewlyAdded',
    vocalist: 'All',
    onFilterByChanged: value => console.log('filter by ' + value),
    onDurationHoursChanged: value => console.log('Duration ' + value),
    onVocalistChanged: value => console.log('Vocalist ' + value)
}


export default SongRanking;