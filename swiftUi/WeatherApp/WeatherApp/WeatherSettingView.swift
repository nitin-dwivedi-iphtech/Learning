//
//  WeatherSettingView.swift
//  WeatherApp
//
//  Created by iPHTech6 on 07/07/26.
//
import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("useCelsius") private var useCelsius: Bool = true
    @AppStorage("enableNotifications") private var enableNotifications: Bool = true
    @AppStorage("refreshRate") private var refreshRate: String = "Every Hour"
    
    let refreshOptions = ["Every 15 Min", "Every Hour", "Manually"]
    
     @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Display Preferences")) {
                    Toggle(isOn: $isDarkMode) {
                        HStack {
                            Image(systemName: "moon.fill").foregroundColor(.purple)
                            Text("Dark Mode")
                        }
                    }
                    
                    Toggle(isOn: $useCelsius) {
                        HStack {
                            Image(systemName: "thermometer.medium").foregroundColor(.orange)
                            Text("Use Celsius (°C)")
                        }
                    }
                }
                
                Section(header: Text("Updates & Alerts")) {
                    Toggle(isOn: $enableNotifications) {
                        HStack {
                            Image(systemName: "bell.badge.fill").foregroundColor(.red)
                            Text("Weather Alerts")
                        }
                    }
                    
                    Picker(selection: $refreshRate, label:
                        HStack {
                            Image(systemName: "arrow.clockwise").foregroundColor(.blue)
                            Text("Refresh Rate")
                        }
                    ) {
                        ForEach(refreshOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                 }
                
                Section(header: Text("About")) {
                    HStack {
                        Image(systemName: "info.circle.fill").foregroundColor(.gray)
                        Text("Version")
                        Spacer()
                        Text("1.0.0").foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button("Done") {
                     presentationMode.wrappedValue.dismiss()
                }
                .font(.body)
            )
        }
        .colorScheme(isDarkMode ? .dark : .light)
    }
}

struct Setting_Preview:PreviewProvider{
    static var previews: some View{
        SettingsView()
    }
}
