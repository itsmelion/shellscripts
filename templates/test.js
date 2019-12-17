import React from 'react';
import { render } from 'enzyme';
import 'jest-styled-components';

import {{componentName}} from './{{componentName}}';

describe('<{{componentName}} />', () => {
  it('should render successfully', () => {
    const wrapper = render(<{{componentName}} />);

    expect(wrapper).toMatchSnapshot();
  })
});
