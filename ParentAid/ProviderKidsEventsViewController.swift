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
    
    var providerProfiles = [PFObject]()
    
   // var refreshControl: UIRefreshControl!
   var numberOfEvents: Int!
    
    //var selectedEvent: PFObject!
    
    //Struct
    struct Event: Codable, Equatable {
        //Establish properties
        var synopsis : String?
        var provider : String?
        var title : String?
        var date : String?
        var time : String?
//        var image : URL?
//        var url : URL?
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table View delegate
        tableViewProvider.delegate = self
        tableViewProvider.dataSource = self
        tableViewProvider.tableFooterView = UIView()
        
        //Search Bar delegate
        searchBarProvider.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(didCreateNewEvent), name: PostEventViewController.createEventNotification, object: nil)
    
        //To hide table view:
     //tableViewProvider.isHidden = true
      //  filteredEvents = eventsArray
       
        // Get Data from API
       // getAPIData()
        
        // Get Data from API
//        getEventsData()
//       
//        
//        let allEvents = Event(synopsis: "Event synopsis ", provider: "Event provider ", title: "Event title ", date: "Event date ", time: "Event time ")
//        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
//        print(allEvents)
       
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
    

//    @objc func getEventsData(){
//
//    let url = URL(string: "https://parse-dashboard.back4app.com/apps/dc82cc29-73ba-4d69-adc0-263de4c30df7/browser/KidsEvents")!
//    var urlRequest = URLRequest(url: url)
//    urlRequest.setValue("Jwxuau0jvzMCpZgdxbqkxhKdOCWhZvQb1vPnmrft", forHTTPHeaderField: "X-Parse-Application-Id") // This is the app's application id
//  //  urlRequest.setValue("0MPgfTQvTh1dTHET9bEUEqLKcCXk8o2Ce3lzHl4t", forHTTPHeaderField: "X-Parse-Master-Key") // This is the app's readonly master key
//    URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
//        let json = try! JSONSerialization.jsonObject(with: data!, options: []) // Here you have the data that you need
//        print(String(data: try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted), encoding: .utf8)!)
//    }).resume()
    
