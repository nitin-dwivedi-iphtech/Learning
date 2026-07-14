//
//  UserProfileView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var student: Student
    @Environment(\.openURL) private var openURL
    @State private var loadedImage: UIImage? = nil
    
    private func loadImageAsync() async {
        
        guard let filename = student.userImage, !filename.isEmpty else {
            await MainActor.run {
                self.loadedImage = nil
            }
            return
        }
        let image = await Task.detached(priority: .userInitiated) {() -> UIImage? in
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent(filename)
            if let data = try? Data(contentsOf: fileURL, options: .uncached), let uiImage = UIImage(data: data) {
                return uiImage
            }
            return nil
        }.value
        
        await MainActor.run{
            self.loadedImage = image
        }
    }
    
    var body: some View {
        
        if #available(iOS 15.0, *) {
            HStack(alignment: .center, spacing: 16) {
                
                Image(uiImage: loadedImage ?? UIImage(named: "user") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(student.username ?? "N/A")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Student Id: \(student.studentId ?? "N/A")")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 10) {
                        Label(student.userEmail ?? "N/A", systemImage: "envelope")
                        
                        Text("•")
                            .foregroundColor(.secondary)
                        
                        Label(student.userPhone ?? "N/A", systemImage: "phone")
                            .onTapGesture {
                                triggerSystemPhoneCall(for: student.userPhone)
                            }
                    }
                    .font(.system(size: 13, design: .rounded))
                    .foregroundColor(.blue)
                    .padding(.top, 2)
                }
                .lineLimit(1)
                
                Spacer()
                
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.blue)
                    .onTapGesture {
                        if let generatedPdf = GeneratePDF(for: student){
                            ShareSheet(for: generatedPdf)
                        }
                        else {
                            print("Error: PDF Generation failed.")
                        }
                    }
            }
            .padding()
            .background(Color(.systemBackground))
            .task(id:"\(student.userImage ?? "")-\(student.updatedAt?.timeIntervalSince1970 ?? 0)"){
                await loadImageAsync()
            }
        }
    }
    
    private func triggerSystemPhoneCall(for rawNumber: String?) {
        guard let phoneString = rawNumber, !phoneString.isEmpty else { return }
        
        let numericDigits = phoneString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        if let callURL = URL(string: "tel://\(numericDigits)") {
            openURL(callURL)
        }
    }
}
