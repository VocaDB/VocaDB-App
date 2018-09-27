import React from 'react';
import PropTypes from 'prop-types';
import MenuItem from './../../../components/MenuItem';
import { View, ScrollView, Text, StyleSheet, Linking } from 'react-native';
import Theme from '../../../theme';
import contact from './../../../common/constants/contact';

class Contact extends React.Component {

    render () {
        const openLink = (url) => Linking.openURL(url).catch(err => console.error('An error occurred', err));

        return (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <View style={style.sectionContainer}>
                    <View style={style.titleContainer}>
                        <Text style={[Theme.subhead]}>{contact.main.title}</Text>
                    </View>
                    <View style={style.descriptionContainer}>
                        <Text style={[Theme.caption]}>{contact.main.description}</Text>
                    </View>
                    <View style={style.contactListContainer}>
                        {contact.main.sites.map(i => <MenuItem key={i.title} icon={i.icon} text={i.title} onPress={() => openLink(i.url)} />)}
                    </View>
                </View>

                <View style={style.sectionContainer}>
                    <View style={style.titleContainer}>
                        <Text style={[Theme.subhead]}>{contact.developer.title}</Text>
                    </View>
                    <View style={style.descriptionContainer}>
                        <Text style={[Theme.caption]}>{contact.developer.description}</Text>
                    </View>
                    <View style={style.contactListContainer}>
                        {contact.developer.sites.map(i => <MenuItem key={i.title} icon={i.icon} text={i.title} onPress={() => openLink(i.url)} />)}
                    </View>
                </View>
            </ScrollView>
        );
    }
}

Contact.propTypes = {
}

Contact.defaultProps = {
}

const style = StyleSheet.create({
    container: {
       padding: 8,
    },
   sectionContainer: {
       padding: 8
   },
    titleContainer: {
       padding: 8
    },
    descriptionContainer: {
        paddingHorizontal: 8
    },
    contactListContainer: {
    }
});

export default Contact;