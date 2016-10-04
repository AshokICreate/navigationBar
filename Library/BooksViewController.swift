//
//  BooksViewController.swift
//  Library
//
//  Created by Ashok on 10/4/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class BooksViewController: UITableViewController {
    
    let cellIdentifier = "Cell Identifier"
    let SegueBookCoverViewController = "BookCoverViewController"
    var author: [String: AnyObject]!
    
    var books: [AnyObject] {
        get {
            if let books = author["Books"] as? [AnyObject] {
                return books
            } else {
                return [AnyObject]()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = author["Author"] as? String {
            title = name
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let book = books[indexPath.row] as? [String: String], let title = book["Title"] {
            cell.textLabel?.text = title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueBookCoverViewController, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueBookCoverViewController {
            if let indexPath = tableView.indexPathForSelectedRow, let book = books[indexPath.row] as? [String: String]  {
                let destinationViewController = segue.destination as! BookCoverViewController
                destinationViewController.book = book
            }
        }
    }
}
