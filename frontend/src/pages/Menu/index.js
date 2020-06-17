import React from 'react';
import { Link } from 'react-router-dom';
import { Container } from './styles';
import logo from '../../assets/logo.svg';
import Button from '../../components/Button';

export default function Menu() {
  return (
    <Container>
      <img src={logo} alt="Nutricell" />
      <h1>NUTRICELL</h1>
      <h3>ADMINISTRATOR</h3>

      <Link to="/register"><Button text="FOOD REGISTER" /></Link>
      <Link to="/list"><Button text="FOOD LIST" /></Link>

    </Container>
  );
}
