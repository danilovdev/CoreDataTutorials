//
//  CreateCompanyController.swift
//  Companies
//
//  Created by Alexey Danilov on 5/3/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol CreateCompanyControllerDelegate {
    
    func didAddCompany(company: Company)
    
    func didEditCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    var company: Company? {
        didSet {
            nameTextField.text = company?.name
        }
    }
    
    var createCompanyControllerDelegate: CreateCompanyControllerDelegate?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lightBlueBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter name"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        view.backgroundColor = .darkBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        navigationItem.title = company == nil ? "Create Company" : "Edit Company"
    }
    
    @objc func handleCancel() {
        dismiss(animated: true)
    }
    
    @objc func handleSave() {
        if company == nil {
            createCompany()
        } else {
            saveCompanyChanges()
        }
    }
    
    private func createCompany() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        company.setValue(nameTextField.text!, forKey: "name")
        do {
            try context.save()
            
            dismiss(animated: true, completion: { [weak self] in
                self?.createCompanyControllerDelegate?.didAddCompany(company: company as! Company)
            })
        } catch let saveError {
            print("Failed to save company: \(saveError)")
        }
    }
    
    private func saveCompanyChanges() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        company?.name = nameTextField.text
        do {
            try context.save()
            
            dismiss(animated: true, completion: { [weak self] in
                guard let strongSelf = self, let company = strongSelf.company else { return }
                strongSelf.createCompanyControllerDelegate?.didEditCompany(company: company)
            })
        } catch let saveError {
            print("Failed to save company changes: \(saveError)")
        }
    }
    
    
    private func setupUI() {
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lightBlueBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
}
