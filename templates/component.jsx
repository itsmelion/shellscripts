import React, { memo } from 'react';
import PropTypes from 'prop-types';
import { Wrapper } from './{{componentName}}.styled.js';

const {{componentName}} = (props) => (
  <Wrapper>

  </Wrapper>
);

{{componentName}}.defaultProps = {
  // name: '',
};

{{componentName}}.propTypes = {
  // name: PropTypes.string
};

export default memo({{componentName}});
