import 'jest-styled-components';
import React from 'react';
import { render } from 'enzyme';

import {{componentName}} from './{{componentName}}.jsx';

describe('<{{componentName}} />', () => {
  it('should render successfully', () => {
    const wrapper = render(<{{componentName}} />);

    expect(wrapper).toMatchSnapshot();
  })
});
