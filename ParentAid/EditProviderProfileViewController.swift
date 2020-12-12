//
//  SavedProviderProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/20/20.
//

import UIKit
import Parse
import AlamofireImage

class EditProviderProfileViewController: UIViewController {
    var provider : PFObject!
    var providers = [PFObject]()
    
    @IBOutlet weak var providerNameLabel: UILabel!
    @IBOutlet weak var providerAddressLabel: UILabel!
    @IBOutlet weak var providerWebsiteLabel: UILabel!
    @IBOutlet weak var providerStateLabel: UILabel!
    @IBOutlet weak var providerCityLabel: UILabel!
    @IBOutlet weak var providerEmailLabel: UILabel!
    @IBOutlet weak var providerZipCodeLabel: UILabel!
    
    @IBOutlet weak var providerProfileImageView: UIImageView!
    @IBOutlet weak var providerPhoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queryProvider = PFQuery(className: "ProviderProfile")
        queryProvider.includeKeys(["provider.username", "providerName", "providerAddress", "providerCity", "providerState", "providerZipCode", "providerEmail", "providerWebsite", "providerPhone"])
        
        
        
        queryProvider.findObjectsInBackground{ (providers, error) in
            if (providers != nil){
                if let providers = providers{
                    for provider in providers {
                        //print(provider["providerName"] as! String)
                        self.providerNameLabel.text = provider["providerName"] as? String
                        self.providerNameLabel.sizeToFit()
                        
                        self.providerAddressLabel.text = provider["providerAddress"] as? String
                        self.providerAddressLabel.sizeToFit()
                        
                        self.providerCityLabel.text = provider["providerCity"] as? String
                        self.providerCityLabel.sizeToFit()
                        
                        self.providerStateLabel.text = provider["providerState"] as? String
                        self.providerStateLabel.sizeToFit()
                        
                        self.providerStateLabel.text = provider["providerZipCode"] as? String
                        self.providerStateLabel.sizeToFit()
                        
                        self.providerEmailLabel.text = provider["providerEmail"] as? String
                        self.providerEmailLabel.sizeToFit()
                        
                        self.providerWebsiteLabel.text = provider["providerWebsite"] as? String
                        self.providerWebsiteLabel.sizeToFit()
                        
                        self.providerPhoneLabel.text = provider["providerPhone"] as? String
                        self.providerPhoneLabel.sizeToFit()
                        
                        if let imageFile = provider["profilePhotoImageView"] as? PFFileObject{
                            let urlString = imageFile.url!
                            let url = URL(string: urlString)!
                            self.providerProfileImageView.af.setImage(withURL: url)
                            //To make round corners of the image
                            self.providerProfileImageView.layer.cornerRadius = 10
                            self.providerProfileImageView.clipsToBounds = true
                        }
                    }
                    
                }
            }
        }
        
    }
    
}

