import React from 'react';
import logo from '../../assets/logo.svg';
import { FaRegCopyright } from 'react-icons/fa';
import { Container } from './styles';
import Button from '../../components/Button';
import { Link } from 'react-router-dom';

export default function Home() {
  return (
    <Container>
      <img src={logo} alt="Nutricell" />
      <h1>NUTRICELL</h1>
      <h3>ADMINISTRATOR</h3>

      <Link to="/login"><Button text={"LOGIN"} /></Link>
      <span><FaRegCopyright size={20} color="#C9FFEB" />ALL RIGHTS RESERVED</span>
    </Container>
  );
}
