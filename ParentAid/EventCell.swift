//
//  EventCell.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var photoViewProvider: UIImageView!
    
    // Add Event variable + didset
    //var events = [PFObject]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
           }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
