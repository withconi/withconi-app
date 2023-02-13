import UIKit
import Flutter
import NaverThirdPartyLogin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }

                
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }


    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var result = false
        
        NSLog("URL = \(url.absoluteString)")
        
   
        // if !result {
        //     result = NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
        // }
        // return result

        // if url.absoluteString.hasPrefix("naver"){
        //     result = super.application(app, open: url, options: options)
        // }
        
        //네이버 앱 깔려있는 경우 Invalid Date 오류 뜨는 부분 때문에 추가함
        if (!result) {
           result = NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
        }
        if url.absoluteString.hasPrefix("kakao"){
            result = super.application(app, open: url, options: options)
        }

        if (!result) {
           result = super.application(app, open: url, options: options)
        }
        return result
        //네이버 앱 깔려있는 경우 Invalid Date 오류 뜨는 부분 때문에 추가함 

    }
    
}


