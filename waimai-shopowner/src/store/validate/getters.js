export default {
    //base
    module: state => state.module,
    name: state => state.name,

    //login
    userInfo: state => state.userInfo,

    //shop
    shops:state=>state.shops,
    shopIds:state=>{
        return state.shops.map(el=>el.id)
    }

}