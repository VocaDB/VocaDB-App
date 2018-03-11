import React from 'react'
import { View, Text, Button, ScrollView, Image } from 'react-native'
import Album from '../Album/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'

class Horizontal extends React.Component {
    render () {

        return (
            <View style={{ backgroundColor: '#81C784', height: 300 }}>

                <View style={{ backgroundColor: '#4DD0E1', height: 40, flexDirection: 'row', alignItems: 'center', paddingHorizontal: 4 }}>
                    <View style={{ flex: 1 }}>
                        <Text>Title</Text>
                    </View>
                    <View style={{ flex: 1 }}>
                        <Button title='More' onPress={() => console.log('abc')} />
                    </View>
                </View>

                <ScrollView horizontal={true} style={{ flex: 1, backgroundColor: '#FF8A65' }}>

                    <Album
                        id={6255}
                        image={images.getAlbumUri(6255)}
                        name='"666" NUMBER TRIPLE SIX'
                        display='box'
                    />
                    <View style={{ flex: 1, width: 200, padding: 4, backgroundColor: '#A1887F'}}>
                        <View style={{ flex: 3, backgroundColor: '#607D8B' }}>
                            <Image
                                style={{ flex: 1 }}
                                source={{ uri: images.getAlbumUri(6255) }}
                            />
                        </View>
                        <View style={{ flex: 1, backgroundColor: 'white' }}>
                            <Text>"666" NUMBER TRIPLE SIX</Text>
                        </View>
                    </View>

                    <View style={{ flex: 1, width: 140, padding: 4, backgroundColor: '#A1887F'}}>
                        <View style={{ flex: 3, backgroundColor: '#607D8B' }}>
                            <Image
                                style={{ flex: 1 }}
                                source={{ uri: images.getAlbumUri(6255) }}
                            />
                        </View>
                        <View style={{ flex: 1, backgroundColor: 'white' }}>
                            <Text>"666" NUMBER TRIPLE SIX</Text>
                        </View>
                    </View>

                    <View style={{ flex: 1, width: 140, padding: 4, backgroundColor: '#A1887F'}}>
                        <View style={{ flex: 3, backgroundColor: '#607D8B' }}>
                            <Image
                                style={{
                                    flex: 1
                                }}
                                source={{ uri: images.getAlbumUri(6255) }}
                            />
                        </View>
                        <View style={{ flex: 1, backgroundColor: 'white' }}>
                            <Text>"666" NUMBER TRIPLE SIX</Text>
                        </View>
                    </View>

                    <View style={{ flex: 1, width: 140, padding: 4, backgroundColor: '#A1887F'}}>
                        <View style={{ flex: 3, backgroundColor: '#607D8B' }}>
                            <Image
                                style={{
                                    flex: 1
                                }}
                                source={{ uri: images.getAlbumUri(6255) }}
                            />
                        </View>
                        <View style={{ flex: 1, backgroundColor: 'white' }}>
                            <Text>"666" NUMBER TRIPLE SIX</Text>
                        </View>
                    </View>

                    <View style={{ flex: 1, width: 140, padding: 4, backgroundColor: '#A1887F'}}>
                        <View style={{ flex: 3, backgroundColor: '#607D8B' }}>
                            <Image
                                style={{
                                    flex: 1
                                }}
                                source={{ uri: images.getAlbumUri(6255) }}
                            />
                        </View>
                        <View style={{ flex: 1, backgroundColor: 'white' }}>
                            <Text>"666" NUMBER TRIPLE SIX</Text>
                        </View>
                    </View>
                </ScrollView>

            </View>
        )
    }
}

export default Horizontal;