export default {
    //base
    module: 'customer',
    name: '顾客端模块',

    //shop query
    homePageShopResult: [],
    searchPageShopResult: [],
    shopById: {},

    //food query
    shopFoodsResult: [],

    //cart manager
    cartList: [],
    cartListByShopId: [],
    updateFlag: 0,
    shopCartTotalPrice: {
        sellPrice: 0,
        originalPrice: ''
    },

    //user address
    userAddressList: [],
    /**
     * "list": [
     {
      "id": 1,
      "userId": 1,
      "username": "王sir",
      "gender": "男",
      "mobile": "18752151001",
      "adress": "广东工业大学",
      "gmtCreate": "2020-10-29 14:14:47",
      "gmtModified": "2020-10-29 14:14:49"
    },
     {
      "id": 2,
      "userId": 1,
      "username": "吴sir",
      "gender": "男",
      "mobile": "18752151001",
      "adress": "广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx",
      "gmtCreate": "2020-10-29 14:14:47",
      "gmtModified": "2020-10-29 14:14:49"
    }
     ]
     */

    //commit order
    userAddressSelected: {},
    commitFoodList: [],

    //user order list
    ordersByUserId: []

    /**
     * "list": [
     {
          "id": 103,
          "userId": 1,
          "userUsername": "吴sir",
          "userMobile": "18752151001",
          "userAddressId": 2,
          "userAddress": "广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx",
          "note": "",
          "shopShopname": "正信鸡排",
          "shopMobile": "18752151002",
          "shopAddress": "迎龙路01号",
          "deliverId": null,
          "deliverName": null,
          "deliverMobile": null,
          "shopId": 1,
          "boxCost": 2,
          "sendCost": 1,
          "totalMoney": 39,
          "completestatus": "商家已接单",
          "gmtCreate": "2020-11-11 10:02:59",
          "gmtModified": "2020-11-11 10:02:59"
        },
     ]
     */

    // {
    //     "id": 287,
    //     "orderId": 103,
    //     "shopId": 1,
    //     "shopname": null,
    //     "foodId": 0,
    //     "title": "正信鸡排",
    //     "cover": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg",
    //     "originPrice": 18,
    //     "sellPrice": 12,
    //     "numbers": 3,
    //     "gmtCreate": "2020-11-11 10:02:59",
    //     "gmtModified": "2020-11-11 10:02:59"
    // }

}