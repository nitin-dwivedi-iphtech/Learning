//
//  UserImageView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct UserImageView: View {
    @ObservedObject var student: Student
    @Binding var selectedImage: UIImage?
    
    var size: CGFloat = 120
    
    @State private var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        if #available(iOS 17.0, *) {
            PhotosPicker(selection: $selectedItem, matching: .images) {
                Group {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                    } else if let savedImage = loadSavedImage() {
                        Image(uiImage: savedImage)
                            .resizable()
                    } else {
                        Image("user")
                            .resizable()
                    }
                }
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .buttonStyle(.plain)
            .onChange(of: selectedItem) { oldValue, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            self.selectedImage = uiImage
                        }
                    }
                }
            }
        }
    }
    
    
    private func loadSavedImage() -> UIImage? {
        guard let filename = student.userImage, !filename.isEmpty else { return nil }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        
        if let data = try? Data(contentsOf: fileURL) {
            return UIImage(data: data)
        }
        return nil
    }
}

struct UserImage_Preview: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            UserImageView(student: Student(), selectedImage: .constant(nil))
        } else {
            EmptyView()
        }
    }
}
