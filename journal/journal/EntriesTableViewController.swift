//
//  EntriesTableViewController.swift
//  journal
//
//  Created by Cameron Dunn on 1/24/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {

    
    let entryController = EntryController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EntryTableViewCell
        cell.entry = entryController.entries[indexPath.row]
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        entryController.fetchEntries { (error) in
            if let error = error{
                print("An error occured \(error)")
            }else{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    

}
