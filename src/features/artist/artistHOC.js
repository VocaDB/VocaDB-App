import React from 'react'
import { FlatList } from 'react-native'
import ArtistRow from './ArtistRow'

const createList = (ItemComponent) => (props) => (  <FlatList
    data={props.data}
    keyExtractor={item => item.id}
    renderItem={({ item }) => {
        return (<ItemComponent key={item.id}
                               id={item.id}
                               name={item.name}
                               image={item.image}
                               artist={item.artistString}
                               onPress={() => this.props.onPressItem(item)}  />)
    }}
/>)


export const ArtistRowList = createList(ArtistRow)