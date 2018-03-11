import React from 'react'
import { View, Text } from 'react-native'
import PV from '../PV/index'
import PropTypes from 'prop-types';
import Theme from '../../../theme'

class PVList extends React.Component {

    render () {

        let pvs = this.props.pvs

        if(this.props.type) {
            pvs = pvs.filter(pv => pv.pvType == this.props.type)
        }

        if(this.props.service) {
            pvs = pvs.filter(pv => pv.service == this.props.service)
        }

        if(!pvs.length) {
            return (<View></View>)
        }

        return (
            <View style={{ paddingHorizontal: 4 }}>
                <View style={{ margin: 4}}>
                    {this.props.showHeader && <Text style={Theme.subhead}>{this.props.title}</Text>}
                </View>
                {pvs.map(pv => (
                    <PV
                        icon
                        key={pv.id}
                        name={pv.name}
                        url={pv.url}
                        service={pv.service}
                    />
                ))}
            </View>
        )
    }
}

PVList.propTypes = {
    pvs: PropTypes.array,
    type: PropTypes.string,
    service: PropTypes.string,
    title: PropTypes.string,
    showHeader: PropTypes.bool
};

PVList.defaultProps = {
    pvs: [],
    title: 'PVs',
    showHeader: false
};

export default PVList;