//
//  ViewController.swift
//  ramsay_charles_project4
//
//  Created by Charles Ramsay on 12/16/19.
//  Copyright © 2019 Charles Ramsay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listOfRecipeItems = RecipeList(recipe: [])
    let urlString = "https://raw.githubusercontent.com/LeaVerou/forkgasm/master/recipes.json"
    
    // Define a MercuryList
    struct RecipeList: Codable {
        let recipe: [RecipeItem]
    }
    
    // Decode JSON code from url
    func getItems (urlString: String) {
        
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            let temporaryItemList = try! JSONDecoder().decode (RecipeList.self, from: data!)
            self.listOfRecipeItems = temporaryItemList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            
        }
        
        task.resume()
        
    }
    
    // Add image from url to current MercuryCell
    func getItemImage (cell: RecipeCell, urlString: String) {
        
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.itemImage.image = image
                    }
                }
            }
        
            task.resume()
        
        }
    
    // Setup
    override func viewDidLoad() {
        
        tableView.dataSource = self
        super.viewDidLoad()
        getItems(urlString: self.urlString)

    }
    
    // Set number of rows to length of list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listOfRecipeItems.recipe.count
        }
    
    // Populate cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let name = listOfRecipeItems.recipe[indexPath.item].name
        let description = listOfRecipeItems.recipe[indexPath.item].description
        let ingredientstemp = listOfRecipeItems.recipe[indexPath.item].ingredient
        var ingredients = "Ingredients: "
        for a in ingredientstemp{
            if a.amount != nil {
                ingredients += String(a.amount!) + " "
            }
            if a.unit != nil {
                ingredients += String(a.unit!) + " "
            }
            if a.name != nil {
                ingredients += String(a.name!) + ", "
            }
        }
        let stepstemp = listOfRecipeItems.recipe[indexPath.item].step
        var steps = ""
        for b in stepstemp {
            steps += String(b.description) + " Then, "
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if let recipeCell = cell as? RecipeCell {
            recipeCell.itemName.text = "\(name)"
            recipeCell.myDescription.text = "\(description ?? "")"
            recipeCell.myIngredients.text = "\(ingredients)"
            recipeCell.mySteps.text = "\(steps)"
            getItemImage(cell: recipeCell,
                      urlString: listOfRecipeItems.recipe[indexPath.item].image)
            
        }
        
        return cell
    }
}
//extension ViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedRow = listOfMercuryItems.recipe[indexPath.item]
//        let detail = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//        detail.recipe = selectedRow
//        detail.controller = self
//
//            navigationController?.pushViewController(detail, animated: false)
//        print(selectedRow.name)
//    }
//}
