## Overview

For this project, I developed an application using Swift, consisting of three screens, implementing all the required functionalities while fetching and displaying data from an API. To make the project look more completed I have enriched it with some extra functionalities in order to have a better user experience and interaction.


## Features

- **Splash Screen:** Launching screen with app logo
- **Home Screen:** Main screen of the app displaying data fetched from given API Link (https://mocki.io/v1/6c823976-465e-401e-ae8d-d657d278e98e).
There is a scrollable list with expandable items, displaying sections of the page.
- **Search Functionality:** Users can search for a specific "section" on the list. Every typed character filters the list. If there is no data an empty view will be shown. 
- **All Pages:** Displays all items categorized as "pages", improving data visualization and user interaction.
- **Details Screen:** Shows the final element in the data hierarchy, including the image, title, and body paragraph (if available), ensuring a comprehensive view of the content. If user interacts with image then an image viewer is opened to enlarge the image.


## Technology Used

- **Figma:** I have used this tool for creating UI, in order to have a view of what app will look like before starting the implementation.
- **Swift:** The programming language used for app development. I have created it as a new screen in order to show how navigation is handled in MVVM-C and also if it is needed to put any logic in the future.
- **UIKit:** Frameworks used for creating user interfaces of the app.
- **Alamofire:** Library used for handling HTTP requests.
- **Lottie**: Used for animations, specifically for the loading indicator in this project.
- **Kingfisher:** Library used for displaying images from API in a simple way by just parsing image URL.

## UI/UX - Figma

The app’s UI/UX design was created by me using Figma. The layout is clean and intuitive, with a focus on usability and aesthetics. Below there is a screenshot showing the design.

<img width="1233" alt="Screenshot 2025-04-02 at 22 33 45" src="https://github.com/user-attachments/assets/00584364-1626-4be0-897b-61657c3f6ef0" />

## Github Flow

- **Main Branch:** The production-ready branch that always contains stable code.
- **Development Branch:** A more stable branch where ongoing development occurs and new features are integrated.
- **Feature Branches:** Branches created from the development branch for specific features:

- `feature/setup-project`: Setup project and architecture.
- `feature/home-screen-UI`: UI implementation for the main screen.
- `feature/all-pages-screen-UI`: UI implementations which shows all filtered pages from the main screen.
- `feature/details-screen-UI`: UI implementation section details, containing cover image and other relevant data.
- `feature/implement-network-layer`: Setup network layer using Alamofire for fetching data from API.
- `feature/implement-autocomplete-search`: Implementation of autocomplete search in main screen of the app to filter sections list.

## Architecture

Design pattern used in this project is MVVM-C. It is a combination of the Model-View-ViewModel architecture, plus the Coordinator pattern.

- **Model:** Dumb representation of the data. It must be as plain as possible without business logic.
- **View:** Represents the user interface elements of an application.
- **ViewModel:** It has the responsibility to keep the View and Model updated. Business logic is inside this class.
- **Coordinator**: Is responsible for handling the navigation and relationships between ViewController’s.


## Future Improvements

Since there is a list of data, it is preferable to implement pagination in order to have better performance especially when we have a large ammount of data.

## App Installation

Before running the project, ensure you have the following installed:  
- **macOS** with the latest updates  
- **Xcode** (latest stable version)  
- **CocoaPods** (if dependencies are managed with it)  

### 1️⃣ Clone the Repository  

git clone <repository-url>

### 2️⃣ Install Dependencies

pod install

### 3️⃣ Run the App

Click the Run button in Xcode or use: CMD + R

## Time Spent

Time spent for this assignment is approximately 12 hours, 10 hours development and 2 hours improvements and preparing the documentation.

## Final implementation

https://github.com/user-attachments/assets/5b5402e3-014a-40ab-8836-906dddefbd3f




