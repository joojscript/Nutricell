import React, { useState } from 'react';
import { Container, Center } from './styles';
import api from '../../services/api';

export default function Register({ history, location }) {
  const food = location.state.food;
  const [name, setName] = useState(food.name);
  const [family, setFamily] = useState('');
  const [Carb, setCarb] = useState({ selected: false, style: {} });
  const [Prot, setProt] = useState({ selected: false, style: {} });
  const [Vit, setVit] = useState({ selected: false, style: {} });
  const [Others, setOthers] = useState({ selected: false, style: {} });
  const [Diabetes, setDiabetes] = useState({ selected: false, style: {} });
  const [IntLac, setIntLac] = useState({ selected: false, style: {} });
  const [Hypertensive, setHypertensive] = useState({ selected: false, style: {} });
  const [points, setPoints] = useState(0);
  const [infos, setInfos] = useState(food.extraInfos);
  const [pack, setPack] = useState({ foodId: food._id, name: food.name, extraInfos: food.extraInfos, points: food.points });

  async function handleSubmit() {
    setPack({
      foodId: food._id,
      name,
      extraInfos: infos,
      points,
      family,
      diabeticsAllowed: !Diabetes.selected,
      hypertensivesAllowed: !Hypertensive.selected,
      LactoseIntolerantsAllowed: !IntLac.selected
    });

    if (pack.name !== "") {

      console.log(pack);
      const headers = { "Content-Type": "application/json", 'authorization': `Bearer ${localStorage.getItem('userToken')}` }

      const response = await api.put('/foods', pack, { headers });

      console.log(response.data);

      if (response.status === 200 && response.data !== undefined) {
        history.push('/list');
      }
    }


  }

  function handleFamily(e) {
    e.target.id === "Carboidratos"
      ? setCarb({
        ...Carb, selected: !Carb.selected, style: { color: "#F00" }
      })
      : setCarb({
        ...Carb, selected: !Carb.selected, style: { color: "#C9FFEB" }
      });
    e.target.id === "Proteínas"
      ? setProt({
        ...Prot, selected: !Prot.selected, style: { color: "#F00" }
      })
      : setProt({
        ...Prot, selected: !Prot.selected, style: { color: "#C9FFEB" }
      });
    e.target.id === "Vitaminas"
      ? setVit({
        ...Vit, selected: !Vit.selected, style: { color: "#F00" }
      })
      : setVit({
        ...Vit, selected: !Vit.selected, style: { color: "#C9FFEB" }
      });
    e.target.id === "Outros"
      ? setOthers({
        ...Others, selected: !Others.selected, style: { color: "#F00" }
      })
      : setOthers({
        ...Others, selected: !Others.selected, style: { color: "#C9FFEB" }
      });
    setFamily(e.target.id);
    setPack({
      ...pack,
      family: e.target.id,
    });
  }

  function handleDisease(e) {
    if (e.target.id === "Diabetes") {
      setDiabetes({
        selected: true, style: { color: "#F00" }
      })
      setPack({ ...pack, diabeticsAllowed: false });
    }
    else {
      setDiabetes({
        selected: false, style: { color: "#C9FFEB" }
      });
      setPack({ ...pack, diabeticsAllowed: true });
    }
    if (e.target.id === "Into. Lactose") {
      setIntLac({
        selected: true, style: { color: "#F00" }
      });
      setPack({ ...pack, LactoseIntolerantsAllowed: false });
    } else {
      setIntLac({
        selected: false, style: { color: "#C9FFEB" }
      });
      setPack({ ...pack, LactoseIntolerantsAllowed: true });
    }
    if (e.target.id === "Hipertensão") {
      setHypertensive({
        selected: true, style: { color: "#F00" }
      });
      setPack({ ...pack, hypertensivesAllowed: false });
    } else {
      setHypertensive({
        selected: false, style: { color: "#C9FFEB" }
      });
      setPack({ ...pack, hypertensivesAllowed: true });
    }
  }

  return (
    <>
      <Container>
        <div className="left">
          <label>NOME</label>
          <input type="text" value={pack.name} onChange={(e) => { setPack({ ...pack, name: e.target.value }) }} />

          <label>GRUPO ALIMENTAR</label>
          <button id="Carboidratos" onClick={handleFamily} style={Carb.style}>Carbohydrates </button>
          <button id="Proteínas" onClick={handleFamily} style={Prot.style} >Proteins</button>
          <button id="Vitaminas" onClick={handleFamily} style={Vit.style} >Vitamins</button>
          <button id="Outros" onClick={handleFamily} style={Others.style} >Others</button>

        </div>

        <div className="divider"></div>

        <div className="right">
          <label>EXTRA INFOS</label>
          <textarea name="infos" id="infos" cols="20" rows="5" value={pack.extraInfos} onChange={(e) => { setPack({ ...pack, "extraInfos": e.target.value }); }} ></textarea>

          <label>POINTS</label>
          <input type="number" id="points" value={pack.points} onChange={(e) => { setPack({ ...pack, points: e.target.value }) }} />

          <label>ASSOCIABLE DISEASES</label>
          <button id="Diabetes" onClick={handleDisease} style={Diabetes.style}>Diabetes</button>
          <button id="Into. Lactose" onClick={handleDisease} style={IntLac.style} >Lactose Intolerance</button>
          <button id="Hipertensão" onClick={handleDisease} style={Hypertensive.style} >Hypertension</button>

        </div>

      </Container>
      <Center>
        <button type="submit" onClick={() => { handleSubmit() }}>REGISTER</button>
      </Center>
    </>
  );
}
