//
//  EventDetailsViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/13/20.
//

import UIKit
import Parse

class ProviderEventDetailsViewController: UIViewController {
    //store selected event
    var event : PFObject!

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var providerProfilePhoto: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var providerName: UILabel!
    
    
    
    
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
