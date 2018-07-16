import React from 'react';
import { StyleSheet } from 'react-native';
import PropTypes from 'prop-types';
import Theme from '../../../theme';
import FeatureList from './../../main/FeatureList';
import AlbumCard from './../AlbumCard';
import i18n from './../../../common/i18n';

class AlbumHorizontalList extends React.Component {
    render () {

        const renderAlbumCard = album => (
            <AlbumCard key={album.id}
                       id={album.id}
                       name={album.name}
                       image={album.image}
                       onPress={() => this.props.onPressItem(album)} />
        )

        return (
            <FeatureList
                title={this.props.title}
                items={this.props.albums}
                displayMoreButton={this.props.displayMoreButton}
                onPressMore={this.props.onPressMore}
                renderItem={renderAlbumCard} />
        )
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white'
    },
    wrapContainer: {
        margin: 8
    },
    headerContainer: {
        margin: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center'
    },
    contentContainer: {
        padding: 8,
        margin: 8
    }
});

AlbumHorizontalList.propTypes = {
    title: PropTypes.string,
    albums: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func,
    onPressItem: PropTypes.func,
    displayMoreButton: PropTypes.bool
}

AlbumHorizontalList.defaultProps = {
    title: i18n.albums,
    albums: [],
    displayMoreButton: false,
    onPressItem: () => console.log('Press item'),
    onPressMore: () => console.log('Press more')
}

export default AlbumHorizontalList