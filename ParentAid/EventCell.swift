//
//  EventCell.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import Parse

class EventCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var photoViewProvider: UIImageView!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    //  Add Event variable + didset
    var event: Event!{
        didSet{
            eventTitleLabel.text = event.title
            synopsisLabel.text = event.synopsis
            providerLabel.text = event.provider
            
            //set images
             photoViewProvider.af_setImage(withURL: event.image!)
            //To make round corners of the image
            photoViewProvider.layer.cornerRadius = 10
            photoViewProvider.clipsToBounds = true
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
           }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
