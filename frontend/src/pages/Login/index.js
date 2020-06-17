import React, { useState } from 'react';

import logo from '../../assets/logo.svg';
import { Container } from './styles';
import Button from '../../components/Button';
import api from '../../services/api';

export default function Login({ history }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  async function onSubmit() {
    const response = await api.post('/sessions', {
      email,
      password
    });

    if (response.status === 200) {
      localStorage.setItem('userToken', response.data.token);
      history.push('/menu');
    }
  }

  return (
    <Container>
      <img src={logo} alt="Nutricell" />
      <h1>NUTRICELL</h1>
      <h3>ADMINISTRATOR</h3>

      <label>ADMINISTRATOR EMAIL</label>
      <input type="text" value={email} onChange={(e) => setEmail(e.target.value)} />

      <label>PASSWORD</label>
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />

      <Button text="LOGIN" onClicked={() => { onSubmit(); }} />
    </Container>
  );
}
