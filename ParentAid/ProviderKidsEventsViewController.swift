//
//  ProviderViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import Parse
import AlamofireImage

class ProviderKidsEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var events = [PFObject]()
    //var filteredData = event["title"] as? String
    
    
    @IBOutlet weak var tableViewProvider: UITableView!
    
    
    @IBOutlet weak var searchBarProvider: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProvider.delegate = self
        tableViewProvider.dataSource = self
        searchBarProvider.delegate = self
      //  filteredData = events
        
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
      // query.whereKey("providerCity", contains: "San Jose")
        query.order(byDescending: "createdAt")
                
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
       // To display events in reversed order:
        let event = events.reversed()[indexPath.row]
      //  or equivalent:
    //   query.order(byDescending: "createdAt")
        
   //     let event = filteredData[indexPath.row]
        let user = event["provider"] as! PFUser
        cell.providerLabel.text = user.username
        cell.providerLabel.sizeToFit()
        cell.eventTitleLabel.text = event["title"] as? String
        cell.eventTitleLabel.sizeToFit()
        
        cell.synopsisLabel.text = event["synopsis"] as? String
        cell.synopsisLabel.sizeToFit()
        cell.synopsisLabel.textAlignment = .left
        cell.synopsisLabel.textAlignment = .justified
        
        let imageFile = event["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoViewProvider.af_setImage(withURL: url)
        //To make round corners of the image
        cell.photoViewProvider.layer.cornerRadius = 10
        cell.photoViewProvider.clipsToBounds = true
        
        
        //        let cell = UITableViewCell()
        //        cell.textLabel?.text = "This is Provider"
        
        return cell
    }
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     // MARK: - Search Bar Config  */
     
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        filteredData = []
//        if searchText == ""{
//            filteredData = eventTitleLabel.text
//        }
//        else {
//
//        for searchedEvent in events{
//            if searchedEvent{
//                filteredData.append(searchedEvent)
//            }
//        }}
//        
//        self.tableViewProvider.reloadData()
//    }
}
