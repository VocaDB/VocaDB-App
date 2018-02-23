import React from 'react'
import { View, Text, TextInput } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import PropTypes from 'prop-types'

class SearchBar extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            text: this.props.text
        }
    }

    render () {

        const queryText = this.state.text

        return (
            <View>
                <Toolbar
                    style={{
                        container: { backgroundColor: 'white' },
                        leftElement: { color: 'black' },
                        rightElement: { color: 'black' }
                    }}

                    leftElement="arrow-back"
                    centerElement={<TextInput
                                              underlineColorAndroid='transparent'
                                              autoFocus
                                              value={queryText}
                                              onChangeText={text => {
                                                  this.setState({ text })
                                                  this.props.onChangeText(text)
                                              }} />}
                    rightElement={(queryText.length)? 'clear' : undefined}
                    onRightElementPress={() => {
                        this.setState({ text: '' })
                        this.props.onRightElementPress()
                    }}
                    onLeftElementPress={this.props.onLeftElementPress}
                />
            </View>
        )
    }
}

SearchBar.propTypes = {
    text: PropTypes.string,
    onChangeText: PropTypes.func,
    onRightElementPress: PropTypes.func,
    onLeftElementPress: PropTypes.func
};

SearchBar.defaultProps = {
    text: '',
    onChangeText: text => console.log(text),
    onRightElementPress: () => console.log('Press Right'),
    onLeftElementPress: () => console.log('Press Left')
};

export default SearchBar;