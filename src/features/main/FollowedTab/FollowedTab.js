import React from 'react';
import { View, Text, ScrollView, RefreshControl, FlatList } from 'react-native';
import SongList from '../../song/SongList';
import CenterView from '../../../components/CenterView';
import PropTypes from 'prop-types';
import Icon from '../../../components/Icon';
import FeatureList from './../FeatureList';
import i18n from './../../../common/i18n';
import SongCard from '../../song/SongCard';
import { Avatar } from 'react-native-elements';
import images from '../../../common/assets/images';

class FollowedTab extends React.Component {

    renderEmpty () {
        return (
            <CenterView>
                <Icon name='ios-person' size='xlarge' />
                <Text>You did not followed any artist.</Text>
            </CenterView>
        )
    }

    render () {
        if(this.props.artists.length == 0) {
            return this.renderEmpty()
        }

        const renderSongCard = song => {
            return (
                <SongCard key={song.id}
                          id={song.id}
                          name={song.name}
                          artist={song.artistString}
                          image={song.image}
                          pvs={song.pvs}
                          songType={song.songType}
                          onPress={() => this.props.onPressSong(song)} />
            )
        }

        const renderFeatureList = (artist) => {

            return (
                <FeatureList
                    prefix={
                        <View style={{ marginHorizontal: 8  }}>
                            <Avatar
                                medium
                                rounded
                                source={{ uri: artist.image }}
                                onPress={() => this.props.onPressArtist(artist)}
                                activeOpacity={0.7}
                                imageProps={{
                                    resizeMode: 'contain',
                                    resizeMethod: 'resize'
                                }}
                            />
                        </View>
                    }
                    title={artist.name}
                    items={artist.latestSongs}
                    renderItem={renderSongCard}
                    onPressMore={() => this.props.onPressMore(artist)} />
            )
        }

        return (
            <FlatList
                renderItem={({ item }) => renderFeatureList(item)}
                keyExtractor={item => item.id}
                data={this.props.artists}
            />
        )
    }
}

FollowedTab.propTypes = {
    artists: PropTypes.array,
    onPressSong: PropTypes.func,
    onPressMore: PropTypes.func,
    onPressArtist: PropTypes.func
}

FollowedTab.defaultProps = {
    artists: [],
    onPressSong: () => console.log(''),
    onPressMore: () => console.log(''),
    onPressArtist: () => console.log('')
}

export default FollowedTab