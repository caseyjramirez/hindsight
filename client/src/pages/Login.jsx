import React, { useState } from 'react';
import UserInfoInput from '../components/reusables/UserInfoInput';

function Login() {
    const [loginInfo, setLoginInfo] = useState({
        email: '',
        password: ''
    })

    const handleChange = (e) => {
        const { name, value } = e.target
        setLoginInfo({ ...loginInfo, [name]: value })
    }

    function handleSubmit() {
        
    }



    const { email, password } = loginInfo
    return (
        <div className='container'>
            <div className='center'>
                <div className="sign-up-login-modal">
                    {/* title */}
                    <h1 className='mb-20'>Login</h1>
                    
                    {/* break */}
                    <div className='modal-break mb-20'></div>
                    
                    {/* inputs */}
                    <UserInfoInput
                        label="Email"
                        onChange={handleChange}
                        name="email"
                        value={email}
                    />

                    <UserInfoInput
                        label="Password"
                        type='password'
                        onChange={handleChange}
                        name="password"
                        value={password}
                    />

                    <button onClick={handleSubmit} className='btn outline black xl'>Signup</button>
                </div>
            </div>
        </div>
    );
}

export default Login;