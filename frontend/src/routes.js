import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import Home from './pages/Home';
import Login from './pages/Login';
import Menu from './pages/Menu';
import Register from './pages/Register';
import Edit from './pages/Edit';
import List from './pages/List';

export default function Routes() {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route exact path="/login" component={Login} />
        <Route exact path="/menu" component={Menu} />
        <Route exact path="/register" component={Register} />
        <Route exact path="/edit" component={Edit} />
        <Route exact path="/list" component={List} />
      </Switch>
    </BrowserRouter>
  );
}
