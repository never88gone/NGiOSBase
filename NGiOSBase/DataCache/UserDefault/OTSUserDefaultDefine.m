//
//  OTSUserDefaultDefine.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSUserDefaultDefine.h"

NSString *const OTS_NETWORK_ENVIROMNMENT              = @"OTS_NETWORK_ENVIROMNMENT";

NSString *const BI_SessionId                          = @"BI_SessionId";
NSString *const BI_SessionTimeOut                     = @"BI_SessionTimeOut";
NSString *const BI_OpenTrucku                         = @"BI_OpenTrucku";
NSString *const BI_BIcheckIsOpen                         = @"BI_BIcheckIsOpen";  //埋点校验开关

//摇一摇截屏开关
NSString *const OTS_SCREENSHOT_IS_CLOSE               = @"OTS_SCREENSHOT_IS_CLOSE";

NSString *const OTS_DEF_KEY_SAVED_PROVINCE            = @"OTS_DEF_KEY_SAVED_PROVINCE";//省份id
NSString *const OTS_DEF_KEY_SAVED_PROVINCE_NAME       = @"OTS_DEF_KEY_SAVED_PROVINCE_NAME";//省份名称
NSString *const OTS_DEF_KEY_LOCATION_CITYNAME         = @"OTS_DEF_KEY_LOCATION_CITYNAME";//定位的城市名字，和其他无关
NSString *const OTS_DEF_KEY_CURRENT_CITYID            = @"OTS_DEF_KEY_CURRENT_CITYID";//cityid
NSString *const OTS_DEF_KEY_SESSION_ID                = @"OTS_DEF_KEY_SESSION_ID";//session id
NSString *const OTS_DEF_KEY_LAST_RUN_VERSION          = @"OTS_DEF_KEY_LAST_RUN_VERSION";//for first lunch

//爱分享
NSString *const OTS_DEF_KEY_HIDE_ISHARE_GUIDER        = @"OTS_DEF_KEY_HIDE_ISHARE_GUIDER";//隐藏爱分享首页引导
NSString *const OTS_DEF_KEY_HIDE_ISHARE_SELECT_GUIDER = @"OTS_DEF_KEY_HIDE_ISHARE_SELECT_GUIDER";//隐藏爱分享抵用券选择页引导

//登录
NSString *const UserDefaultAutoLogin = @"userdefault.passport.autoLogin";

//更新有奖
NSString *const OTS_DEF_KEY_HAVE_CREATED_MESSAGE      = @"OTS_DEF_KEY_HAVE_CREATED_MESSAGE";//版本更新是否已创建消息

//apollo
NSString *const OTS_DEF_KEY_APOLLO_URL_STRING         = @"OTS_DEF_KEY_APOLLO_URL_STRING";//apollo
NSString *const OTS_DEF_KEY_REGION_TYPE               = @"OTS_DEF_KEY_REGION_TYPE";//normal,apollo,walmart

//地址
NSString *const OTS_ADDRESS_VERSION                   = @"OTS_ADDRESS_VERSION";

NSString *const OTS_DEF_KEY_ABTEST                    = @"OTS_DEF_KEY_ABTEST";//ABTest的key

//打标可配置相关
NSString *const OTS_APP_TAG_VERSION                   = @"OTS_APP_TAG_VERSION"; //规则版本
NSString *const OTS_APP_TAG_REDUCE_CODE               = @"#10001"; //满减
NSString *const OTS_APP_TAG_DISCOUNT_CODE             = @"#10002"; //满折
NSString *const OTS_APP_TAG_GIFT_CODE                 = @"#10003"; //满赠
NSString *const OTS_APP_TAG_SALE_CODE                 = @"#10004"; //优惠
NSString *const OTS_APP_TAG_INTEGRATE_CODE            = @"#10005"; //积分购
NSString *const OTS_APP_TAG_GROUPON_CODE              = @"#20001"; //团购价
NSString *const OTS_APP_TAG_FLASH_CODE                = @"#20002"; //闪购价
NSString *const OTS_APP_TAG_LP_CODE                   = @"#20003"; //LP
NSString *const OTS_APP_TAG_WIRELESS_CODE             = @"#20004"; //无线专享
NSString *const OTS_APP_TAG_PRESELL_CODE              = @"#20005"; //全款预售
NSString *const OTS_APP_TAG_CHANGE_CODE               = @"#20006"; //换购价
NSString *const OTS_APP_TAG_MEDAL_CODE                = @"#20007"; //勋章价
NSString *const OTS_APP_TAG_VIP_CODE                  = @"#20008"; //会员价
NSString *const OTS_APP_TAG_JD_CODE                   = @"#20009"; //低京东
NSString *const OTS_APP_TAG_LOWEST_CODE               = @"#20010"; //一贵就赔
NSString *const OTS_APP_TAG_MEDAL_OR_VIP_CODE         = @"#20011"; //VIP或勋章价 购物车的
NSString *const OTS_APP_TAG_REDUCE_PRICE_CODE         = @"#20012"; //降价 买过的
