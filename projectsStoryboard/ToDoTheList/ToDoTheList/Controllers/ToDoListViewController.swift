//
//  ViewController.swift
//  ToDoTheList
//
//  Created by Dhruv Bhardwaj on 04/01/23.
//

import UIKit
import RealmSwift
import ChameleonFramework
class ToDoListViewController: SwipeTableViewController{
    var todoItems:Results<Item>?
    let realm=try! Realm()
    
    @IBOutlet weak var searchBar: UISearchBar!
    var selectedCategory:Category?{
        didSet{
            loadItems()
        }
    }
    let dataFilePath=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("Items.plist")
    //    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext-->COre data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        
        searchBar.placeholder="Search"
        
//        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
//            textfield.textColor = UIColor.white
//        }
        //Search Bar PlaceHolder Colour
        //        loadItems()//default value helps it without arguements
    }
    override func viewWillAppear(_ animated: Bool) {
        if let colourHex=selectedCategory?.colour{
            
            title = selectedCategory!.name
            
            guard let navbar=navigationController?.navigationBar else{fatalError("Navigation bar does not exist.")}
            if let navbarcolour=UIColor(hexString: colourHex){
                let contrastColour=ContrastColorOf(navbarcolour, returnFlat: true)
                navbar.backgroundColor=navbarcolour
                navbar.tintColor = contrastColour
                navbar.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor : contrastColour]
                
                
                searchBar.barTintColor=navbarcolour
                
                
                searchBar.tintColor=contrastColour
               //Search bar background COlour
                if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                    textfield.backgroundColor = navbarcolour
                }
                //Search Bar text colour
                if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                    textfield.textColor = contrastColour
                }
                
                //Search Bar Placeholder Colour
                if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                    textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor :contrastColour])
                }
                
                //Search Bar Default Image Colour
                if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                    if let leftView = textfield.leftView as? UIImageView {
                        leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                        leftView.tintColor = contrastColour
                    }
                    if let rightView = textfield.rightView as? UIImageView {
                        rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
                        rightView.tintColor = contrastColour
                    }
                }
            }
            
        }
    }
    //MARK: -TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=super.tableView(tableView, cellForRowAt: indexPath )
        if let item=todoItems?[indexPath.row]{
            cell.textLabel?.text=item.title
            if let colour=UIColor(hexString: selectedCategory!.colour)?.darken(byPercentage:CGFloat(indexPath.row)/CGFloat(todoItems!.count)){
                cell.backgroundColor=colour
                cell.textLabel?.textColor=ContrastColorOf(colour, returnFlat: true)
            }
            cell.accessoryType = item.done ? .checkmark : .none
        }
        else{
            cell.textLabel?.text="No Items Added"
        }
        return cell
    }
    //MARK: -TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CORE DATA
        //the order of below two lines must be in this only else app crashes
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        
        //        todoItems[indexPath.row].done.toggle()
        //        saveItems()
        
        
        //REALM-->Updating
        if let items=todoItems?[indexPath.row]{
            do{
                try realm.write{
                    //                    realm.delete(items)//-->delte an item
                    items.done.toggle()//--> checkmark toggle
                }
            }
            catch{
                print("Error saving done info \(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: -Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield=UITextField()
        let alert=UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action=UIAlertAction(title: "Add Item", style: .default){(action) in
            //what will happen once user clicks add item alert
            
            
            //For core data
            //            let newItem=Item(context: self.context)
            //            newItem.title=textfield.text!
            //            newItem.done=false
            //            newItem.parentCategory=self.selectedCategory
            
            //            self.itemArray.append(newItem)
            //            self.saveItems()
            
            //for realm-->we don't need a save items
            if let currenCategory=self.selectedCategory{
                do{
                    try self.realm.write{
                        let newItem=Item()
                        newItem.title=textfield.text!
                        newItem.dateCreated=Date()
                        currenCategory.items.append(newItem)
                    }
                }catch{
                    print("Error saving items \(error)")
                }
            }
            self.tableView.reloadData()
        }
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder="Create new item"
            textfield=alertTextField
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
    
    //MARK: -Model Manipulation Methods
    //    user default saving
    //    func saveItems(){
    //        let encoder=PropertyListEncoder()
    //        do{
    //            let data=try encoder.encode(itemArray)
    //            try data.write(to:dataFilePath!)
    //        }catch{
    //            print("Error encoding array,\(error)")
    //        }
    //        self.tableView.reloadData()
    //    }
    //    func loadItems(){
    //        if let data=try? Data(contentsOf: dataFilePath!){
    //            let decoder=PropertyListDecoder()
    //            do{
    //                itemArray=try decoder.decode([Item].self, from: data)
    //            }catch{
    //                print("Error decoding array,\(error)")
    //            }
    //        }
    //    }
    
    //Core data saving and loading
    //    func saveItems(){
    //        do{
    //            try context.save()
    //        }catch{
    //            print("Error saving context,\(error)")
    //        }
    //        self.tableView.reloadData()
    //    }
    
    //Core Data Load Items
    //    func loadItems(with request:NSFetchRequest<Item> = Item.fetchRequest(), predicate:NSPredicate?=nil){
    //        let categoryPredicate=NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
    //        if let additionalPredicate=predicate{
    //            request.predicate=NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,additionalPredicate])
    //        }else{
    //            request.predicate=categoryPredicate
    //        }
    //        do{
    //            itemArray=try context.fetch(request)
    //        }catch{
    //            print("Error fetching data from context\(error)")
    //        }
    //        tableView.reloadData()
    //    }
    
    //Realm Load and Save
    func loadItems(){
        todoItems=selectedCategory?.items.sorted(byKeyPath: "title",ascending: true)
        tableView.reloadData()
    }
    override func updateModel(at indexPath: IndexPath) {
        if let item=todoItems?[indexPath.row]{
            do{
                try realm.write{
                    realm.delete(item)
                }
            }catch{
                print("Error deleting Items,\(error)")
            }
        }
    }
    //MARK: -Search Bar Methods
    //Core Data
    //extension ToDoListViewController:UISearchBarDelegate{
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        let request:NSFetchRequest<Item>=Item.fetchRequest()
    //        //filter
    //        let predicate=NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
    //        //sort by
    //        request.sortDescriptors=[NSSortDescriptor(key: "title", ascending: true)]
    //        //fetching the results
    //        loadItems(with: request,predicate: predicate)
    //    }
    //    //to move to original list after removing search
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        if searchBar.text! .count==0{
    //            loadItems()
    //            //removing keyboard and going to original state
    //            //has to be in main thread for data to show on foreground
    //            DispatchQueue.main.async {
    //                searchBar.resignFirstResponder()
    //            }
    //
    //        }
    //    }
    //}
    
}
    //Realm
    extension ToDoListViewController:UISearchBarDelegate{
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            todoItems=todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated",ascending: true)
            tableView.reloadData()
        }
        //to move to original list after removing search
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchBar.text?.count==0{
                loadItems()
                //removing keyboard and going to original state
                //has to be in main thread for data to show on foreground
                DispatchQueue.main.async {
                    searchBar.resignFirstResponder()
                }
                
            }
        }
    }
