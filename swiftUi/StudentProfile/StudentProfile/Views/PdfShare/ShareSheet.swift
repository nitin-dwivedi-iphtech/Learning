//
//  ShareSheet.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 13/07/26.
//

import SwiftUI

// No inbuilt sharesheet we are using UIKIT for this...
@MainActor
func ShareSheet(for fileURL: URL?) {
    let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        // Grabs the current foreground window scene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            
            // iPad Support: Prevents crash scenarios by anchoring the popover box
//            if let popoverController = activityViewController.popoverPresentationController {
//                popoverController.sourceView = rootViewController.view
//                popoverController.sourceRect = CGRect(
//                    x: rootViewController.view.bounds.midX,
//                    y: rootViewController.view.bounds.midY,
//                    width: 0,
//                    height: 0
//                )
//                popoverController.permittedArrowDirections = []
//            }
//            
            // Present the share action layer over everything else
            rootViewController.present(activityViewController, animated: true, completion: nil)
        }
}
