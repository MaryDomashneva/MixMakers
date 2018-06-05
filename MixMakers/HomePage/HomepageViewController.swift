import UIKit
import SearchTextField

class HomepageViewController: UIViewController {
    
    var searchTerm: [String] = []
    
    
    @IBOutlet weak var searchIngredientsText: SearchTextField!
    
    @IBOutlet weak var ingredient1: UIButton!
    @IBOutlet weak var ingredient2: UIButton!
    @IBOutlet weak var ingredient3: UIButton!
    
    @IBAction func addPressed(_ sender: Any) {
        let buttons = [ingredient1, ingredient2, ingredient3]
        guard let searchText = searchIngredientsText.text else {
            searchIngredientsText.text = ""
            return
        }
        if searchText.isEmpty {
            searchIngredientsText.text = ""
        } else {
            if searchTerm.count >= buttons.count {
                return
            } else {
                buttons[searchTerm.count]?.setTitle(searchText, for: .normal)
                buttons[searchTerm.count]?.isEnabled = true
                searchTerm.append(searchText)
            }
        }
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
            ingredient1.isEnabled = false
        }
        else {
            ingredient1.setTitle(ingredient2.title(for: .normal), for: .normal)
            if ingredient3.title(for: .normal) == "" {
                ingredient2.setTitle("", for: .normal)
                ingredient2.isEnabled = false
            }
            else {
                ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
                ingredient3.setTitle("", for: .normal)
                ingredient3.isEnabled = false
            }
        }
    }
    
    @IBAction func ingredient2Pressed(_ sender: Any) {
        searchTerm.remove(at: searchTerm.index(of: ingredient2.title(for: .normal)!)!)
        if ingredient3.title(for: .normal) == "" {
            ingredient2.setTitle("", for: .normal)
            ingredient2.isEnabled = false
        }
        else {
            ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
            ingredient3.setTitle("", for: .normal)
            ingredient3.isEnabled = false
        }
    }
    
    @IBAction func ingredient3Pressed(_ sender: Any) {
        searchTerm.remove(at: searchTerm.index(of: ingredient3.title(for: .normal)!)!)
        ingredient3.setTitle("", for: .normal)
        ingredient3.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchField()
    }
    
    func configureSearchField() {
        searchIngredientsText.inlineMode = true
        searchIngredientsText.filterStrings(ingredientsArray)
    }
    
    // Called whenever screen is going to be rendered
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
}
