//
//  KidsEventCell.swift
//  ParentAid
//
//  Created by Tatiana on 11/8/20.
//

import UIKit

class KidsEventCell: UITableViewCell {

    @IBOutlet weak var descritionLabel: UILabel!
    @IBOutlet weak var usernameProviderLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
