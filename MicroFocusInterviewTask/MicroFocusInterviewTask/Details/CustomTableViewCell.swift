//
//  CustomTableViewCell.swift
//  MicroFocusInterviewTask
//
//  Created by Pavithra on 15/02/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labMessage: UILabel!
    @IBOutlet weak var labAge: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
