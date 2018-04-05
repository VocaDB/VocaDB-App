import React from 'react'
import { FlatList } from 'react-native'
import SongRow from './SongRow'

const createList = (ItemComponent) => (props) => (  <FlatList
    data={props.data}
    keyExtractor={item => item.id}
    renderItem={({ item }) => {
        return (<ItemComponent key={item.id}
                               image={item.image}
                               name={item.defaultName}
                               artist={item.artistString}
                               dateTime={item.createDate}
                               pvServices={item.pvServices.split(',').map(pvService => pvService.trim())}
                               onPress={() => props.onPressItem(item)} />)
    }}
/>)


export const SongRowList = createList(SongRow)