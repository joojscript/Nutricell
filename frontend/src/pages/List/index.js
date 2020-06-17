import React, { useState, useEffect } from 'react';
import { FaRegEdit, FaTrashAlt, FaInfoCircle, FaSearch } from 'react-icons/fa';
import { Container } from './styles';
import Button from '../../components/Button';
import { Link } from 'react-router-dom';
import api from '../../services/api';

export default function List({ history }) {
  const [foods, setFoods] = useState([]);
  const headers = { "Content-Type": "application/json", "authorization": `Bearer ${localStorage.getItem('userToken')}` };


  async function getFoods() {
    let responseFoods = await api.get('/foods', {
      headers
    });
    setFoods(responseFoods.data);
  };

  useEffect(
    () => {
      getFoods();
    },
    []);

  const handleDelete = async (id) => {
    const headers = { "Content-Type": "application/json", "authorization": `Bearer ${localStorage.getItem('userToken')}` };
    const data = { "foodId": id };
    const response = await api.delete('/foods', { headers, data });
    getFoods();

    console.log(response.status);
  }

  return (
    <Container>
      <h3>REGISTERED FOODS</h3>
      <span><input type="text" /><FaSearch /></span>

      <table>
        <thead>
          <th>NAME</th>
          <th>INFOS</th>
          <th>EDIT</th>
          <th>DELETE</th>
        </thead>
        <tbody>
          {foods ? foods.map(food => (
            <tr>
              <td>{food.name}</td>
              <td><FaInfoCircle onClick={() => { alert(food.extraInfos) }} /></td>
              <td><FaRegEdit onClick={() => { history.push({ pathname: '/edit', state: { food } }) }} /></td>
              <td><FaTrashAlt onClick={(e) => { handleDelete(food._id) }} /></td>
            </tr>
          )) : <h1>HEllo</h1>}

        </tbody>
      </table>

      <Link to="/menu"><Button text="CANCEL" /></Link>
    </Container>
  );
}
