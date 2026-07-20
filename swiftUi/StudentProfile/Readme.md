# StudentProfile 📱

`StudentProfile` is a sample iOS application built using **SwiftUI** and powered by **Core Data**. It demonstrates how to create, read, update, and delete (CRUD) student profile records with persistent local storage, utilizing modern SwiftUI property wrappers like `@FetchRequest`.

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
