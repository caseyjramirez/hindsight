import { Link } from "react-router-dom";

function Home() {
    return (
        <div className="container">
            <div className="mission-statement">
                <h1 className="mb-20">Breaking down the generational wisdom gap.</h1>
                <Link to='/signup' className="btn">Start Today</Link>
            </div>
        </div>
    );
}

export default Home;