//
//  EventDetailsViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/13/20.
//

import UIKit
import Parse
import AlamofireImage

class ProviderEventDetailsViewController: UIViewController {
    //store selected event
    var event : PFObject!
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var providerProfilePhoto: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var checkboxCOVIDsafe: UILabel!
    @IBOutlet weak var eventRegistrants: UILabel!
    @IBOutlet weak var availableSpots: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = event["provider"] as! PFUser
         providerName.text = user.username
      
        eventTitle.text = event["title"] as? String
        eventTitle.sizeToFit()
        
        synopsisLabel.text = event["synopsis"] as? String
        synopsisLabel.sizeToFit()
        
        eventDate.text = event["date"] as? String
        eventDate.sizeToFit()
        
        
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
