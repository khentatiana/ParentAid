//
//  ProviderViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import Parse
import AlamofireImage

class ProviderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events = [PFObject]()
    
    
    @IBOutlet weak var tableViewProvider: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProvider.delegate = self
        tableViewProvider.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate
        else {return}
        delegate.window?.rootViewController = loginViewController
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "KidsEvents")
        query.includeKey("provider")
        //This will put limit on number of posts to display to 20. If no limit then skip this line
        // query.limit = 20
        
        query.findObjectsInBackground{(events, error) in
            if (events != nil){
                self.events = events!
                self.tableViewProvider.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProvider.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let event = events.reversed()[indexPath.row]
        let user = event["provider"] as! PFUser
        cell.providerLabel.text = user.username
        cell.providerLabel.sizeToFit()
        cell.eventTitleLabel.text = event["title"] as? String
        cell.eventTitleLabel.sizeToFit()
        
        cell.synopsisLabel.text = event["synopsis"] as? String
        cell.synopsisLabel.sizeToFit()           //cell.synopsisLabel.textAlignment = .justified
        
        let imageFile = event["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoViewProvider.af_setImage(withURL: url)
        
        
        //        let cell = UITableViewCell()
        //        cell.textLabel?.text = "This is Provider"
        
        return cell
    }
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
