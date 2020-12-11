//
//  HomeViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/8/20.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onParentButton(_ sender: Any) {
        //This is navigate to storyboard ID "providerView"
        let parentView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "parentView")
        DispatchQueue.main.async{
            //this is show Present modaly segue as full screen
            parentView.modalPresentationStyle = .fullScreen
            self.present(parentView, animated: true, completion: nil)
              }
        
    }
    
    
    @IBAction func onEventProviderButton(_ sender: Any) {
            //This is navigate to storyboard ID "providerView"
            let providerView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "providerView")
            DispatchQueue.main.async{
                //this is show Present modaly segue as full screen
                providerView.modalPresentationStyle = .fullScreen
                self.present(providerView, animated: true, completion: nil)
                  }
        
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
