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
            if searchTerm.count == 0 {
                searchTerm.append(searchIngredientsText.text!)
                ingredient1.setTitle(searchIngredientsText.text, for: .normal)
                ingredient1.isHidden = false
            }
            else if searchTerm.count == 1 {
                searchTerm.append(searchIngredientsText.text!)
                ingredient2.setTitle(searchIngredientsText.text, for: .normal)
                ingredient2.isHidden = false
            }
                
            else if searchTerm.count == 2 {
                searchTerm.append(searchIngredientsText.text!)
                ingredient3.setTitle(searchIngredientsText.text, for: .normal)
                ingredient3.isHidden = false
            }
            
        }
        
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        if let searchText = searchIngredientsText.text, !searchText.isEmpty {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm.append(searchIngredientsText.text!)
            navigationController?.pushViewController(resultView, animated: true)
        } else {
            let emptySearchAlert = UIAlertController(title: "Please, enter ingredient!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            emptySearchAlert.addAction(okButton)
            present(emptySearchAlert, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchField()
    }
    
    func configureSearchField() {
        searchIngredientsText.filterStrings(["Vodka", "Gin", "Tequila"])
    }
    
    // Called whenever screen is going to be rendered
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
}
