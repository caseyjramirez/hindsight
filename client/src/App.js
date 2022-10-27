import React, { useState, useEffect } from 'react';
import { Routes, Route, Link } from "react-router-dom";
import Navbar from './components/reusables/Navbar'
import Home from "./pages/Home";
import Signup from './pages/Signup'
import Login from "./pages/Login";
import Dashboard from './pages/Dashboard';
import Relationship from './pages/Relationship';
import TestingCookies from './pages/TestingCookies';
import { authorizeUser } from './services/services';

function App() {
  const [currentUser, setCurrentUser] = useState(false)
  const [relationships, setRelationships] = useState([])

  useEffect(() => {
    authorizeUser()
    .then(d => {
      setCurrentUser(d.data)
      setRelationships(d.data.relationships)
    })
  }, [])

  function addRelationship(newRelationship) {
    console.log(newRelationship);
    setRelationships(relationships => [...relationships, newRelationship])
  }
  
  console.log(relationships);

  return (
    <div className="App">
      <Navbar />
      {
        !currentUser ? <Login setUser={setCurrentUser} /> : 
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/signup" element={<Signup setUser={setCurrentUser} />} />
        <Route path="/login" element={<Login setUser={setCurrentUser} />} />
        <Route path="/home" element={<Dashboard relationships={relationships} user={currentUser} createNewRelationship={addRelationship}/>} />
        <Route path="/relationship/:relationshipId" element={<Relationship user={currentUser} />} />
        <Route path="/testing" element={<TestingCookies />} />

      </Routes>
      }
    </div>
  );
}

export default App;
