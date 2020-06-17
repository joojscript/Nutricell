import styled from 'styled-components';

export const Container = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;

  span{
    svg{
      position: relative;
      right: 22px;
      top: 2px;
      cursor: pointer;
    }
  }

  input{
    background-color: transparent;
    border: 2px solid #C9FFEB;
    color: #C9FFEB;
    font-family: 'Spectral SC';
    font-size: 15px;
    border-radius: 10px; 
    margin-bottom: 50px;
  }

  h3{
    font-size: 20px;
    font-weight: normal;
    margin-bottom: 20px;
  }

  table{
    border-collapse: collapse;
    align-items: center;
    width: 700px;
    margin-bottom: 30px;
    
    svg{
      cursor: pointer;
    }
  }

  thead, tbody, th, tr, td{
    border: 1px solid #C9FFEB;
  }

  th, td{
    text-align: center;
  }

`;
