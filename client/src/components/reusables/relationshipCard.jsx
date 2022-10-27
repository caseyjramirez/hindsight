
function RelationshipCard({ data, onClick }) {
    const { mentee, community, topic, id } = data
    return (
        <div className="relationship-object">
            <div className="modal-break black mb-10"></div>
            {/* <div className="mb-10"></div> */}
            <div className="container">
                <div className='flex space-between mb-5'>
                    <h1 onClick={() => onClick(id)}>{mentee.first_name} {mentee.last_name}</h1>
                    <div>
                        <div className='tag'>
                            <p>Established</p>
                        </div>
                    </div>
                </div>
                <div className="flex mb-15">
                    <p className="mr-5">{topic.name}</p>
                    <p className="mr-5">|</p>
                    <p className="mr-5">{community.name}</p>
                    <p className="mr-5">|</p>
                    <p className="mr-5">{community.city}, {community.state}</p>

                </div>
            </div>
        </div>
    );
}

export default RelationshipCard;