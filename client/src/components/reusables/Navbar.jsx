import { Link, NavLink } from "react-router-dom";

function Navbar() {
    return (
        <div className="navbar">
            <div className="navbar-container flex space-between ai-center">
                <Link className="logo" to="/">hindsight</Link>
                <div className="flex ai-center">
                    <div className=''>
                        <NavLink className='mx-10' to='/communities'>Communities</NavLink>
                        <NavLink className='mx-10' to='/about'>About</NavLink>
                    </div>
                    {/* <Link className="btn login mx-10" to="/signup">Sign Up</Link> */}
                    <Link className="btn login mx-10" to="/login">Login</Link>
                </div>
            </div>
            <div className="breaker"></div>
        </div>
    );
}

export default Navbar;