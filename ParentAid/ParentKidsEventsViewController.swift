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
        //To make round corners of the image
               cell.eventPictureParentProvider.layer.cornerRadius = 10
               cell.eventPictureParentProvider.clipsToBounds = true

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
    //dismiss keyboard by clicking outside textbox
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            //animate tableViewProviderTopConstraint
        tableViewParentTopConstraint.constant = 0
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
            tableViewParent.isHidden = false
            // Show Cancel button when typing
            self.searchBarParent.showsCancelButton = true
        
    }
        // Logic for searchBar cancel button
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBarParent.showsCancelButton = false // remove cancel button
            searchBarParent.text = "" // reset search text
            searchBarParent.resignFirstResponder() // remove keyboard
            //filteredEvents = eventsArray // reset results to display
            tableViewParent.reloadData()
        }
        
        @objc func didCreateNewEvent(){
            let query = PFQuery(className: "KidsEvents")
            query.includeKeys(["provider.username", "synopsis" , "title", "date"])
            query.order(byDescending: "createdAt")
            query.limit = numberOfEvents
                    
            query.findObjectsInBackground{ (events, error) in
                if (events != nil){
                    self.events = events!
                    self.tableViewParent.reloadData()
                }
            }
        }
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
         //   Pass the selected object to the new view controller.
           print("########### Loading up the details from parent screen")
    
          //if true || false || true
           
           //Find the selected event
             if let cell = sender as? UITableViewCell  { // Sender is the cell that was tapped
               
               if let indexPath = tableViewParent.indexPath(for: cell){//Index of the cell was tapped
                   let event = events[indexPath.row] //event from selected cell
                  // let event = filteredEvents[indexPath.row] //event from selected cell
                   
    
                   //Pass the selected movie to the details view controller
                   //Variable "detailsViewController" is a destination where selected event is segue
                   if let detailsViewController = segue.destination as? RegisterParentViewController{
    
                       detailsViewController.event = event //this "event" is referring to the selected event from ProviderKidsEventsViewController
    
                   //Deselect event when transitioning (after tapping and coming back to main screen)
                       tableViewParent.deselectRow(at: indexPath, animated: true)}
               }
             
           }
               
           
       
    
       }
   }

    

