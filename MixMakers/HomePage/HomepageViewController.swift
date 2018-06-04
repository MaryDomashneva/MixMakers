import UIKit
import SearchTextField

class HomepageViewController: UIViewController {
    
    var searchTerm: [String] = []
    
    
    @IBOutlet weak var searchIngredientsText: SearchTextField!
    
    @IBOutlet weak var ingredient1: UIButton!
    @IBOutlet weak var ingredient2: UIButton!
    @IBOutlet weak var ingredient3: UIButton!
    
    @IBAction func addPressed(_ sender: Any) {
        if !(searchIngredientsText.text?.isEmpty)! {
            let searchString = searchIngredientsText.text?.capitalized
            if searchTerm.count == 0 {
                searchTerm.append(searchString!)
                ingredient1.setTitle(searchString, for: .normal)
            }
            else if searchTerm.count == 1 {
                searchTerm.append(searchString!)
                ingredient2.setTitle(searchString, for: .normal)
            }
                
            else if searchTerm.count == 2 {
                searchTerm.append(searchString!)
                ingredient3.setTitle(searchString, for: .normal)
                
            }
        }
        searchIngredientsText.text = ""
        
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        if let searchText = searchIngredientsText.text, !searchTerm.isEmpty {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm.append(contentsOf: searchTerm)
            navigationController?.pushViewController(resultView, animated: true)
        } else {
            let emptySearchAlert = UIAlertController(title: "Please, enter an ingredient!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            emptySearchAlert.addAction(okButton)
            present(emptySearchAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func ingredient1Pressed(_ sender: Any) {
        searchTerm.remove(at: searchTerm.index(of: ingredient1.title(for: .normal)!)!)
        if ingredient2.title(for: .normal) == "" {
            ingredient1.setTitle("", for: .normal)
        }
        else {
            ingredient1.setTitle(ingredient2.title(for: .normal), for: .normal)
            if ingredient3.title(for: .normal) == "" {
                ingredient2.setTitle("", for: .normal)
            }
            else {
                ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
                ingredient3.setTitle("", for: .normal)
            }
        }
    }
    
    @IBAction func ingredient2Pressed(_ sender: Any) {
        searchTerm.remove(at: searchTerm.index(of: ingredient2.title(for: .normal)!)!)
        if ingredient3.title(for: .normal) == "" {
            ingredient2.setTitle("", for: .normal)
        }
        else {
            ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
            ingredient3.setTitle("", for: .normal)
        }
    }
    
    @IBAction func ingredient3Pressed(_ sender: Any) {
        searchTerm.remove(at: searchTerm.index(of: ingredient3.title(for: .normal)!)!)
        ingredient3.setTitle("", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchField()
    }
    
    func configureSearchField() {
        searchIngredientsText.filterStrings(ingredientsArray)
    }
    
    // Called whenever screen is going to be rendered
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
}
