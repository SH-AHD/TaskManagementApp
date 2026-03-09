 # Taskati - Personal Task Manager
Taskati is a modern, minimalist task management application built with Flutter. It helps users organize their daily routines, track progress, and manage deadlines with a focus on clean UI/UX and robust software architecture.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=flat&logo=dart&logoColor=white)
![Hive](https://img.shields.io/badge/Hive-Database-yellow)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## App Screenshots

#### Splash Screen
<p align="center">
  <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/splash.png" width="250" title="Splash Screen">
    <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/splashDark.png" width="250" title="Dark Splash Screen">
</p>

#### Complete Your Profile Screen
<p align="center">
  <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/completeYourProfile.png" width="250" title="Splash Screen">
</p>


#### Home Screen
<p align="center">
  <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/HomeWithTask.png" width="250" title="Home With Task Screen">
 <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/HomeWithTaskDark.png" width="250" title="Home With Task Dark Screen">
</p>

<details>
  <summary><h3><b>🔍 EXPLORE FULL GALLERY (Additional App Screens)</b></h3></summary>
  <br>
  <div style="overflow-x: auto;">
    <table>
      <tr>
        <td>  <img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/homeNoTasks.png" width="200" title="Home Screen"></td>
          <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/homeDoneTask.png" width="200" title="Home With Task Screen"></td>
        <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/homeDoneTaskDark.png"  width="200"></td>
               <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/slide.png" width="200"></td>
      </tr>
            <tr>
        <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/addTask.png" width="200"></td>
        <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/addTaskDark.png" width="200"></td>
        <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/date.png" width="200"></td>
       <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/time.png" width="200"></td>
      </tr>
            <tr>
        <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/editProfile.png" width="200"></td>
         <td><img src="https://github.com/SH-AHD/TaskManagementApp/raw/main/screenshots/profileVerification.png" width="200"></td>
      </tr>
    </table>
  </div>
</details>

## 📺 Demo Video
[Click here to watch the full demo](https://drive.google.com/file/d/1jHH2NFC7Sih22F-LQCPvqTFOewt4Y1-g/view?usp=drive_link)

## Features
Task Management: Create, edit, and delete daily tasks.

Time & Date Tracking: Assign specific deadlines and times to each task using a customized DatePicker and TimePicker.

Color-Coded Priority: Categorize tasks by color for better visual organization.

Status Management: Toggle between "To Do" and "Completed" states.

Persistent User Profile: Personalized experience with user name and profile picture stored locally.

Adaptive Theming: Seamlessly switch between Light and Dark modes.

Clean UI: Minimalist aesthetic following modern design principles.

## Architecture & Technical Stack
The app follows a feature-driven modular approach, separating Data, Domain, and Presentation layers for better testability.

Framework: Flutter

Local Database: Hive (For high-performance task storage)

Local Storage: shared_preferences (For user settings)

Icons & Assets: gap for spacing, custom SVG assets.

## 📁 Project Structure

```bash
lib/
├── core/                   # Shared assets, themes, and global logic
│   ├── constants/          # Static colors and image paths
│   ├── helpers/            # Extensions and utility functions
│   ├── models/             # Global data models (e.g., TaskModel)
│   ├── services/           # Storage & Database (Hive, SharedPref)
│   ├── styles/             # TextStyles and AppThemes
│   └── widgets/            # Reusable components (MainButton, CustomTextField)
├── features/               # Modular feature-based logic
│   ├── home/               # Greeting & Task listing
│   ├── add_edit_task/      # Logic for creating and updating tasks
│   └── complete_edit_profile/ # User profile and onboarding settings
└── main.dart               # App entry point
```

## Getting Started
Clone the repository:

```Bash
git clone https://github.com/SH-AHD/TaskManagementApp.git
```
Install dependencies:

```Bash
flutter pub get
```
Run the application:

```Bash
flutter run
```

##### Author
[Shahd Sameh](https://github.com/SH-AHD)
Computer Science Student @ Ain Shams University.
Flutter Developer & DEPI Trainee.
