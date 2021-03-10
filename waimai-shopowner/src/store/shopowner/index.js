import state from "./state";
import mutations from "./mutations";
import getters from "./getters";
import actions from "./actions";

export default {
    namespaced: true,//增加命名空间
    state,
    getters,
    mutations,
    actions
};