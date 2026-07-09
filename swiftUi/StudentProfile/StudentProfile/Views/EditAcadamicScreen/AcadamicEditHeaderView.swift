//
//  AcadamicEditHeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEditHeaderView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var studentID: String = "STU-2026-8942"
    @State private var universityName: String = "Stanford University"
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.red)
                    .font(.body)
            }
            
            Spacer()
            
            Text("Edit Academics")
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(.primary) // Auto-toggles black/white based on theme
            
            Spacer()
            
            Button(action: {
                // TODO: Handle Core Data or Model context save operations here
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .bold()
                    .font(.body)
            }
            .disabled(universityName.isEmpty || studentID.isEmpty)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        // Uses secondary group card background to look native on form pages
        .background(Color(.secondarySystemGroupedBackground))
        
    }
}

struct AcadamicEditHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AcadamicEditHeaderView()
    }
}
