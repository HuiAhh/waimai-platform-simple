import Vue from "vue";
import Vuex from "vuex";

import shopowner from "./shopowner";
import validate from "./validate";

import createLogger from "vuex/dist/logger";
Vue.use(Vuex);
const debug = process.env.NODE_ENV !== "production";
export default new Vuex.Store({
  modules: {
    shopowner,
    validate
  },
  strict: debug,
  plugins: debug ? [createLogger()] : []
});