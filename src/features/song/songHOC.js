import React from 'react'
import { FlatList } from 'react-native'
import SongRow from './SongRow'

const createList = (ItemComponent) => (props) => (  <FlatList
    data={props.data}
    keyExtractor={item => item.id}
    renderItem={({ item }) => {
        const imageUrl = (item.thumbUrl) ? item.thumbUrl : 'http://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE';
        return (<ItemComponent key={item.id}
                               image={imageUrl}
                               name={item.defaultName}
                               artist={item.artistString}
                               dateTime={item.createDate}
                               pvServices={item.pvServices.split(',').map(pvService => pvService.trim())}
                               onPress={() => props.onPressItem(item)} />)
    }}
/>)


export const SongRowList = createList(SongRow)