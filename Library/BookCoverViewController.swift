//
//  ViewController.swift
//  Library
//
//  Created by Ashok on 10/3/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class BookCoverViewController: UIViewController {
    
    @IBOutlet var booksCoverView: UIImageView!
    
    
    var book: [String: String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fileName = book["Cover"] {
            booksCoverView.image = UIImage(named: fileName)
            booksCoverView.contentMode = .scaleAspectFit
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

