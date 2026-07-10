//
//  AcadamicModel.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 10/07/26.
//

import CoreData
import Foundation

class AcadamicModel: NSObject, ObservableObject {
    
    static let shared = AcadamicModel()
    
    @Published var acadamics: [Acadamics] = []
    
    private var context: NSManagedObjectContext?
    private var fetchedResultsController: NSFetchedResultsController<Acadamics>?
    
    private var currentConfiguredStudentId: String?
    
    private override init() {
        self.context = nil
        super.init()
    }
    
    func configure(studentId: String, context: NSManagedObjectContext) {
        guard currentConfiguredStudentId != studentId else { return }
        
        self.context = context
        self.currentConfiguredStudentId = studentId
        
        setupLiveListener(for: studentId)
    }
    
    private func setupLiveListener(for studentId: String) {
        guard let validContext = self.context else { return }
        
        let request = NSFetchRequest<Acadamics>(entityName: "Acadamics")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Acadamics.currentSemester, ascending: true)]
        request.predicate = NSPredicate(format: "studentId == %@", studentId)
        
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: validContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        fetchedResultsController?.delegate = self
        
        do {
            try fetchedResultsController?.performFetch()
            
            if let initialRecords = fetchedResultsController?.fetchedObjects {
                DispatchQueue.main.async {
                    self.acadamics = initialRecords
                }
            }
        } catch {
            print("Failed to fetch academics: \(error.localizedDescription)")
        }
    }
    
    func updateData(for record: AcadamicModel, universityName: String, departmentName: String, courseName: String, currentSemester: String, currentCGPA: Float, attendanceRate: Float, completedCredits: Int16) {
        // update logic
        for record in acadamics{
            record.institution = universityName
            record.departmentName = departmentName
            record.course = courseName
            record.currentSemester = currentSemester
            record.cgpa = currentCGPA
            record.attendancePercentage = attendanceRate
            record.creditsCompleted = completedCredits
        }
        saveContext()
    }
    
    private func saveContext() {
        guard let validContext = self.context else { return }
        
        if validContext.hasChanges {
            do {
                try validContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
}


