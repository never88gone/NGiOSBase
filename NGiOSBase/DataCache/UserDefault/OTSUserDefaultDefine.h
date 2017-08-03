//
//  OTSUserDefaultDefine.h
//  OneStoreFramework
//
//  Created by Aimy on 14-6-29.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

//api 地址
UIKIT_EXTERN NSString *const OTS_NETWORK_ENVIROMNMENT;

UIKIT_EXTERN NSString *const BI_SessionId;
UIKIT_EXTERN NSString *const BI_SessionTimeOut;
UIKIT_EXTERN NSString *const BI_OpenTrucku;

UIKIT_EXTERN NSString *const BI_BIcheckIsOpen; //埋点校验开关

UIKIT_EXTERN NSString *const OTS_SCREENSHOT_IS_CLOSE; //摇一摇截屏开关

UIKIT_EXTERN NSString *const OTS_DEF_KEY_SAVED_PROVINCE;            //省份id
UIKIT_EXTERN NSString *const OTS_DEF_KEY_SAVED_PROVINCE_NAME;       //省份名称
UIKIT_EXTERN NSString *const OTS_DEF_KEY_LOCATION_CITYNAME;         //城市名字
UIKIT_EXTERN NSString *const OTS_DEF_KEY_CURRENT_CITYID;            //cityid
UIKIT_EXTERN NSString *const OTS_DEF_KEY_SESSION_ID;                //session id
UIKIT_EXTERN NSString *const OTS_DEF_KEY_LAST_RUN_VERSION;          //for first lunch

//爱分享
UIKIT_EXTERN NSString *const OTS_DEF_KEY_HIDE_ISHARE_GUIDER;        //隐藏爱分享首页引导
UIKIT_EXTERN NSString *const OTS_DEF_KEY_HIDE_ISHARE_SELECT_GUIDER; //隐藏爱分享抵用券选择页引导

UIKIT_EXTERN NSString *const UserDefaultAutoLogin;

//更新有奖
UIKIT_EXTERN NSString *const OTS_DEF_KEY_HAVE_CREATED_MESSAGE;      //版本更新是否已创建消息

//apollo url string
UIKIT_EXTERN NSString *const OTS_DEF_KEY_APOLLO_URL_STRING;
//normal,apollo,walmart
UIKIT_EXTERN NSString *const OTS_DEF_KEY_REGION_TYPE;
//地址
UIKIT_EXTERN NSString *const OTS_ADDRESS_VERSION;                   //当前省市区地址版本

UIKIT_EXTERN NSString *const OTS_DEF_KEY_ABTEST;                    //ABTest的key

//可配置打标相关
UIKIT_EXTERN NSString *const OTS_APP_TAG_VERSION;                   //可配置标签规则版本
UIKIT_EXTERN NSString *const OTS_APP_TAG_REDUCE_CODE;               //满减
UIKIT_EXTERN NSString *const OTS_APP_TAG_DISCOUNT_CODE;             //满折
UIKIT_EXTERN NSString *const OTS_APP_TAG_GIFT_CODE;                 //满赠
UIKIT_EXTERN NSString *const OTS_APP_TAG_SALE_CODE;                 //优惠
UIKIT_EXTERN NSString *const OTS_APP_TAG_INTEGRATE_CODE;            //积分购
UIKIT_EXTERN NSString *const OTS_APP_TAG_GROUPON_CODE;              //团购价
UIKIT_EXTERN NSString *const OTS_APP_TAG_FLASH_CODE;                //闪购价
UIKIT_EXTERN NSString *const OTS_APP_TAG_LP_CODE;                   //LP
UIKIT_EXTERN NSString *const OTS_APP_TAG_WIRELESS_CODE;             //无线专享
UIKIT_EXTERN NSString *const OTS_APP_TAG_PRESELL_CODE;              //全款预售
UIKIT_EXTERN NSString *const OTS_APP_TAG_CHANGE_CODE;               //换购价
UIKIT_EXTERN NSString *const OTS_APP_TAG_MEDAL_CODE;                //勋章价
UIKIT_EXTERN NSString *const OTS_APP_TAG_VIP_CODE;                  //会员价
UIKIT_EXTERN NSString *const OTS_APP_TAG_JD_CODE;                   //低京东
UIKIT_EXTERN NSString *const OTS_APP_TAG_LOWEST_CODE;               //一贵就赔
UIKIT_EXTERN NSString *const OTS_APP_TAG_MEDAL_OR_VIP_CODE;         //VIP或勋章价 购物车的
UIKIT_EXTERN NSString *const OTS_APP_TAG_REDUCE_PRICE_CODE;         //降价