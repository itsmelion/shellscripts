import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';
import {{componentName}} from './{{componentName}}';

storiesOf('{{componentName}}', module)
  .add('default', () => (
    <{{componentName}} onClick={action('clicked')}>
      Hello World!
    </{{componentName}}>
  ));
