const mentorAPI = `/mentors`
const menteeAPI = `/mentees`
const topicAPI = `/topics`
const relationshipAPI = `/relationships`
const loginAPI = `/login`
const logoutAPI = `/logout`
const authorizeUserAPI = `/authorized_user`
const getRelationshipAPI = id => `/relationships/${id}`

export {
    mentorAPI,
    menteeAPI,
    loginAPI,
    logoutAPI,
    authorizeUserAPI,
    getRelationshipAPI,
    topicAPI,
    relationshipAPI
}