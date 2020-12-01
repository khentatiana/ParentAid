//
//  ProviderViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import Parse
import AlamofireImage

//struct Event:Decodable{
//    let title:String
//    let date:String
//    
//}

class ProviderKidsEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
      
    //Outlets
    @IBOutlet weak var tableViewProvider: UITableView!
    @IBOutlet weak var tableViewProviderTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchBarProvider: UISearchBar!
    
    //Initiliazers
    var events = [PFObject]()
    var eventsArray = [PFObject]()
  //  var eventsArray : [Event] = []
    var filteredEvents = [PFObject]()
   // var filteredEvents : [Event] = []
    
   // var refreshControl: UIRefreshControl!
   var numberOfEvents: Int!
    
    //var selectedEvent: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table View delegate
        tableViewProvider.delegate = self
        tableViewProvider.dataSource = self
        //Search Bar delegate
        searchBarProvider.delegate = self
        //To hide table view:
      //  tableViewProvider.isHidden = true
        filteredEvents = eventsArray
       
        // Get Data from API
       // getAPIData()
              
       
    }
    
//    @objc func getAPIData() {
//        API.getEvents() { (events) in
//            guard let events = events else {
//                return
//            }
//            self.eventsArray = events
//            self.filteredEvents = events
//            self.tableViewProvider.reloadData()
//
//        }
//    }
//
    
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
//       var eventArray =  [[String:Any]]()
//        var eventTitle = String.self
        numberOfEvents = 10
        super.viewDidAppear(animated)
        let query = PFQuery(className: "KidsEvents")
        query.includeKeys(["provider", "synopsis" , "title", "date"])
      // query.whereKey("providerCity", contains: "San Jose")
        query.order(byDescending: "createdAt")
        query.limit = numberOfEvents
                
        query.findObjectsInBackground{ (events, error) in
            if (events != nil){
                self.events = events!
                self.eventsArray = events!
                self.filteredEvents = events!
                                             
                self.tableViewProvider.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return filteredEvents.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProvider.dequeueReusableCell(withIdentifier: "EventCell", for:indexPath) as! EventCell
       // To display events in reversed order:
        let event = filteredEvents[indexPath.row]
      //  let event = events.reversed()[indexPath.row]
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
    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation */
    
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
         //Pass the selected object to the new view controller.
        
        
    
    
    
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     // MARK: - Search Bar Config  */
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        //  var eventsArray : [Event] = []
//        var filteredData = []
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
//
//}
    // Search bar functionality
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        //reload all events to clear up previous search
//        filteredEvents = eventsArray
//        if searchText != "" {
//          
////            filteredEvents = eventsArray.filter {(event) -> Bool in
////                return event.title.lowercased().contains(searchText.lowercased())
//            }
//        }
//        else {
//            filteredEvents = eventsArray
//        }
//        tableViewProvider.reloadData()
//    }

    
    // Show Cancel button when typing and animate tableViewProviderTopConstraint
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //animate tableViewProviderTopConstraint
        tableViewProviderTopConstraint.constant = 0
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        tableViewProvider.isHidden = false
        // Show Cancel button when typing
        self.searchBarProvider.showsCancelButton = true
    
}
    // Logic for searchBar cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarProvider.showsCancelButton = false // remove cancel button
        searchBarProvider.text = "" // reset search text
        searchBarProvider.resignFirstResponder() // remove keyboard
        filteredEvents = eventsArray // reset results to display
        tableViewProvider.reloadData()
    }
    
}

