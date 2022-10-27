
import axios from "axios";
import { 
    mentorAPI, 
    menteeAPI, 
    loginAPI,
    authorizeUserAPI,
    getRelationshipAPI,
    topicAPI
} from "./apis";

async function createMentor(body) {
    try {
        return await axios({
            method: 'post',
            url: mentorAPI,
            data: body
        })
    } catch (error) {
        return error
    }
}

async function createMentee(body) {
    try {
        return await axios({
            method: 'post',
            url: menteeAPI,
            data: body
        })
    } catch (error) {
        return error
    }
}

async function login(body) {
    try {
        return await axios({
            method: 'post',
            url: loginAPI,
            data: body
        })
    } catch (error) {
        return error
    }
}

async function authorizeUser() {
    try {
        return await axios({
            method: 'get',
            url: authorizeUserAPI
        })
    } catch (error) {
        return error
    }
}

async function getRelationship(id) {
    try {
        return await axios({
            method: 'get',
            url: getRelationshipAPI(id)
        })
    } catch (error) {
        return error
    }
}

async function getTopics() {
    try {
        return await axios({
            method: 'get',
            url: topicAPI
        })
    } catch (error) {
        return error
    }
}

export {
    createMentor,
    createMentee,
    login,
    authorizeUser,
    getRelationship,
    getTopics
}