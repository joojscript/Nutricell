import React from 'react';

import { Container } from './styles';

export default function Button({ text, onClicked }) {
  return (
    <Container>
      <button onClick={onClicked}>
        {text}
      </button>
    </Container>
  );
}
