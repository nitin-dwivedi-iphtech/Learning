//
//  ProfileUnavailableView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct ProfileUnavailableView: View {
    var title: String
        var systemImage: String
        var description: String
        var retryAction: (() -> Void)? = nil
        
        var body: some View {
            VStack(spacing: 16) {
                // 1. Large System Icon
                Image(systemName: systemImage)
                    .font(.system(size: 60))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                
                // 2. Main Bold Title
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // 3. Explanatory Subtitle text
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                
                // 4. Conditional Optional Action Button
                if let action = retryAction {
                    Button(action: action) {
                        Text("Retry Loading")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.top, 8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }

//struct ProfileUnavailableView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileUnavailableView(title: <#String#>, systemImage: <#String#>, description: <#String#>)
//    }
//}
