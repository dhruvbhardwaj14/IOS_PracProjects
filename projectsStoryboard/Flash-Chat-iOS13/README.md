# FlashChat iOS 13

An internet-based messaging app similar to WhatsApp, using Firebase Firestore for backend database management.

## Project Overview

- Firebase Firestore for cloud-based database storage and retrieval.
- Firebase Authentication for user registration and login.
- UITableView for displaying chat messages.
- Custom table view cells using .xib files.
- Navigation Controller for seamless screen transitions.
- Constants struct for managing reusable identifiers and brand colors.

## Features

- User authentication (Sign up, Login, Logout) with Firebase.
- Real-time messaging using Firestore database.
- Custom UI elements and animations.
- Segue-based navigation.
- Data persistence and organization.

## Technologies Used

- **Swift**
- **UIKit**
- **Firebase Firestore**
- **Firebase Authentication**
- **CocoaPods & Swift Package Manager**
- **Auto Layout & Storyboards**

## Constants

```swift
struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
```
## Authors

- [@dhruvbhardwaj14](https://github.com/dhruvbhardwaj14)

> This project is a part of The App Brewery's Complete App Development Bootcamp. Check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

