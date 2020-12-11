//
//  ParentEventCell.swift
//  ParentAid
//
//  Created by Tatiana on 12/11/20.
//

import UIKit

class ParentEventCell: UITableViewCell {
    
    @IBOutlet weak var eventPictureParentProvider: UIImageView!
    @IBOutlet weak var eventTitleParentLabel: UILabel!
    @IBOutlet weak var eventParentDateLabel: UILabel!
    @IBOutlet weak var synopsisParentLabel: UILabel!
    @IBOutlet weak var providerNameParentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
