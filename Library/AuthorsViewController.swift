//
//  AuthorsViewController.swift
//  Library
//
//  Created by Ashok on 10/3/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class AuthorsViewController: UITableViewController {
    
    let cellIdentifier = "Cell"
    let segueBooksViewController = "BooksViewController"
    
    var authors: [AnyObject] = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Authors"
        
        let filePath = Bundle.main.path(forResource: "Books", ofType: "plist")
        if let path = filePath {
            authors = NSArray(contentsOfFile: path) as! [AnyObject]
        }
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let author = authors[indexPath.row] as? [String: AnyObject]
        
        let name = author?["Author"] as? String
        
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueBooksViewController, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueBooksViewController {
            if let indexPath = tableView.indexPathForSelectedRow, let author = authors[indexPath.row] as? [String: AnyObject] {
                let destinationViewController = segue.destination as! BooksViewController
                destinationViewController.author = author
            }
        }
    }
}
