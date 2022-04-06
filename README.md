# Unit 10
## User Stories

The following **required** functionality is completed:

- [x] App launches to login page.
- [x] User can choose to sign-up/register.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/mlyom62.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

Unit 8: Group Milestone - README 
===

NATURE

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
Helps people meet new outdoor peers to explore new areas around. Whether it is for a hike, biking or surfing, the app can help find a group of people to adventure around.


### App Evaluation
- **Category:** Social Networking / Nature
- **Mobile:** This app would be primarily developed for mobile but could work as a website as well on a computer
- **Story:** Utilizes user's location to show relevant feed of others' adventures in the area and suggests groups that they could join.
- **Market:** Any individual could choose to use this app, and to keep it a safe environment, people would be organized into age groups.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how often they want to do outdoor activites. 
- **Scope:** First the user has to create a user profile. Then the user would be invited to join a groupchat based on the activity that they chose. The user can invite others to join and has the ability to leave as well.
 
 

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previous chats and preference settings
* User would have a feed 
* User picks what activity they would like to do 
* Groups made will have a chat window to get to know each other, with the ability to leave the group.
* Profile pages for each user
* Have a map to show activities in the area

**Optional Nice-to-have Stories**

* Allow the user to take a photo, tag it with a location, and then see a map with all the previously tagged photos. 
* User can share hiking activity on other social networks.
 * Settings (Accesibility, Notification, General, etc.)
 * User can login/register with google/facebook

### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person. 
* Messaging Screen - Chat for users to communicate (group chat)
   * Upon selecting activity choice users matched and message screen opens
* Profile Screen 
   * Allows user to upload a photo and fill in information that is interesting to them and others
* Hike/activity selection screen (Map).
   * Allows user to be able to choose their desired hike destination, and route.
* Matching screen
    * Users are matched with others that are also interested in the same activity.
* Nearby hike/activity feed.
   * Allows user to be able to choose their desired hike destination, and route.

#### BONUS
* Settings Screen
   * Lets people change language, and app notification settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Feed
* Map
* Profile


Optional:
* Settings


**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Groupchat Formation (Or Queue if Optional) -> Jumps to Chat
* Map -> Can see different activites in the area
* Profile -> Text field to be modified. 
* Settings -> Toggle settings

## Wireframes
![wireframe](https://user-images.githubusercontent.com/43360016/158896761-40b7d55f-7a9d-4c88-bfe3-a616bf74e557.jpg)

## Schema

### Data Models 
 Property | Type | Description
----------|----------|-----------
object id | String | unique id for the user post (default field)
  author  | Pointer to User | author of the picture
 picture  | File  | picture that the user post
 caption  | String | caption on the picture by the author
 info | String | description about the location by the author
 commentCount| number | number of comments on a picture
 likeCount  | number | number of likes on a picture
  message  | string | users can send messages in a groupchat
 
  

### Networking
#### List of parse network requests by screen
   - Register Screen
      - (Create/USER) Create a new user object
   - Login Screen
      - (Read/GETUSER) Find the user and password
        ```swift
         PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
         ```
   - Home Screen
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
   - Group Screen
      - (Read/GET) Query logged in group objects with messages
      - (Create/GROUP) Create a group message objects

#### [OPTIONAL:] Existing API Endpoints
##### An API Of Yelp for Map View and Activity Selection
- Base URL - [https://api.yelp.com/v3](https://api.yelp.com/v3)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /categories | get all the categories
    `GET`    | /name | return specific place by name
    `GET`    | /location   | get the address of the place
    `GET`    | /coordinate | get the coordinate to display on map
