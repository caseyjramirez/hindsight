import { Link, NavLink, useNavigate } from "react-router-dom";
import { logout } from '../../services/services'

function Navbar({ isLoggedIn, logUserOut }) {
    const navigate = useNavigate();
    
    function renderNavLinks() {
        return isLoggedIn ? (
            <>
                <NavLink className='mx-10' to='/home'>Dashboard</NavLink>
                <NavLink className='mx-10' to='/communities'>Communities</NavLink>
                <NavLink className='mx-10' to='/about'>About</NavLink>
            </>
        ) : (
            <>
                <NavLink className='mx-10' to='/communities'>Communities</NavLink>
                <NavLink className='mx-10' to='/about'>About</NavLink>
            </>
        );
    }
    
    async function handleLogout() {
        console.log('object');
        logout()
        .then(res => {
            console.log(res);
            logUserOut()
            navigate('/')
        })
    }

    function renderActionButton() {
        return isLoggedIn ? (
            <>
                <button className="btn login mx-10" onClick={handleLogout} >Logout</button>
            </>
        ) : (
            <>
                <Link className="btn login mx-10" to="/login">Login</Link>
            </>
        );
    }


    return (
        <div className="navbar">
            <div className="navbar-container flex space-between ai-center">
                <Link className="logo" to="/">hindsight</Link>
                <div className="flex ai-center">
                    <div className=''>
                        {renderNavLinks()}
                    </div>
                    {renderActionButton()}
                </div>
            </div>
            <div className="breaker"></div>
        </div>
    );
}

export default Navbar;