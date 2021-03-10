import * as types from "./mutation-types";

export default {
    //base
    [types.SET_MODULE](state, data) {
        state.module = data;
    },
    [types.SET_NAME](state, data) {
        state.name = data;
    },

    //login
    [types.SET_USER_INFO](state, data) {
        state.userInfo = data;
    },
}