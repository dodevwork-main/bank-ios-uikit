//
//  MainModuleAssembly.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation
import UIKit

final class MainModuleAssembly {
    
    func makeModule(currentUser: CurrentUser, selectedIndex: Int = HomeAssebmly.tabTag) -> UIViewController {
        
        // Make Modules
        let homeModule = HomeAssebmly().makeModule()
        let settingsModule = SettingsAssebmly().makeModule()
        let lottieModule = LottieAssebmly().makeModule()
        
        // SetCurrentUser to InputModule
        homeModule.moduleInput.setCurrentUser(currentUser: currentUser)
        settingsModule.moduleInput.setCurrentUser(currentUser: currentUser)
        lottieModule.moduleInput.setCurrentUser(currentUser: currentUser)
        
        // ViewControllers
        let homeVC = setupVC(vc: homeModule.viewController, title: "Главный", imageSystemName: "house", tag: HomeAssebmly.tabTag)
        let settingsVC = setupVC(vc: settingsModule.viewController, title: "Настройки", imageSystemName: "gearshape", tag: SettingsAssebmly.tabTag)
        let lottieVC = setupVC(vc: lottieModule.viewController, title: "Lottie", imageSystemName: "circle.dotted.and.circle", tag: LottieAssebmly.tabTag)
        
       
        // TabBarController
        let tabBarController = UITabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.viewControllers = [homeVC, settingsVC, lottieVC]
        tabBarController.tabBar.backgroundColor = .systemGray5
        tabBarController.tabBar.barTintColor = .systemGray5
        tabBarController.tabBar.tintColor = .black
        
        tabBarController.selectedIndex = selectedIndex
        
        return tabBarController
    }
    
    private func setupVC(vc: UIViewController, title: String, imageSystemName: String, tag: Int) -> UIViewController {
        
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageSystemName), tag: tag)
        
        vc.title = title
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .black

        vc.navigationItem.standardAppearance = navigationBarAppearance
        vc.navigationItem.compactAppearance = navigationBarAppearance
        vc.navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        return UINavigationController(rootViewController: vc)
    }
}
