Australian Cities App
This is an iOS app built using SwiftUI that displays a list of cities in Australia, grouped by state. The app supports dark mode and includes a button to reverse the order of the list.

Features
  Collapsible Sections: Cities are grouped by state, with each state section being collapsible.
  Reverse Order: A button allows users to reverse the order of the cities list.
  Dark Mode Support: The app adapts to the system's appearance settings (light and dark mode).
  Navigation Bar: The list of cities is displayed inside a navigation view with an easily accessible button.

Screenshots:
![Simulator Screenshot - iPhone 15 Pro Max - 2025-02-07 at 13 35 53](https://github.com/user-attachments/assets/e9bc900f-b69c-4002-ab48-61a210891797)
![Simulator Screenshot - iPhone 15 Pro Max - 2025-02-07 at 13 35 36](https://github.com/user-attachments/assets/0ad9a3ce-f9af-47de-b123-821cfbe92a35)
![Simulator Screenshot - iPhone 15 Pro Max - 2025-02-07 at 13 36 24](https://github.com/user-attachments/assets/cd300a48-e93f-472e-a67f-054a415e7916)
![Simulator Screenshot - iPhone 15 Pro Max - 2025-02-07 at 13 36 29](https://github.com/user-attachments/assets/3df77ca9-07ff-41fe-b8ca-f7c299402c8d)

Requirements:
  Xcode 12.0 or higher
  iOS 14.0+

https://github.com/user-attachments/assets/523960d2-9ddd-462c-8379-d2e9a491d600


  Swift 5.0+

Installation:
  Clone the repository to your local machine:
    Copy
    git clone https://github.com/shunmuga06/iOS-Task-Shunmugaraj-
  
  Open the project in Xcode:
    Copy
    open ShunmugarajTask.xcodeproj
  Build and run the app on the simulator or a physical device.

How to Use
  Launch the app on a device or simulator.
  The cities will be displayed, grouped by state in collapsible sections.
  Tap the "Reverse Order" button at the top to reverse the order of the list.
  The app will automatically switch between light and dark mode based on your system settings.

Code Overview
  Model: The app uses State and City structs to represent each state and its cities.
  View: The ContentView displays a List of states, each with a collapsible section of cities.
  State Management: The @State property wrapper is used to manage the state of the list and handle changes when the reverse button is pressed.

Future Enhancements
  Add more states and cities to the data model.
  Allow users to search for a specific city or state.
  Implement additional filters for cities (e.g., by population or area).
