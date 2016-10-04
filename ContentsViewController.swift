//
//  ContentsViewController.swift
//  Library
//
//  Created by Ashok on 10/4/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class ContentsViewController: UITableViewController {
    
    let cellIdentifier: String = "contentsViewControllerCellIdentifier"
    let segueAuthorsViewController = "AuthorsViewController"
    let segueFoodViewController = "FoodViewController"
    
    var contents: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contents"
        
        let path = Bundle.main.path(forResource: "Contents", ofType: "plist")
        if let filePath = path {
            contents = NSArray(contentsOfFile: filePath) as! [String]
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let content = contents[indexPath.row]
        
        cell.textLabel?.text = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
                performSegue(withIdentifier: segueAuthorsViewController, sender: self)
        }
        if indexPath.row == 1 {
            performSegue(withIdentifier: segueFoodViewController, sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
}
