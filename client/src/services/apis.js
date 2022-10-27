const mentorAPI = `/mentors`
const menteeAPI = `/mentees`
const topicAPI = `/topics`
const relationshipAPI = `/relationships`
const loginAPI = `/login`
const authorizeUserAPI = `/authorized_user`
const getRelationshipAPI = id => `/relationships/${id}`

export {
    mentorAPI,
    menteeAPI,
    loginAPI,
    authorizeUserAPI,
    getRelationshipAPI,
    topicAPI,
    relationshipAPI
}