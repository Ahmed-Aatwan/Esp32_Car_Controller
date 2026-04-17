# 🚗 ADAS Mobile Application (Flutter + ESP32)

## 📌 Overview

The ADAS (Advanced Driver Assistance System) Mobile App is a Flutter-based application designed to control and monitor a smart car using Bluetooth communication with an ESP32 module. The app provides both manual and automatic control modes, along with real-time data feedback such as speed, distance, and connection status.

---

## ✨ Key Features

### 🔹 1. Bluetooth Connectivity
• Scan and list nearby Bluetooth devices
• Connect/disconnect to ESP32 module
• Send and receive real-time data

### 🔹 2. Manual Control Mode
• Directional controls: Forward, Backward, Left, Right, Stop
• Continuous movement on long press
• Adjustable speed levels (Min → Max)

### 🔹 3. Auto Control Modes
• Obstacle Avoidance
• Blind Spot Detection
• Displays: Distance from obstacles, Current speed

### 🔹 4. Real-Time Status Monitoring
• RSSI (signal strength)
• Estimated range
• Device name
• Speed and distance
• Connection status indicator

### 🔹 5. Settings & Customization
• Dark/Light theme toggle
• Language switching (English / Arabic)
• About section
• External website integration

### 🔹 6. Onboarding Guide
• Interactive introduction screens
• Step-by-step feature explanation
• Stored locally using SharedPreferences

---

## 🏗️ Architecture

The app follows a **Provider-based** state management architecture.

### 📂 Main Layers
• **UI Layer:** HomeView, ManualControlView, AutoControlView, StatusView, SettingsView, GuideView
• **State Management:** UiProvider, BluetoothProvider, GuideProvider
• **Routing:** AppRouter with dynamic screen switching

---

## 🔌 Bluetooth Communication

**Technologies:** flutter_blue_plus, permission_handler

**Workflow:** Scan → Connect → Discover services → Enable notifications → Send commands → Receive data

---

## 🌍 Localization

JSON-based translations supporting **English** 🇺🇸 and **Arabic** 🇸🇦

---

## ⚙️ Technologies Used

• Flutter (Dart)
• ESP32 (Bluetooth communication)
• Provider (State Management)
• Flutter Blue Plus
• SharedPreferences

---

## 📷 Screenshots

**Introduction_Screen:**

<img width="250" alt="Introduction Screen_1" src="https://github.com/user-attachments/assets/24119da4-b8a5-4278-b8dc-85d220818aa5" />
<img width="250" alt="Introductio Screen_2" src="https://github.com/user-attachments/assets/d1b952bc-7854-4d3e-a269-cf550ff932fd" />
<img width="250" alt="Introductio Screen_3" src="https://github.com/user-attachments/assets/ab445fd6-2d65-48e7-8458-2df67cf41b86" />
<img width="250" alt="Introductio Screen_4" src="https://github.com/user-attachments/assets/0ca58e15-7f84-4ef5-9b46-14864ea27ac9" />
<img width="250" alt="Introductio Screen_5" src="https://github.com/user-attachments/assets/bf3f4150-f118-45e0-a98b-f7f54984c586" />

**Home Screen**

<img width="250" alt="Home Screen" src="https://github.com/user-attachments/assets/1695b592-da0a-45fe-8531-fe5bb221a22a" />

**Mode Screen**

<img width="250" alt="Mode Screen" src="https://github.com/user-attachments/assets/ca083726-7ef7-48d8-96ff-808563b94c82" />

**Manual Screen**

<img width="250" alt="Controls Screen" src="https://github.com/user-attachments/assets/bef51df1-8068-432d-b7f9-a8fdadfd3d56" />

**Settings Screen**

<img width="250" alt="Settings Screen" src="https://github.com/user-attachments/assets/e8f5da22-9c7c-45ea-b0e0-679fbe8c690c" />

**Bluetooth Devices**

<img width="250" height="" alt="Bluetooth Devices Screen" src="https://github.com/user-attachments/assets/9630e2b5-f69d-4450-9e7a-8dce191a542d" />

---

[Download APK](https://github.com/Ahmed-Aatwan/Esp32_Car_Controller/releases/download/V1.0.0/Esp32Controller.apk)
