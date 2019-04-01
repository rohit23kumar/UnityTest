//
//  TabBarController.swift
//  IPLBuzz
//
//  Created by Candidate on 01/04/19.
//  Copyright © 2019 Candidate. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let item1 = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
        item1.tabBarItem = UITabBarItem(title: "Sunrisers", image: nil, selectedImage: nil)
        self.viewControllers?.append(item1)
        self.selectedIndex = 1
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let obj = self.viewControllers![selectedIndex] as! FirstViewController
        obj.refreshPage()
        
    }
    
    
    
    
}
