//
//  AddWonderViewController.swift
//  MyWonders
//
//  Created by Alexey Danilov on 4/27/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import UIKit
import CoreData

class AddWonderViewController: UIViewController {
    
    @IBOutlet weak var topSaveConfirmationLabel: UILabel!
    
    @IBOutlet weak var wonderNameTextField: UITextField!
    
    @IBOutlet weak var wonderLatitudeTextField: UITextField!
    
    @IBOutlet weak var wonderLongitudeTextField: UITextField!
    
    @IBOutlet weak var wonderNotesTextView: UITextView!
    
    var wonderName: String = ""
    
    var wonderLatitude: Double = 0.0
    
    var wonderLongitude: Double = 0.0
    
    var wonderNotes: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveRightButton = UIBarButtonItem.SystemItem.save
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: saveRightButton,
                                                            target: self,
                                                            action: #selector(addSaveButtonAction))
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let newWonder = NSEntityDescription.insertNewObject(forEntityName: "Wonders", into: managedContext) as? Wonders else { return }
        
        newWonder.wonderName = wonderName
        newWonder.wonderLatitude = wonderLatitude
        newWonder.wonderLongitude = wonderLongitude
        newWonder.wonderNotes = wonderNotes
        newWonder.wonderShow = true
        newWonder.wonderType = "MY"
        
        do {
            try managedContext.save()
            topSaveConfirmationLabel.text = "Saved: \(wonderName)"
        } catch {
            print("Could not save \(error)")
        }
        
    }
    
    @objc func addSaveButtonAction() {
        wonderName = wonderNameTextField.text ?? ""
        wonderLatitude = Double(wonderLatitudeTextField.text ?? "0.0") ?? 0.0
        wonderLongitude = Double(wonderLongitudeTextField.text ?? "0.0") ?? 0.0
        wonderNotes = wonderNotesTextView.text
    }

}
