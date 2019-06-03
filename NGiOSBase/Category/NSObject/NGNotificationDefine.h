//
//  NGNotificationDefine.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

/**
 *  注销
 */
UIKIT_EXTERN NSString *const NotificationLogout;
/**
 *  登录成功
 */
UIKIT_EXTERN NSString *const NotificationLogin;
/**
 *  登录失败
 */
UIKIT_EXTERN NSString *const NotificationLoginFailed;
/**
 *  取消登录（登录页面点击返回按钮会触发）
 */
UIKIT_EXTERN NSString *const NotificationLoginCanceled;

/**
 *  微信联合登录成功后从微信转到app时发送的通知，登录模块会处理，其它模块不需要处理。
 *  登录成功后还会再发送 NotificationLogin 通知。
 */
UIKIT_EXTERN NSString *const NotificationWeichatLogin;
/**
 *  微博客户端联合登录成功后从微博转到app时发送的通知，登录模块会处理，其它模块不需处理。
 *  登录成功后还会再发送 NotificationLogin 通知。
 */
UIKIT_EXTERN NSString *const NotificationWeiboClientLogin;

/**
 *  网络状态更新
 */
UIKIT_EXTERN NSString *const NotificationNetworkStatusChange;

/**
 *  有网络
 */
UIKIT_EXTERN NSString *const NotificationNetworkStatusReachable;

/**
 *  微信支付返回APP时的通知
 */
UIKIT_EXTERN NSString *const NotificationWeichatPay;

/**
 *  微信分享返回APP时的通知
 */
UIKIT_EXTERN NSString *const NotificationWeichatShare;


//app
#define NG_APP_WILL_RESIGN_ACTIVE          UIApplicationWillResignActiveNotification
#define NG_APP_DID_ENTER_BACKGROUND        UIApplicationDidEnterBackgroundNotification
#define NG_APP_WILL_ENTER_FOREGROUND       UIApplicationWillEnterForegroundNotification
#define NG_APP_DID_BECOME_ACTIVE           UIApplicationDidBecomeActiveNotification

//网络
#define NG_SHOW_ERROR_VIEW                 @"NG_SHOW_ERROR_VIEW"//显示错误界面(无网络连接，或者服务器忙)

#define NG_HIDE_NO_CONNECT_ERROR_VIEW      @"NG_HIDE_NO_CONNECT_ERROR_VIEW"//隐藏无网络错误界面

#define NG_SHOW_NETWORK_FORCE                 @"NG_SHOW_NETWORK_FORCE"//显示网络强制提示

#define NG_HOMEPAGE_SHOW_NOWORK              @"NG_HOMEPAGE_SHOW_NOWORK" //首页无网络提示

#define NG_UNION_LOGIN_BACK                @"NG_UNION_LOGIN_BACK"//联合登录返回

#define NG_CHANGE_STATUSBAR_FRAME      @"UIApplicationDidChangeStatusBarFrameNotification" //app状态栏发送变化，主要是打电话

//监测到晃动
#define NG_NOTIFICATION_SHAKE              @"NG_NOTIFICATION_SHAKE"//监测到晃动
