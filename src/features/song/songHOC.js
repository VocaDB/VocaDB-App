import React from 'react'
import { FlatList, View, Text } from 'react-native'
import SongRow from './SongRow'
import Theme from './../../theme'

const createList = (ItemComponent) => (props) => (  <FlatList
    data={props.data}
    keyExtractor={item => item.id}
    renderItem={({ item }) => {
        return (<ItemComponent key={item.id}
                               image={item.image}
                               name={item.defaultName}
                               artist={item.artistString}
                               dateTime={item.createDate}
                               pvServices={(item.pvServices)? item.pvServices.split(',').map(pvService => pvService.trim()) : []}
                               onPress={() => props.onPressItem(item)} />)
    }}
/>)

const createRankList = (ItemComponent) => (props) => (  <FlatList
    data={props.data}
    keyExtractor={item => item.id}
    renderItem={({ item, index }) => {
        const prefix = (<View style={{ width: 32, alignItems: 'center', justifyContent: 'center' }}><Text style={Theme.title}>{index+1}</Text></View>)
        return (<ItemComponent key={item.id}
                               prefix={prefix}
                               image={item.image}
                               name={item.defaultName}
                               artist={item.artistString}
                               dateTime={item.createDate}
                               pvServices={(item.pvServices)? item.pvServices.split(',').map(pvService => pvService.trim()) : []}
                               onPress={() => props.onPressItem(item)} />)
    }}
/>)


export const SongRowList = createList(SongRow)
export const SongRankingList = createRankList(SongRow)