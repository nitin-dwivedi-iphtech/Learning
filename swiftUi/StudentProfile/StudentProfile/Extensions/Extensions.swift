//
//  Extensions.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//
import SwiftUI
import CoreData

struct CurrentStudent: EnvironmentKey {
    static let defaultValue: Student? = nil
}

struct StudentAcadamics: EnvironmentKey {
    static let defaultValue: [Acadamics] = []
}

struct SkillsEnv: EnvironmentKey {
    static let defaultValue: [Skill] = []
}

extension EnvironmentValues {
    var currentStudent: Student? {
        get { self[CurrentStudent.self] }
        set { self[CurrentStudent.self] = newValue }
    }
    
    var studentAcadamics: [Acadamics] {
        get { self[StudentAcadamics.self] }
        set { self[StudentAcadamics.self] = newValue }
    }
    
    var skill: [Skill] {
        get { self[SkillsEnv.self] }
        set { self[SkillsEnv.self] = newValue }
    }
}

/*
 SaveData extension in ProfileEditView.swift
 */
extension ProfileEditView {
    func saveData(name: String, email: String, phone: String, id: String, gender: String, dob: Date, student: Student?, viewContext: NSManagedObjectContext) {
        
        let targetStudent: Student = student ?? Student(context: viewContext)
        targetStudent.username = name
        targetStudent.userPhone = phone
        targetStudent.userEmail = email
        targetStudent.studentId = id
        targetStudent.gender = gender
        targetStudent.dob = dob
        
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Failed to save to database: \(error.localizedDescription)")
            }
        }
    }
}

/*
 Extension for Student entity for adding the dummy data
 */
extension Student {
    static func createDummyStudent(in context: NSManagedObjectContext) -> Student {
        let dummy = Student(context: context)
        dummy.username = "John Doe"
        dummy.studentId = "STU-2026-8942"
        dummy.userEmail = "john.doe@university.edu"
        dummy.userPhone = "+1 (555) 019-2834"
        dummy.gender = "Male"
        dummy.dob = Calendar.current.date(byAdding: .year, value: -20, to: Date())
        
        do {
            try context.save()
        } catch {
            print("Failed to save dummy student: \(error.localizedDescription)")
        }
        return dummy
    }
}

/*
 Extension for Acadamics entity
 Links the academic profile back to our target student
 */
extension Acadamics {
    static func createDummyAcadamics(in context: NSManagedObjectContext, student: Student) -> Acadamics {
        let dummy = Acadamics(context: context)
        dummy.attendancePercentage = 84.5
        dummy.cgpa = 7.2
        dummy.course = "Masters of Computer Applications"
        dummy.creditsCompleted = 48
        dummy.currentSemester = "IV"
        dummy.departmentName = "Department of Computer Science"
        dummy.institution = "Stanford University"
        dummy.studentId = student.studentId
        
        dummy.student = student
        
        do {
            try context.save()
        } catch {
            print("Failed to save dummy academics: \(error.localizedDescription)")
        }
        return dummy
    }
}

/*
 Extension for Skill entity
 Generates one tech, one non-tech, and connects them directly
 */
extension Skill {
    static func createDummySkills(in context: NSManagedObjectContext, for student: Student) {
        // Technical Skill
        let techDummy = Skill(context: context)
        techDummy.isTechnical = true
        techDummy.skillName = "Swift"
        techDummy.proficiency = 8.0
        techDummy.skillImage = "swift"
        techDummy.stud_Skill = student
        
        let nonTechDummy = Skill(context: context)
        nonTechDummy.isTechnical = false
        nonTechDummy.skillName = "Public Speaking"
        nonTechDummy.proficiency = 7.0
        nonTechDummy.skillImage = "mic.fill"
        nonTechDummy.stud_Skill = student
        
        do {
            try context.save()
        } catch {
            print("Failed to save dummy skills: \(error.localizedDescription)")
        }
    }
}

/*
 Extension for Subjects entity
 Assigns the subject to the proper academic record context
 */
extension Subjects {
    static func createDummySubjects(in context: NSManagedObjectContext, for academics: Acadamics) {
        
        let dummyList = [
            (code: Int16(401), name: "Advanced Software Engineering", credits: Int16(4), icon: "terminal.fill"),
            (code: Int16(402), name: "Cloud Computing & DevOps", credits: Int16(4), icon: "cloud.fill"),
            (code: Int16(403), name: "Big Data Analytics", credits: Int16(3), icon: "chart.pie.fill"),
            (code: Int16(499), name: "Major Project / Dissertation", credits: Int16(6), icon: "doc.text.below.ecg.fill")
        ]
        
        for item in dummyList {
            let dummy = Subjects(context: context)
            dummy.subjectCode = item.code
            dummy.subjectName = item.name
            dummy.credits = item.credits
            dummy.subjectIcon = item.icon
            
            dummy.acad_sub = academics
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save dummy subjects: \(error.localizedDescription)")
        }
    }
}

/*
 AcadamicModel to fetch updated data from db automatic
 */

extension AcadamicModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        if let updatedRecords = controller.fetchedObjects as? [Acadamics] {
            DispatchQueue.main.async {
                self.acadamics = updatedRecords
            }
        }
    }
}
