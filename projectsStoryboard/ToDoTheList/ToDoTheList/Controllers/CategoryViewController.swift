//
//  CategoryViewController.swift
//  ToDoTheList
//
//  Created by Dhruv Bhardwaj on 04/01/23.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework
class CategoryViewController: SwipeTableViewController {
    
    let realm=try! Realm()
    
//    var categories=[Category]()-->for core data
    
    var categories:Results<Category>?//--->Realm
    
//    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        loadCategories()
        tableView.separatorStyle = .none
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        // 2
        var insets = view.safeAreaInsets
        insets.bottom = 0
        tableView.contentInset = insets
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let navbar=navigationController?.navigationBar else{fatalError("Navigation bar does not exist.")}
        let colourHex=UIColor(hexString: "7ECAF9")
        navbar.backgroundColor=colourHex
        if let navbarcolour=colourHex{
            let contrastColour=ContrastColorOf(navbarcolour, returnFlat: true)
            navbar.tintColor = contrastColour
            navbar.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor : contrastColour]
        }
    }
    //MARK: -TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text=categories?[indexPath.row].name ?? "No Categories Added yet"
        guard let categoryColour=UIColor(hexString: categories?[indexPath.row].colour ?? "7ECAF9") else{fatalError("Cannot assign colour")}
        cell.backgroundColor=categoryColour
        cell.textLabel?.textColor=ContrastColorOf(categoryColour, returnFlat: true)
        return cell
    }
    //MARK: -TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! ToDoListViewController
        
        if let indexPath=tableView.indexPathForSelectedRow{
            destinationVc.selectedCategory=categories?[indexPath.row]
        }
    }
    //MARK: -Data Manipulation Methods
    func save(category:Category){
        do{
            try realm.write{
                realm.add(category)
            }
        }catch{
            print("Error saving data\(error)")
        }
        tableView.reloadData()
    }
    func loadCategories(){
        categories=realm.objects(Category.self)
        tableView.reloadData()
    }
    //MARK: -Delete data from swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion=self.categories?[indexPath.row]{
            do{
                try self.realm.write{
                    self.realm.delete(categoryForDeletion)
                }
            }catch{
                print("Error Deleting category \(error)")
            }
        }
    }
//    Core data save
    
//    func save(category:Category){
//        do{
//            try context.save()
//        }catch{
//            print("Error saving data\(error)")
//        }
//        tableView.reloadData()
//    }
    
//    Core data load
//    func loadCategories(){
//        let request:NSFetchRequest<Category>=Category.fetchRequest()
//        do {
//            categories=try context.fetch(request)
//        }catch{
//            print("Error loading categories \(error)")
//        }
//        tableView.reloadData()
//    }
    
    //MARK: -Add a new category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield=UITextField()
        let alert=UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        let action=UIAlertAction(title: "Add", style: .default){(action) in
            let newCategory=Category()
            newCategory.name=textfield.text!
            newCategory.colour=UIColor.randomFlat().hexValue()
            
//            self.categories.append(newCategory)-->for core data
            
            
            //for realm no need to append it auto updates
            self.save(category:newCategory)
        }
        alert.addAction(action)
        alert.addTextField{ field in
            textfield=field
            textfield.placeholder="Create a new Category"
        }
        present(alert,animated: true,completion: nil)
    }
    
    
    
    
}
