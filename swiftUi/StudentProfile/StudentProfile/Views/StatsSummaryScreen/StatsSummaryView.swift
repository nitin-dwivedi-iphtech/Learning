//
//  StatsSummaryView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 14/07/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct StatsSummaryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    HStack(spacing: 16) {
                        StatCard(
                            title: "Study Hours",
                            value: "42.5 hrs",
                            subtitle: "This semester",
                            icon: "clock.fill",
                            color: .purple
                        )
                        
                        StatCard(
                            title: "Assignment Score",
                            value: "92%",
                            subtitle: "Avg. Grade",
                            icon: "doc.plaintext.fill",
                            color: .orange
                        )
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Weekly Performance")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        VStack(spacing: 16) {
                            HStack(alignment: .bottom, spacing: 14) {
                                BarView(day: "Mon", height: 80, color: .blue)
                                BarView(day: "Tue", height: 120, color: .blue)
                                BarView(day: "Wed", height: 150, color: .purple) // Midweek peak
                                BarView(day: "Thu", height: 90, color: .blue)
                                BarView(day: "Fri", height: 60, color: .blue)
                                BarView(day: "Sat", height: 30, color: .gray.opacity(0.4))
                                BarView(day: "Sun", height: 45, color: .gray.opacity(0.4))
                            }
                            .frame(height: 160)
                            .padding(.top, 10)
                            
                            Divider()
                            
                            HStack {
                                Label("Daily Average: 4.5 hrs", systemImage: "bolt.fill")
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundColor(.purple)
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                .padding(.top)
            }
            .navigationTitle("Academic Stats")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
            }
        }
    }
}




#Preview {
    if #available(iOS 15.0, *) {
        StatsSummaryView()
    }
}
