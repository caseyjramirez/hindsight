import React, { useState } from 'react';

function RelationshipCard({ data }) {
    const { mentee } = data

    console.log(data);
    return (
        <div>
            <div className="modal-break black mb-10"></div>
            <div className="container">
                <div className='flex space-between'>
                    <h1>{mentee.first_name} {mentee.last_name}</h1>
                    <div>
                        <div className='tag'>
                            <p>Established</p>
                        </div>

                    </div>
                </div>
            </div>
            <div className="modal-break black mt-10"></div>
        </div>
    );
}

export default RelationshipCard;