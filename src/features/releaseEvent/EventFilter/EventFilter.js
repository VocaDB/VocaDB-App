import React from 'react'
import PropTypes from 'prop-types'
import { View, Text, Modal } from 'react-native'
import Content from '../../../components/Content'
import Section from '../../../components/Section'
import DatePicker from 'react-native-datepicker'
import { Dropdown } from 'react-native-material-dropdown';
import { categoryItems, category, filterFiled  } from './../releaseEventConstant'

class EventFilter extends React.PureComponent {


    constructor(props){
        super(props)
    }

    render () {

        return (
            <Content>
                <Section title='Date range'>
                    <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start' }}>

                        <DatePicker
                            date={this.props.params[filterFiled.afterDate]}
                            mode="date"
                            placeholder="select date"
                            format="YYYY-MM-DD"
                            confirmBtnText="Confirm"
                            cancelBtnText="Cancel"
                            showIcon={false}
                            onDateChange={(date) => this.props.updateParam(filterFiled.afterDate, date)}
                        />

                        <View style={{ margin: 8 }}>
                            <Text>To</Text>
                        </View>


                        <DatePicker
                            date={this.props.params[filterFiled.beforeDate]}
                            mode="date"
                            placeholder="select date"
                            format="YYYY-MM-DD"
                            confirmBtnText="Confirm"
                            cancelBtnText="Cancel"
                            showIcon={false}
                            onDateChange={(date) => this.props.updateParam(filterFiled.beforeDate, date)}
                        />
                    </View>
                </Section>

                <View>
                    <Dropdown
                        label='Category'
                        value={this.props.params.category}
                        data={categoryItems}
                        onChangeText={text => {
                            this.props.onParamChanged(filterFiled.category, text)
                        }}
                    />
                </View>

            </Content>
        )
    }
}

EventFilter.propTypes = {
    params: PropTypes.object,
    updateParam: PropTypes.func
}

EventFilter.defaultProps = {
    params: {
        afterDate: '2016-05-15',
        beforeDate: '2016-05-15',
        category: category.unspecified
    },
    updateParam: (name, value) => {}
}

export default EventFilter;