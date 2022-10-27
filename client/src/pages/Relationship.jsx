import React, { useState, useEffect } from 'react';
import { getRelationship } from '../services/services';
import { useParams } from 'react-router-dom';

function Relationship({ user }) {
    let { relationshipId } = useParams();
    const [relationship, setRelationship] = useState({
        mentee: {
            first_name: "",
            last_name: "",
        }
    })
    
    useEffect(() => {
        getRelationship(relationshipId)
        .then(d => setRelationship(d.data))
    }, [])
    
    function renderTitle() {
        return relationship.isEstablished? `Relationship With ${mentee.first_name}` : "View Applicants";
    }
    
    
    const { mentee, topic, community } = relationship
    console.log(relationship);
    return (
        <div className='dashboard relationship'>
            <div className="container">
                <div className="dashboard-container">
                    <div className="spacer-40"></div>
                    <h1>{renderTitle()}</h1>

                </div>
            </div>
            
        </div>
    );
}

export default Relationship;