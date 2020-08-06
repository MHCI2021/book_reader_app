# Talk Wordy To Me

**A book reading app that auto-scrolls and syncs up text speed to match audio**

Project Overview(todo)
**Relavent Resources**

## Getting Started<br>
This site is written in Flutter, a cross-platform UI toolkit from google that uses the Dart programming language.

To get an introduction to Flutter, check out Google's Codelabs that enable you to learn the fundamentals online without downloading anything.
 - For a comparison between flutter and other platforms check out these articles:
      - [Introduction to Flutter for Web Developers](https://flutter.dev/docs/get-started/flutter-for/web-devs)
      - [Introduction to Flutter for React Native Developers](https://flutter.dev/docs/get-started/flutter-for/react-native-devs)
      - [Introduction to Flutter for IOS Developers](https://flutter.dev/docs/get-started/flutter-for/ios-devs)
      -[Introduction to Flutter for Android Developers](https://flutter.dev/docs/get-started/flutter-for/android-devs)
- To understand how flutter web works check out this [Web Support for Flutter](https://flutter.dev/web) article


**Required Software** <br/>
If you are interested in contributing, you'll need to download the following software
- [Flutter Web Install SDK](https://flutter.dev/docs/get-started/web)
      - [Windows Install Instructions](https://flutter.dev/docs/get-started/install/windows)    
      - [MacOS Install Instructions](https://flutter.dev/docs/get-started/install/macos)       
      - [Linux Install Instructions](https://flutter.dev/docs/get-started/install/linux)   
      - [ChromeOS Install Instructions](https://flutter.dev/docs/get-started/install/chromeos])
- [Chrome](https://www.google.com/chrome/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

## Flutter Environment Set Up <br/>
For this project, we only use Flutter Web, so to get that running on your computer, follow the instructions on [Flutter Web Install SDK](https://flutter.dev/docs/get-started/web). 

The first step is to download the Flutter SDK, no need to set up the Android or IOS development environments. Once you install the SDK, run the command:
```
flutter doctor
```
You should see something similar to what's shown below:

[todo]

Once Flutter is successfully installed, you will need to install [Chrome](https://www.google.com/chrome/)(if it's not already installed) so that you can run your code in the browser during development

Lastly, you will likely want to use Visual Studio Code as your code editor. Go to [Visual Studio Code](https://code.visualstudio.com/) to download the software. Then go to the "extensions" tab on the side and add the flutter extension and dart extension.

[picture below]


**Testing Flutter Install** <br/>
Before you try running this project, make sure flutter is working properly by creating a new project.
/*
Todo
*/

## Setting Project Up Locally <br/>

 - 

## Project Overview <br/>


**Project File Structure**<br>
- state/: Directory containing the majority of the logic of the site - 
        - AppState- the AppState class contains much of the core logic including initiating the database, handling forms, and dealing with user login
        - service_locator - I use a package called get_it that enables me to get a specific instance of a class from anywhere in the app. The service locator is where I initiate the classes that I want to be able to access. 
- mobile/ 
    - pages/: All of the website pages are stored in their respective folder. The ___page.dart folder contains the main page component then any page specific components will be in the components folder
- models/: Directory for the data models used in this app
- main.dart - the app is created in the main.dart file, it is the root of the entire project
- utils
    - theme.dart - In order to be able to change certian aspects of the design more easily, I've put most of the color and font size info into this file.
```
lib
├── main.dart
├── state
│   ├── service_locator.dart
│   └── app_state.dart
├── pages
│   ├── library
│   │    ├── book_tile.dart
│   │    ├── library_list_view.dart
│   │    └── library_scroll_view.dart
│   ├── reader_page
│   │    ├── reader_page.dart
│   │    └── components
│   │          ├── block_highlight_widget.dart
│   │          ├── text_scroll_widget.dart
│   │          └── top_menu_bar.dart
│   └── login
│        ├── splash_page.dart
│        └── login_page.dart
├── models
|   ├── books.dart        
│   ├── users.dart
│   └── models.dart
└── utils
    ├── center_about.dart
    ├── custom_expansion_tile.dart.dart
    ├── fonts.dart
    ├── theme.dart
    └── utils.dart
```



**Setting Up Project Locally**




**Dependencies**




