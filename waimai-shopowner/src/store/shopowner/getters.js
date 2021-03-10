export default {
    module: state => state.module,
    name: state => state.name,

    //order
    orderList: state => state.orderList,
    sortByTimeOrderList: state => {
        let copyOrderList = [...state.orderList]
        copyOrderList.sort((a, b) => {
            return b.id - a.id
        })
        return copyOrderList
    },
    newOrderList:state=>state.newOrderList,
    historyOrderList:state=>state.historyOrderList,
    updateOrderFlag:state=>state
};