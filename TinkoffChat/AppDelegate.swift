//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Sergey Korobin on 20.09.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var prevState = "Not running"
    var newState : String!
    var finalString: String!
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        window = UIWindow.init(frame: UIScreen.main.bounds) // инициализация окна
//        if let keyWindow = window //undbinding?
//        {
//            keyWindow.rootViewController = ProfileViewController() // связать с рутом
//            keyWindow.makeKeyAndVisible()
//            
//        }
        // Вызывается при удачной инициализации приложения
        newState = "Foreground Inactive"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //Приостановка работы приложения. Например: входящий вызов или нажатие на кнопку Home.
        newState = "Foreground Inactive"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //Переход в состояние фонового выполнения задач.
        newState = "Background"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //Приложение перешло в состояние Foreground Inactive, оно было вызвано из свернутого состояния и было в фоновом состоянии.
        newState = "Foreground Inactive"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //Приложение снова стало активным.
        newState = "Foreground Active"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //При закрытии приложения. Вызывается только при работе приложения, не вызывается из состояния Suspended.
        newState = "Not Running"
        finalString = "Application moved from " + prevState + " to " + newState + " state: "
            + StateName() + "\n"
        print(finalString)
        prevState = newState
    }
    
    //Функция, возвращающая имя функции, из которой она была вызвана.
    func StateName(string: String = #function) -> String {
        return string
    }

}

