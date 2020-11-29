//
//  AppDelegate.swift
//  SaltSide
//
//  Created by Akash Sidhwani on 29/11/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.\
    if #available(iOS 13.0, *) {
      window?.overrideUserInterfaceStyle = .light
    }
    moveToMainView()
    return true
  }
  func moveToMainView() {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
    let navigationController = InitialNavigationController(rootViewController: vc!)
    navigationController.navigationBar.isHidden = true
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
  }
}

