import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import UserInfoInput from '../components/reusables/UserInfoInput';
import { login } from '../services/services';

function Login({ setUser }) {
    const navigate = useNavigate();

    const [loginInfo, setLoginInfo] = useState({
        email: '',
        password: ''
    })

    const handleChange = (e) => {
        const { name, value } = e.target
        setLoginInfo({ ...loginInfo, [name]: value })
    }

    async function handleSubmit() {
        const data = await login(loginInfo)
        // console.log(data);
        if(data.status === 200) {
            setUser(data.data)
            navigate('/home')
        } else {
            console.log(data);
        }
        
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

                    <button onClick={handleSubmit} className='btn outline black xl'>Login</button>
                </div>
            </div>
        </div>
    );
}

export default Login;