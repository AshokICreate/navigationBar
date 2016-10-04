//
//  FoodViewController.swift
//  Library
//
//  Created by Ashok on 10/4/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    let pizzaSegueIdentifier = "pizzaViewController"
    let pasthaSegueIdentifier = "pasthaViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pizza and Pastha View"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        if segue.identifier  == pizzaSegueIdentifier {
            let vc = segue.destination as UIViewController
            vc.navigationItem.title = "Pizza View"
            navigationItem.title = "Pizza to FoodViewController"
        }
        if segue.identifier == pasthaSegueIdentifier {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
