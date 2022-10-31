import React, { useState, useEffect } from 'react';
import { getTopics, createRelationship } from '../../services/services'

function CreateRelationshipModal({ isOpen, onClose, createNewRelationship, mentorId, communityId }) {
    const [topics, setTopics] = useState([])
    const [relationship, setRelationship] = useState({
        mentor_id: mentorId,
        topic_id: null,
        community_id: communityId,
        isEstablished: false,
        description: ''
    })

    useEffect(() => {
        getTopics()
        .then(d => setTopics(d.data))
    }, [])

    function setTopic(e) {
        setRelationship({ ...relationship, topic_id: parseInt(e.target.value) })
    }

    const handleChange = (e) => {
        const { name, value } = e.target
        setRelationship({ ...relationship, [name]: value })
    }

    function renderClass() {
        return isOpen ? 'create-relationship-modal' : 'create-relationship-modal hidden';
    }

    async function onSave() {
        const response = await createRelationship(relationship)
        if(response.status === 201) {
            createNewRelationship(response.data)
            onClose()
        } else {
            console.log('Something went wrong!');
        }
    }

    const { description } = relationship
    return ( 
        <div className={renderClass()}>
            <div className="create-relationship-modal-container">
                <h1 className="mb-10">Create New Relationship</h1>

                <div className="generic-input mb-10">
                    <h3>Description</h3>
                    <textarea type="text" value={description} onChange={handleChange} name="description" />
                </div>

                <div className="generic-input mb-10">
                    <h3>Topic</h3>
                    <select onChange={setTopic}>
                        <option defaultValue disabled hidden>Select a Topic</option>
                        {topics.map(topic => {
                                return <option key={topic.id} value={topic.id}>{topic.name}</option>
                        })}
                    </select>
                </div>
                
                
                <div className="modal-break black mb-10"></div>
                <div className="flex">
                    <button onClick={onSave} className="btn outline black mr-10">Save</button>
                    <button onClick={onClose} className="btn outline black mr-10">Discard</button>
                </div>
            </div>
        </div>
    );
}

export default CreateRelationshipModal;