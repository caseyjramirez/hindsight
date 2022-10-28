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
  console.log(currentUser);

  useEffect(() => {
    console.log('called');
    authorizeUser()
    .then(d => {
      setCurrentUser(d.data)
    })
  }, [])

  function addRelationship(newRelationship) {
    console.log(newRelationship);
    setCurrentUser({...currentUser, relationships: [...currentUser.relationships, newRelationship]})
  }
  
  // console.log(currentUser);

  return (
    <div className="App">
      <Navbar isLoggedIn={currentUser} logUserOut={() => setCurrentUser(false)} />
      {
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/signup" element={<Signup setUser={setCurrentUser} />} />
        <Route path="/login" element={<Login setUser={setCurrentUser} />} />
        <Route path="/home" element={<Dashboard user={currentUser} createNewRelationship={addRelationship}/>} />
        <Route path="/relationship/:relationshipId" element={<Relationship user={currentUser} />} />
        <Route path="/testing" element={<TestingCookies />} />
      </Routes>
      }
    </div>
    // <div className="App">
    //   <Navbar />
    //   {
    //     !currentUser ? <Login setUser={setCurrentUser} /> : 
    //   <Routes>
    //     <Route path="/" element={<Home />} />
    //     <Route path="/signup" element={<Signup setUser={setCurrentUser} />} />
    //     <Route path="/login" element={<Login setUser={setCurrentUser} />} />
    //     <Route path="/home" element={<Dashboard relationships={relationships} user={currentUser} createNewRelationship={addRelationship}/>} />
    //     <Route path="/relationship/:relationshipId" element={<Relationship user={currentUser} />} />
    //     <Route path="/testing" element={<TestingCookies />} />

    //   </Routes>
    //   }
    // </div>
  );
}

export default App;
