//
//  EntryDetailViewController.swift
//  journal
//
//  Created by Cameron Dunn on 1/24/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    var entry: Entry?
    var entryController : EntryController?
    
    
    @IBAction func save_Tapped(_ sender: UIBarButtonItem) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
