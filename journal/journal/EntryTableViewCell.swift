//
//  EntriesTableViewCell.swift
//  journal
//
//  Created by Cameron Dunn on 1/24/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var bodyTextLabel : UILabel!
    @IBOutlet weak var timeStampLabel : UILabel!
    
    var entry : Entry?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        titleLabel.text = entry?.title
        bodyTextLabel.text = entry?.bodyText
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy, HH:mm"
        let formattedDate = dateFormatter.string(from: todaysDate)
        timeStampLabel.text = formattedDate
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
