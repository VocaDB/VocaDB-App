import React from 'react';
import PropTypes from 'prop-types';
import SongList from './../SongList';
import { View, Text, ScrollView } from 'react-native';
import i18n from './../../../common/i18n';
import Theme from '../../../theme';

class SongRelated extends React.Component {

    render () {

        const Section = props => (
            <View style={[{ padding: 4 },props.style]}>
                <Text style={[Theme.subhead, { padding: 8 }]}>{props.title}</Text>
                {props.children}
            </View>
        )

        return (
            <ScrollView style={{ backgroundColor: 'white' }}>
                <Section title={i18n.artistMatches}>
                    <SongList
                        flatList
                        showHeader={false}
                        songs={this.props.artistMatches}
                        onPressItem={this.props.onPressSong}
                        hideMoreButton={true} />
                </Section>
                <Section title={i18n.likeMatches}>
                    <SongList
                        flatList
                        showHeader={false}
                        songs={this.props.likeMatches}
                        onPressItem={this.props.onPressSong}
                        hideMoreButton={true} />
                </Section>
                <Section title={i18n.tagMatches}>
                    <SongList
                        flatList
                        showHeader={false}
                        songs={this.props.tagMatches}
                        onPressItem={this.props.onPressSong}
                        hideMoreButton={true} />
                </Section>
            </ScrollView>

        )
    }
}

SongRelated.propTypes = {
    artistMatches: PropTypes.array,
    likeMatches: PropTypes.array,
    tagMatches: PropTypes.array,
    onPressSong: PropTypes.func
}

SongRelated.defaultProps = {
    artistMatches: [],
    likeMatches: [],
    tagMatches: [],
    onPressSong: () => console.log('press song')
}

export default SongRelated