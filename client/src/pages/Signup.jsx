import React, { useState, useEffect } from 'react';
import UserInfoInput from '../components/reusables/UserInfoInput';

function Signup() {
    const [roleType, setRoleType] = useState('mentee')
    const [userInfo, setUserInfo] = useState({
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
        password: '',
        password_confirmation: ''
    })
    const { firstName, lastName, email, phone, password, password_confirmation } = userInfo;

    function renderButtonClasses(input) {
        if(roleType === input) {
            return 'btn outline selected'
        } else {
            return 'btn outline'
        }
    }

    const handleChange = (e) => {
        const { name, value } = e.target
        setUserInfo({ ...userInfo, [name]: value })
    }

    function handleSubmit() {

    }


    return (
        <div className="container">
            <div className="center">
                <div className="sign-up-login-modal">
                    <h1 className="mb-20">Sign up to be a:</h1>
                    
                    {/* signup buttons */}
                    <div className='flex mb-20'>
                        <div className='mr-20'>
                            <button onClick={() => setRoleType('mentee')} className={renderButtonClasses('mentee')} >Mentee</button>
                        </div>
                        <button onClick={() => setRoleType('mentor')} className={renderButtonClasses('mentor')}>Mentor</button>
                    </div>

                    {/* line */}
                    <div className='modal-break mb-20'></div>

                    <div className='flex'>
                        <div className="mr-20">
                        <UserInfoInput
                            label="First Name"
                            onChange={handleChange}
                            name="firstName"
                            value={firstName}
                        />
                        </div>

                        <UserInfoInput
                            label="Last Name"
                            onChange={handleChange}
                            name="lastName"
                            value={lastName}
                        />

                    </div>

                    <div className='flex'>
                        <div className="mr-20">
                        <UserInfoInput
                            label="Email"
                            onChange={handleChange}
                            name="email"
                            value={email}
                        />
                        </div>

                        <UserInfoInput
                            label="Phone (optional)"
                            onChange={handleChange}
                            name="phone"
                            type='number'
                            value={phone}
                        />
                    </div>


                    <div className='flex'>
                        <div className="mr-20">
                        <UserInfoInput
                            label="Password"
                            onChange={handleChange}
                            name="password"
                            type='password'
                            value={password}
                        />
                        </div>

                        <UserInfoInput
                            label="Confirm Password"
                            type='password'
                            onChange={handleChange}
                            name="password_confirmation"
                            value={password_confirmation}
                        />
                    </div>
                     <button onClick={handleSubmit} className='btn outline black xl'>Signup</button>

                </div>

            </div>
        </div>
    );
}

export default Signup;