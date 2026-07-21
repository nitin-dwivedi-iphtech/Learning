# StudentProfile 📱

`StudentProfile` is a sample iOS application built using **SwiftUI** and powered by **Core Data**. It demonstrates how to create, read, update, and delete (CRUD) student profile records with persistent local storage, utilizing modern SwiftUI property wrappers like `@FetchRequest`.

---

## 🎬 App Walkthrough & Demo

[![Watch Demo Video](https://img.shields.io/badge/▶️_Watch_App_Demo-Google_Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/file/d/1q2WxGLAS39mHi3i6Td2Bj6NaKvoMIXjr/view?usp=sharing)

*Click the badge above or the preview below to watch the full screen recording.*

<div align="center">
  <a href="https://drive.google.com/file/d/1q2WxGLAS39mHi3i6Td2Bj6NaKvoMIXjr/view?usp=sharing" target="_blank">
    <img src="https://raw.githubusercontent.com/github/explore/main/topics/swiftui/swiftui.png" width="120" alt="Student Profile App Demo" />
    <br/>
    <sub><b>📱 Click here to play full iOS Simulator video on Google Drive</b></sub>
  </a>
</div>

---

## 🚀 Features

- **Core Data Persistence**: Securely saves, updates, and deletes student records locally on the device.
- **Dynamic Fetching**: Uses `@FetchRequest` to instantly reflect database updates directly into the SwiftUI user interface.
- **Modern SwiftUI UI**: Built entirely with declarative views, standard layouts (`VStack`, `HStack`, `Form`), and native input pickers.
- **Data Input Forms**: Easy-to-use input controls for managing student names, profile info, and custom categories.

---

## 🛠️ Tech Stack

- **Language**: Swift
- **Framework**: SwiftUI
- **Database**: Core Data (`.xcdatamodeld`)
- **IDE**: Xcode
- **Platform**: iOS 15.0+

---

## 📂 Project Structure

```text
StudentProfile/
│
├── Model/      # StudentProfile.xcdatamodeld (Core Data Schema)
├── Contoller/    # PersistenceController.swift (Core Data Stack Initialization)
├── View/           # SwiftUI Layouts (Form inputs, Profile Lists, Detail Cards)
└── Resources/      # Assets, local images, and configuration files
