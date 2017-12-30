import React from 'react'
import { View, ScrollView} from 'react-native'
import { List, Grid, Row, Col, Button, Text, Right, Left, Container, Content, Body, Item } from 'native-base'
import PropTypes from 'prop-types'

class ListContainer extends React.Component {

    renderTitle (enableMin) {

        const renderMoreButton = (<Button transparent onPress={this.props.onMoreClick}><Text>More</Text></Button>)

        return (
            <Item style={{ height: 30, paddingHorizontal: 8 }}>
                <Left>
                    <Text>{this.props.title}</Text>
                </Left>

                <Right>
                    {enableMin && renderMoreButton}
                </Right>
            </Item>
        )
    }

    renderVertical (items, enableMin) {
        return (
            <View>
                {!items.length && this.props.emptyDisplay()}
                {items.map(this.props.displayItem)}
            </View>
        )
    }

    renderHorizontal (items, enableMin) {
        return (
            <ScrollView horizontal={true}>
                {!items.length && this.props.emptyDisplay()}
                {items.map(this.props.displayItem)}
            </ScrollView>
        )
    }

    render () {

        let items = this.props.items
        let isMinSet = (this.props.minimum > 0)
        let isItemSizeMoreThanMin = (items.length > this.props.minimum)
        let enableMin = (isMinSet && isItemSizeMoreThanMin)

        const sliceItemToMin = (items, min) => items.slice(0, min)

        if(enableMin) {
            items = sliceItemToMin(items, this.props.minimum)
        }

        return (
            <View>
                {!this.props.hideTitle && this.renderTitle(enableMin)}

                <View>
                    {!this.props.horizontal && this.renderVertical(items,enableMin)}

                    {this.props.horizontal && this.renderHorizontal(items,enableMin)}
                </View>



            </View>
        )

    }
}

ListContainer.propTypes = {
    title: PropTypes.string,
    hideTitle: PropTypes.bool,
    horizontal: PropTypes.bool,
    minimum: PropTypes.number,
    emptyDisplay: PropTypes.func,
    displayItem: PropTypes.func.isRequired,
    items: PropTypes.array.isRequired,
    onMoreClick: PropTypes.func
}

ListContainer.defaultProps = {
    minimum: 0,
    emptyDisplay: () => null,
    onMoreClick: () => console.log('More click')
}

export default ListContainer