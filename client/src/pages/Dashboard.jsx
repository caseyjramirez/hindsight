import stockProfilePic from '../assets/stockProfilePic.jpg'
import RelationshipCard from '../components/reusables/relationshipCard';

function Dashboard({ user }) {
    const { first_name, last_name, email, phone_number, community, relationships, role } = user;

    return (
            <div className="dashboard">
                <div className="container">
                    <div className="dashboard-container">
                        <div className='flex'>
                            <img src={stockProfilePic} alt="stock profile pic" className='user-photo'/>
                            <div className='user-info-header'>
                                <h1 className='user-name mb-5'>{first_name} {last_name}</h1>
                                <div className="flex">
                                    <h3 className='user-community fw-regular mr-10'>{role}</h3>
                                    <h3 className='user-community fw-regular mr-10'>|</h3>
                                    <h3 className='user-community fw-regular mr-10'>{community.name}</h3>
                                    <h3 className='user-community fw-regular mr-10'>|</h3>
                                    <h3 className='user-community fw-regular mr-10'>{community.city}, {community.state}</h3>
                                </div>
                            </div>
                        </div>

                        <div className="modal-break break mb-40"></div>
                        <div className='flex searchbar mb-10'>
                            <button className='btn outline grey create-posting mr-20' >Create New Relationship</button>
                            <input type="text" />
                        </div>

                        <div className='relationship-container'>
                            <RelationshipCard
                                data={relationships[0]}
                            />
                        </div>



                    </div>
                </div>

            </div>
    );
}

export default Dashboard;