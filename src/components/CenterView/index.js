import React from 'react';
import PropTypes from 'prop-types';
import { View } from 'react-native';
import style from './style';

const CenterView = props => <View style={[style[props.type], style.theme, props.style]}>{props.children}</View>;

CenterView.propTypes = {
    children: PropTypes.node.isRequired,
    type: PropTypes.oneOf(['all', 'vertical', 'horizontal'])
};

CenterView.defaultProps = {
  type: 'all',
    style: {}
}

export { CenterView as default };
