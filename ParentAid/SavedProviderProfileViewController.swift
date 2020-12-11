//
//  SavedProviderProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/20/20.
//

import UIKit

class SavedProviderProfileViewController: UIViewController {
    
    @IBOutlet weak var providerPhoneField: UITextField!
    @IBOutlet weak var providerWebsiteField: UITextField!
    @IBOutlet weak var providerEmailField: UITextField!
    @IBOutlet weak var providerZipCodeField: UITextField!
    @IBOutlet weak var providerStateField: UITextField!
    @IBOutlet weak var providerCityField: UITextField!
    @IBOutlet weak var providerAddressField: UITextField!
    @IBOutlet weak var providerNameField: UITextField!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUserInfo()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onEditButton(_ sender: Any) {
    }
    
    
    private func showUserInfo(){
        
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
