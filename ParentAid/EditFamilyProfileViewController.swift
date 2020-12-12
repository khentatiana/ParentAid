//
//  EditFamilyProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 12/12/20.
//

import UIKit
import Parse
import AlamofireImage

class EditFamilyProfileViewController: UIViewController {
    var parentProfile : PFObject!
    var parents = [PFObject]()
    
    @IBOutlet weak var parentFirstNameLabel: UILabel!
    @IBOutlet weak var parentLastNameLabel: UILabel!
    @IBOutlet weak var parentEmailLabel: UILabel!
    @IBOutlet weak var parentZipCodeLabel: UILabel!
    @IBOutlet weak var numberOfKidsLabel: UILabel!
    @IBOutlet weak var childOneAgeLabel: UILabel!
    @IBOutlet weak var childTwoAgeLabel: UILabel!
    @IBOutlet weak var childThreeAgeLabel: UILabel!
    @IBOutlet weak var childFourAgeLabel: UILabel!
    @IBOutlet weak var childSixAgeLabel: UILabel!
    @IBOutlet weak var childFiveAgeLabel: UILabel!
    
    @IBOutlet weak var familyImageView: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let queryParent = PFQuery(className: "ParentProfile")
        queryParent.includeKeys(["provider.username", "parentFirstName", "parentLastName", "parentEmail", "parentZipCode", "numberOfKids", "ageOfChildOne", "ageOfChildTwo", "ageOfChildThree", "ageOfChildFour", "ageOfChildFive", "ageOfChildSix"])
            
            
            
        queryParent.findObjectsInBackground{ (parents, error) in
                if (parents != nil){
                    if let parents = parents{
                        for parent in parents {
                            //print(provider["providerName"] as! String)
                            self.parentFirstNameLabel.text = parent["parentFirstName"] as? String
                            self.parentFirstNameLabel.sizeToFit()
                            
                            self.parentLastNameLabel.text = parent["parentLastName"] as? String
                            self.parentLastNameLabel.sizeToFit()
                            
                            self.parentEmailLabel.text = parent["parentEmail"] as? String
                            self.parentEmailLabel.sizeToFit()
                            
                            self.parentZipCodeLabel.text = parent["parentZipCode"] as? String
                            self.parentZipCodeLabel.sizeToFit()
                            
                            self.numberOfKidsLabel.text = parent["numberOfKids"] as? String
                            self.numberOfKidsLabel.sizeToFit()
                            
                            self.childOneAgeLabel.text = parent["ageOfChildOne"] as? String
                            self.childOneAgeLabel.sizeToFit()
                            
                            self.childTwoAgeLabel.text = parent["ageOfChildTwo"] as? String
                            self.childTwoAgeLabel.sizeToFit()
                            
                            self.childThreeAgeLabel.text = parent["ageOfChildThree"] as? String
                            self.childThreeAgeLabel.sizeToFit()
                            
                            self.childFourAgeLabel.text = parent["ageOfChildFour"] as? String
                            self.childFourAgeLabel.sizeToFit()
                            
                            self.childFiveAgeLabel.text = parent["ageOfChildFive"] as? String
                            self.childFiveAgeLabel.sizeToFit()
                            
                            self.childSixAgeLabel.text = parent["ageOfChildSix"] as? String
                            self.childSixAgeLabel.sizeToFit()
                              
                            
                            if let imageFile = parent["familyProfileImageView"] as? PFFileObject{
                                let urlString = imageFile.url!
                                let url = URL(string: urlString)!
                                self.familyImageView.af.setImage(withURL: url)
                                //To make round corners of the image
                                self.familyImageView.layer.cornerRadius = 10
                                self.familyImageView.clipsToBounds = true
                            }
                        }
                        
                    }
                }
            }
            
        }
        
    }

    
