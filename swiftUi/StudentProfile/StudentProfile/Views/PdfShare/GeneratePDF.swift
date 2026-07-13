//
//  GeneratePDF.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 13/07/26.
//

import SwiftUI

// pdf page is designed constant not dynamic if context length increase it truncate it ask this to sir
@MainActor
func GeneratePDF(for student: Student) -> URL? {
    let pdfView = UserPdfView(student: student)
    let fileName = "UserProfile.pdf"
    
    guard let cachesDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
        return nil
    }
    let tempURL = cachesDir.appendingPathComponent(fileName)
    
    // remove the exisitng file ask this if its imp
    try? FileManager.default.removeItem(at: tempURL)
    
    if #available(iOS 16.0, *) {
        let imageRender = ImageRenderer(content: pdfView)
        
        imageRender.render { size, context in
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            guard let pdfContext = CGContext(tempURL as CFURL, mediaBox: &box, nil) else { return }
            
            pdfContext.beginPDFPage(nil)
            context(pdfContext)
            pdfContext.endPDFPage()
            pdfContext.closePDF()
        }
        
        if FileManager.default.fileExists(atPath: tempURL.path) {
            return tempURL
        } else {
            print("Error: PDF rendered context closed, but file was not written to disk.")
            return nil
        }
    } else {
        return nil
    }
}
