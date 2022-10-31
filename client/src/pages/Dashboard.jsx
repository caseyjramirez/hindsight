import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import stockProfilePic from '../assets/stockProfilePic.jpg'
import RelationshipCard from '../components/reusables/relationshipCard';
import CreateRelationshipModal from '../components/home/createRelationshipModal';

function Dashboard({ user, createNewRelationship }) {
    const navigate = useNavigate();

    const [isCreateingNewRelationship, setIsCreateingNewRelationship] = useState(false)
    const [browsing, setBrowsing] = useState('relationships')
    const { first_name, last_name, email, phone_number, relationships, community, user_type, id } = user;

    function handleRelationshipClick(id) {
        navigate(`/relationship/${id}`)
    }

    function renderUserTypeBadge() {
        if(user_type.name === 'mentor') {
            return <h3 className='user-community mentor fw-regular mr-10'>Mentor</h3>
        } else {
            return <h3 className='user-community mentee fw-regular mr-10'>Mentee</h3>
        }
    }

    function renderBrowseButtonClasses(option) {
        return option === browsing ? 'btn outline black selected create-posting mr-20' : 'btn outline black create-posting mr-20';
    }

    return (
        <div>
            <CreateRelationshipModal 
                isOpen={isCreateingNewRelationship}
                onClose={() => setIsCreateingNewRelationship(false)}
                createNewRelationship={createNewRelationship}
                mentorId={id}
                communityId={community.id}
            />

            <div className="dashboard">
                <div className="container">
                    <div className="dashboard-container">
                        <div className='flex'>
                            <img src={stockProfilePic} alt="stock profile pic" className='user-photo'/>
                            <div className='user-info-header'>
                                <h1 className='user-name mb-5'>{first_name} {last_name}</h1>
                                <div className="flex">
                                    {renderUserTypeBadge()}
                                    <h3 className='user-community fw-regular mr-10'>|</h3>
                                    <h3 className='user-community fw-regular mr-10'>{community.name}</h3>
                                    <h3 className='user-community fw-regular mr-10'>|</h3>
                                    <h3 className='user-community fw-regular mr-10'>{community.city}, {community.state}</h3>
                                </div>
                            </div>
                        </div>

                        <div className="modal-break break mb-40"></div>
                        <div className='flex searchbar'>
                            <button onClick={() => setIsCreateingNewRelationship(true)} className='btn outline grey create-posting mr-20' >Create New Relationship</button>
                            <input type="text" />
                        </div>
                        <div className='mb-20'>
                            <button onClick={() => setBrowsing('relationships')} className={renderBrowseButtonClasses('relationships')} >Browse Relationships</button>
                            <button onClick={() => setBrowsing('postings')} className={renderBrowseButtonClasses('postings')} >Browse Postings</button>
                        </div>

                        <div className='relationship-container'>
                            {
                                relationships.map(relationship => {
                                    return <RelationshipCard data={relationship} onClick={handleRelationshipClick}/>
                                })
                            }
                            <div className="modal-break black mt-10"></div>
                       </div>

                       <div className="footer"></div>



                    </div>
                </div>

            </div>
        </div>
    );
}

export default Dashboard;