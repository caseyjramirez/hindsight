function UserInfoInput({label, onChange, name, value, type = 'text'}) {
    return (
        <div className="user-info-input mb-30">
            <p className="ml-10 mb-5">{label}</p>
            <input type={type} name={name} value={value} onChange={onChange} />
        </div>
    );
}

export default UserInfoInput;