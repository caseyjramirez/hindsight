import * as React from "react";
import { Routes, Route, Link } from "react-router-dom";
import Navbar from './components/reusables/Navbar'
import Home from "./pages/Home";
import Signup from './pages/Signup'
import Login from "./pages/Login";

function App() {
  return (
    <div className="App">
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/login" element={<Login />} />
      </Routes>
    </div>
  );
}

export default App;
