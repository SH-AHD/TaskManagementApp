# Taskati - Personal Task Manager
Taskati is a modern, minimalist task management application built with Flutter. It helps users organize their daily routines, track progress, and manage deadlines with a focus on clean UI/UX and robust software architecture.

### Features
Task Management: Create, edit, and delete daily tasks.

Time & Date Tracking: Assign specific deadlines and times to each task using a customized DatePicker and TimePicker.

Color-Coded Priority: Categorize tasks using different colors for better visual organization.

Status Management: Toggle between "To Do" and "Completed" states.

Persistent User Profile: Personalized experience with user name and profile picture stored locally.

Responsive Design: Optimized for various Android and iOS screen sizes.

Clean UI: Minimalist aesthetic following modern design principles.

### Architecture & Technical Stack
The project is developed following Clean Architecture principles and SOLID patterns to ensure scalability and maintainability.

Framework: Flutter

Local Database: Hive (For high-performance task storage)

Local Storage: shared_preferences (For user settings)

Icons & Assets: gap for spacing, custom SVG assets.

### Project Structure
```
lib/
├── core/               # App-wide constants, themes, and shared services
│   ├── constants/      # AppColors, AppAssets, etc.
│   ├── styles/         # TextStyles and Themes
│   └── services/       # Local storage helpers (SharedPref)
├── features/           # Feature-based modularization
│   ├── home/           # Task listing and user greeting
│   ├── add_task/       # Task creation logic and UI
│   └── profile/        # User profile settings
└── main.dart           # App entry point
```

### Getting Started
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