//        let url = URL(string: "https://parse-dashboard.back4app.com/apps/dc82cc29-73ba-4d69-adc0-263de4c30df7/browser/KidsEvents")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//           // This will run when the network request returns
//           if let error = error {
//              print("Failed to load: \(error.localizedDescription)")
//           } else if let data = data {
//            var dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
//            self.events = dataDictionary?["title"] as! [PFObject]
//            self.tableViewProvider.reloadData()
//
//              // TODO: Get the array of events
//              // TODO: Store the events in a property to use elsewhere
//              // TODO: Reload your table view data
//
//           }
//           }}
//        task.resume()
 // }
    
    @objc func getEventsAPIData(){
        let query = PFQuery(className: "KidsEvents")
        query.includeKeys(["provider.username", "synopsis" , "title", "date"])
        
        query.findObjectsInBackground{ (events, error) in
            if (events != nil){
                self.events = events!
               // self.eventsArray = events!
                //self.filteredEvents = events!
                                             
                self.tableViewProvider.reloadData()
            }
        }
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print(events)
    }
    
    
    
    @IBAction func onPostEventButton(_ sender: Any) {
        
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
//       var eventArray =  [[String:Any]]()
//        var eventTitle = String.self
       
        super.viewDidAppear(animated)
        numberOfEvents = 20
        self.tableViewProvider.reloadData()
        //Create query to retreive data
        
        let query = PFQuery(className: "KidsEvents")
        query.includeKeys(["provider.username", "synopsis" , "title", "date"])
      // query.whereKey("providerCity", contains: "San Jose")
     query.order(byDescending: "createdAt")

      //  query.order(byDescending: "date")

        
        //to read providerProfilePhoto
        let queryProvider = PFQuery(className:"ProviderProfile")
        queryProvider.includeKeys(["provider.username", "profilePhotoImageView"])
////        var query = PFQuery(className:"KidsEvents")
//       let event = PFObject(className: "KidsEvents")
//
//        query.whereKeyDoesNotExist("title"){
//
//        event.deleteInBackground()
//            print ("##################Event deleted")
//
//        }
        query.limit = numberOfEvents
                
        query.findObjectsInBackground{ (events, error) in
            if (events != nil){
                self.events = events!
               // self.eventsArray = events!
                //self.filteredEvents = events!
                                             
                self.tableViewProvider.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("55555555555555555555555")
       // print(events)
     
        //return filteredEvents.count
        return events.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProvider.dequeueReusableCell(withIdentifier: "EventCell", for:indexPath) as! EventCell
       // To display events in reversed order:
      //  let event = filteredEvents[indexPath.row]
       
      // let event = events.reversed()[indexPath.row] or equivalent:
    //   query.order(byDescending: "createdAt")
        let event = events[indexPath.row]
   //     let event = filteredData[indexPath.row]
        if let user = event["provider"] as? PFUser{
        cell.providerLabel.text = user.username
            cell.providerLabel.sizeToFit()
            
        }
        
        cell.eventTitleLabel.text = event["title"] as? String
        cell.eventTitleLabel.sizeToFit()
        
        cell.synopsisLabel.text = event["synopsis"] as? String
        cell.synopsisLabel.sizeToFit()
        cell.synopsisLabel.textAlignment = .left
        cell.synopsisLabel.textAlignment = .justified
        
        cell.eventDateLabel.text = event["date"] as? String
        //cell.eventDateLabel.sizeToFit()
        
              
        if let imageFile = event["image"] as? PFFileObject{
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoViewProvider.af.setImage(withURL: url)
        //To make round corners of the image
        cell.photoViewProvider.layer.cornerRadius = 10
        cell.photoViewProvider.clipsToBounds = true
        }
//      //  let providerUser = providerProfile["provider"] as! PFUser
//        let providerProfile = providerProfiles[indexPath.row]
//        if let imageProviderFile = providerProfile["profilePhotoImageView"] as? PFFileObject{
//        let urlProviderPhotoString = imageProviderFile.url!
//        let urlProviderPhoto = URL(string: urlProviderPhotoString)!
//            
//            
//    }
        //        let cell = UITableViewCell()
        //        cell.textLabel?.text = "This is Provider"
          return cell
    }
    
//    func checkInvalidEvents(){
//        let query = PFQuery(className: "KidsEvents")
//      //  query.includeKeys(["provider.username", "synopsis" , "title", "date"])
//      // query.whereKey("providerCity", contains: "San Jose")
//        query.findObjectsInBackground(){(events, error) in
//            if error == nil{
//                //There was no error in the fetch
//
//                if let returnedEvents = events{
//
//                    //events array is not nil
//                    //loop through the array to get each object
//                    for event in returnedEvents{
//                        print("#########################")
//                        print(event["title"] as? String)
//                    }
//
//                }
//            }
//
//        }
//         }
//
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
    
    @objc func didCreateNewEvent(){
        let query = PFQuery(className: "KidsEvents")
        query.includeKeys(["provider.username", "synopsis" , "title", "date"])
        query.order(byDescending: "createdAt")
        query.limit = numberOfEvents
                
        query.findObjectsInBackground{ (events, error) in
            if (events != nil){
                self.events = events!
                self.tableViewProvider.reloadData()
            }
        }
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
      //   Pass the selected object to the new view controller.
        print("########### Loading up the details screen")

       //if true || false || true
        
        //Find the selected event
          if let cell = sender as? UITableViewCell  { // Sender is the cell that was tapped
            
            if let indexPath = tableViewProvider.indexPath(for: cell){//Index of the cell was tapped
                let event = events[indexPath.row] //event from selected cell
               // let event = filteredEvents[indexPath.row] //event from selected cell
                

                //Pass the selected movie to the details view controller
                //Variable "detailsViewController" is a destination where selected event is segue
                if let detailsViewController = segue.destination as? ProviderEventDetailsViewController{

                    detailsViewController.event = event //this "event" is referring to the selected event from ProviderKidsEventsViewController

                //Deselect event when transitioning (after tapping and coming back to main screen)
                    tableViewProvider.deselectRow(at: indexPath, animated: true)}
            }
          
        }
            
        
    

    }
}


    

