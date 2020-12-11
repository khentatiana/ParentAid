//
//  KidsEventsViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/8/20.
//

import UIKit
import Parse
import AlamofireImage

class ParentKidsEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableViewParent: UITableView!
    @IBOutlet weak var tableViewParentTopConstraint: NSLayoutConstraint!
 
  @IBOutlet weak var searchBarParent: UISearchBar!
    
    
    
    
    //MARK: Variables
    var events = [PFObject]()
    var numberOfEvents: Int!

    
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table View delegate
        tableViewParent.delegate = self
        tableViewParent.dataSource = self
        tableViewParent.tableFooterView = UIView()
        //Search Bar delegate
      searchBarParent.delegate = self
        
    //    NotificationCenter.default.addObserver(self, selector: #selector(didCreateNewEvent), name: RegisterParentViewController.createEventNotification, object: nil)

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        numberOfEvents = 20
        self.tableViewParent.reloadData()
        
        //Create query to READ data

        let query = PFQuery(className: "KidsEvents")
        query.includeKeys(["provider.username", "synopsis" , "title", "date"])
        // query.whereKey("providerCity", contains: "San Jose")
        query.order(byDescending: "createdAt")

        query.limit = numberOfEvents
        
        query.findObjectsInBackground{(events, error) in
            if (events != nil){
                self.events = events!
                self.tableViewParent.reloadData()
            }
        }
     
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return events.count
        //return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewParent.dequeueReusableCell(withIdentifier: "ParentEventCell") as! ParentEventCell
        let event = events[indexPath.row]
        let user = event["provider"] as! PFUser
        cell.providerNameParentLabel.text = user.username
        cell.providerNameParentLabel.sizeToFit()

        cell.synopsisParentLabel.text = event["synopsis"] as! String
        cell.synopsisParentLabel.sizeToFit()
        cell.synopsisParentLabel.textAlignment = .left
        cell.synopsisParentLabel.textAlignment = .justified
               
     cell.eventParentDateLabel.text = event["date"] as? String
               //cell.eventDateLabel.sizeToFit()

        
        
        let imageFile = event["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.eventPictureParentProvider.af_setImage(withURL: url)

//        let cell = UITableViewCell()
//        cell.textLabel?.text = "row: \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    @IBAction func onParentLogoutBtn(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate
        else {return}
        delegate.window?.rootViewController = loginViewController
    }
    
    
}
