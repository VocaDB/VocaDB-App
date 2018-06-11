import React from 'react'
import { View, Text } from 'react-native'
import Content from '../../../components/Content'
import Section from '../../../components/Section'
import DatePicker from 'react-native-datepicker'
import { Dropdown } from 'react-native-material-dropdown';


class EventFilter extends React.PureComponent {

    constructor(props){
        super(props)
        this.state = { fromDate:"2016-05-15", toDate: '2016-05-15' }
    }

    render () {
        return (
            <Content>
                <Section title='Date range'>
                    <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start' }}>

                        <DatePicker
                            date={this.state.fromDate}
                            mode="date"
                            placeholder="select date"
                            format="YYYY-MM-DD"
                            minDate="2016-05-01"
                            maxDate="2016-06-01"
                            confirmBtnText="Confirm"
                            cancelBtnText="Cancel"
                            showIcon={false}
                            onDateChange={(date) => {this.setState({fromDate: date})}}
                        />

                        <View style={{ margin: 8 }}>
                            <Text>To</Text>
                        </View>


                        <DatePicker
                            date={this.state.toDate}
                            mode="date"
                            placeholder="select date"
                            format="YYYY-MM-DD"
                            minDate="2016-05-01"
                            maxDate="2016-06-01"
                            confirmBtnText="Confirm"
                            cancelBtnText="Cancel"
                            showIcon={false}
                            onDateChange={(date) => {this.setState({toDate: date})}}
                        />
                    </View>
                </Section>

                <View>
                    <Dropdown
                        label='Category'
                        value='Unspecified'
                        data={[
                            { value: 'Unspecified' },
                            { value: 'AlbumRelease' },
                            { value: 'Anniversary' },
                            { value: 'Club' },
                            { value: 'Concert' },
                            { value: 'Contest' },
                            { value: 'Convention' },
                            { value: 'Other' }
                        ]}
                    />
                </View>

            </Content>
        )
    }
}

EventFilter.propTypes = {
}

export default EventFilter;