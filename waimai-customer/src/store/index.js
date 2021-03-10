import Vue from "vue";
import Vuex from "vuex";

import customer from "./customer";
import deliveryman from "./deliveryman";
import validate from "./validate";


import createLogger from "vuex/dist/logger";
Vue.use(Vuex);
const debug = process.env.NODE_ENV !== "production";
export default new Vuex.Store({
  modules: {
    customer,
    deliveryman,
    validate
  },
  strict: debug,
  plugins: debug ? [createLogger()] : []
});