import styled from 'styled-components';

export const Container = styled.div`
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  img{
    height: 150px;
    margin-bottom: 20px;
  }

  h1{
    font-size: 30px;
  }

  h3{
    font-size: 15px;
    font-weight: normal;
    margin-bottom: 20px;
  }

  input{
    background-color: transparent;
    border: 2px solid #C9FFEB;
    color: #C9FFEB;
    font-family: 'Spectral SC';
    font-size: 15px;
    border-radius: 10px; 
    margin: 15px 0;
  }

  button{
    margin-bottom: 20px;
  }
`;
