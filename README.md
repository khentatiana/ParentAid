# ParentAid

**Created by:** [Tatiana Khen](https://github.com/khentatiana) & [Hamida Khatri](https://github.com/hamidakhatri/)

**Mentor:** [Carlos Alban](https://github.com/carlosalban)

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
ParentAid is an app that helps parents to find and sign-up for COVID-19 safe activities for kids and events based on their locations around the world. The app allows event providers to advertise the events and to  interact with people for their chosen events.

### App Evaluation
- **Category:** Social Networking
- **Mobile:** This app will be primarily developed for mobile but it can be scaled as a web app. This app is essential for the instant signing up of a child for the activity or event. Providers will use the app to post the information about the activity or event. The camera is used to add event posters, tag them with a location, and then see a map with all the posted events.
- **Story:** We as parents always have been struggling to find activities for kids. Searching, planning, and scheduling takes a tremendous amount of time and effort. As busy parents we were always dreaming about the app that will help with kids activities. Due to the current pandemic of COVID-19, many families all around the world are trying to find activities to keep children get busy and be safe. Now sporting events, festivals, and schools remain closed. 
ParentAid app can help parents cope. It helps parents to find and sign-up kids for different activities nearby and to make sure that they are COVID-19 safe. It helps event providers to advertise and manage all in-person and virtual events. When the pandemic is over, this app will still be a good helper for the parents and happy busy kids.
- **Habit:** Parents are using this constantly throughout the year on a daily basis and around the world to find and sign-up their kids for the activities and events. Event providers are using the app to post information about the coming event and activities offered.
- **Scope:** The future of ParentAid is to scale to add subscription plans for providers to advertise their events and activities starting off with the Basic Plan to post 10 events per year for free but as the tier moves up to Gold or Platinum, the post events will increase upto 20-50 per year with the required feature to include fee for any and all events.
- **Market:** Parents, kids, and event providers could utilize this app.


## Product Spec

### 1. User Stories 

#### Required Must-have Stories

* User is able to sign up
    * Email (required field)
    * Password (required field)
* User is able to log in
    * Email (required field)
    * Password (required field)
* User is able to identify as a Parent or Provider
    * Do you identify as a Parent or Provider?
* User is able to access their profile
    * Parent 
        * First name (required field)
        * Last name (required field)
        * City / Zip code (required field)
        * Number of children (optional field)
        * Age group of children (optional field)
    * Provider
        * First name (required field)
        * Last name (required field)
        * Organization name (required field)
        * Designation (required field)
        * Address, City, State, Zip Code (required field)
        * Phone (required field)
        * Website (optional field)
        * Scope of work (optional field)
* User is able to access the Kids Events
    * Event title
    * Event poster
    * Event description
    * Date 
    * Time 
* User is able to switch between a Parent or Provider
    * Switch (bar button)
* User is able to switch from Parent to Provider or Provider to Parent
    * Parent Profile
        * User is able to search for an event using the Search Bar
        * User is able to view the summary of results (refined version of the Kids Events)
            * Event title
            * Event poster
            * Event description
            * Date 
            * Time 
        * User is able to select an event from the summary of results (refined version of the Kids Events)
            * Select by clicking item from the list and see detail screen of that event
            * User can initially scroll through the event feed
            * User is able to click on the poster and see the location of the event on the map
        * User is able to view the selected event of choice 
            * Small poster
            * Large poster in the background
            * Event details
            * COVID-19 Safe check box
            * Available spots 
            * Select / Register (button)
        * User is able to receive a confirmation for the selected event of choice
            * Congratulations! You are registered for the event.
    * Provider Profile
        * User is able to add/register an event to Kids Events
            * Event title (required field)
            * Event description (required field)
            * Date (required field)
            * Time (required field)
            * Address (required field)
            * City (required field)
            * State (drop down) (required field)
            * Zip Code (required field)
            * Available spots (drop down) (required field)
            * COVID-19 safe checkbox (required field)
        * User is able to preview the added event before publishing on Kids Events 
            * Preview (button)
        * User is able to view the registration confirmation of the added event on Kids Events
            * Congratulations! Your event has successfully been registered.
        * User is able to view the added event on Kids Events

#### Optional Nice-to-have Stories

* User is able to regain access by clicking on 'Forgot password' at login screen
* A generated 'List of upcoming events' in Provider profile is visible 
* A generated 'List of expired events' in Provider profile is visible
* A generated 'List of registered events' in Parent profile is visible 
* A generated 'List of attended events' in Parent profile is visible
* Parent is able to select and conduct advanced search for an event
* When the Parent is registered for an event, 'Available Spots' countdown is decreased by 1 
* Parent cannot register when no more spaces are available 
* Email confirmation (summary) sent to the Parent after registering for an event
* Email confirmation (summary) sent to the Provider after adding an event to Kids Events
* Provider is able to edit the event on Kids Events with Edit button
* Provider is able to delete the event on Kids Events with Cancel button

### 2. Screen Archetypes

* Log In / Sign Up
   * Parent/Provider logs in using Log In or Sign Up
* Parent / Provider Identification
   * Upon logging in, the user is prompted to identify as a Parent or Provider
* Parent Profile
    * User is able to upload their profile picture
    * User is able to view their profile
    * User is able to update their information
* Provider Profile
    * User is able to upload their profile picture
    * User is able to view their profile
    * User is able to update their information
* Kids Events
    * Parent
        * User is able to search for an event using the Search Bar
        * User is able to do advanced search using the dropdown option on the Search Bar which will lead to input fields to submit
        * User is able to view an event
        * User is able to register for an event
        * User is able to see the location of the event on map
        * User gets a confirmation for registering an event
    * Provider
        * User is able to add an event using the Add Event tab button
        * User is able to search for an event using the Search Bar
        * User is able to do advanced search using the dropdown option on the Search Bar which will lead to input fields to submit
        * User is able to select an event poster
        * User is able to fill information (required and optional) for the event to be added
        * User is able to preview the event before publishing using the Preview button
        * User is able to edit the event using the Edit button
        * User is able to delete the event using the Cancel button
        * User gets a confirmation for adding an event

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home screen
* Switch between Parent user and Provider user
* Kids Events Feed
* User Profile (Parent / Provider)
* Post an Event
* Register for an Event
* Logout 

**Flow Navigation** (Screen to Screen)

#### Required
* Forced Log In or Sign Up
* Login Screen
=> Home Screen (Parent or Provider portal selection)
* Home Screen
=> Kids Events Screen for Parent or Provider
* Parent's Kids Events Screen
=> Event Detail & Registration Screen
* Registration Screen
=> Confirmation Screen
* Parent's Kids Events Screen
=> Map Screen
* Parent's Kids Events Screen
=> Parent Profile Screen
* Provider's Kids Events Screen
=> Post an event Screen
* Post an event Screen
=> Camera Screen
* Post an event Details Screen
=> Preview Post Screen
* Preview Post Screen
=> Confirmation Screen
* Provider's Kids Events Screen
=> Provider Profile Screen

#### Optional

* Login Screen
=> Forgot Password Screen
* Provider's Posted Kids Events Screen
=> Provider Edit and Delete Event Screen
* Parent's Kids Events Screen
=> Advanced Search Screen

## Wireframes

### Low-fidelity (initial sketch) 
<img src="https://imgur.com/6h2qFmy.png" width=1000><br>

### High-fidelity (final sketch) 
<img src="https://i.imgur.com/ZqdWHt4.png" width=1000><br>

### [BONUS] Digital Wireframes & Mockups

#### Link to Wireframe
https://xd.adobe.com/view/1b06c1ef-23c8-499f-aa3c-b77b1b1570b2-4e55/

### Parent
<img src = "https://imgur.com/bp8PyRz.png" width=1000>

### Provider
<img src = "https://imgur.com/muj07b1.png" width=1000>

### [BONUS] Interactive Prototype

### Parent
<img src='http://g.recordit.co/XRpEzzcTVZ.gif' width=''/>

### Provider

<img src='http://g.recordit.co/3VvGdl7WDR.gif' width=''/>

## Schema 
### Models
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user (default field) |
   | username      | String   | username |
   | password      | String   | password |
   | email         | String   | email |
   | username      | Pointer to Provider| image provider |
   | username      | Pointer to Provider| image provider |
   | image         | File     | image that user posts for the event |
   | title         | String   | title of the event |
   | date          | Date     | date of the event |
   | time.         | Time     | time of the event |
   | synopsis      | String   | synopsis of the event |
   | address       | String   | address of the event |
   | city          | String   | city of the event |
   | state         | String   | state of the event |
   | zip code      | Integer  | Zip code of the event |
   | available_spots| Integer | Available spots code of the event |
   | COVID-19 Safe | Boolean  | Yes or No |
   | createdAt     | DateTime | date when event is created (default field) |
   | updatedAt     | DateTime | date when event is last updated (default field) |
   
   #### KidsEvents

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user event (default field) |
   | provider      | Pointer to Provider| provider of the event |
   | image         | File     | image that user posts for the event |
   | title         | String   | title of the event |
   | date          | Date     | date of the event |
   | time.         | Time     | time of the event |
   | synopsis      | String   | synopsis of the event |
   | address       | String   | address of the event |
   | city          | String   | city of the event |
   | state         | String   | state of the event |
   | zip code      | Integer  | Zip code of the event |
   | available_spots| Integer | Available spots code of the event |
   | COVID-19 Safe | Boolean  | Yes or No |
   | createdAt     | DateTime | date when event is created (default field) |
   | updatedAt     | DateTime | date when event is last updated (default field) |
### Networking

#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Game of Thrones API
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /cities | gets all cities
    `GET`    | /cities/byId/:id | gets specific city by :id
    `GET`    | /continents | gets all continents
    `GET`    | /continents/byId/:id | gets specific continent by :id
    `GET`    | /regions | gets all regions
    `GET`    | /regions/byId/:id | gets specific region by :id
    `GET`    | /characters/paths/:name | gets a character's path with a given name

