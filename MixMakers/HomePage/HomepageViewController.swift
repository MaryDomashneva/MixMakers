import UIKit
import SearchTextField

class HomepageViewController: UIViewController {
    
    var searchTerm: [String] = []
    
    @IBOutlet weak var searchIngredientsText: SearchTextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ingredient1: UIButton!
    @IBOutlet weak var ingredient2: UIButton!
    @IBOutlet weak var ingredient3: UIButton!
    

    @IBAction func editPressed(_ sender: Any) {
        addButton.isHidden = false
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let buttons = [ingredient1, ingredient2, ingredient3]
        
        searchIngredientsText.isEnabled = true
        self.view.endEditing(true)
        
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
                buttons[searchTerm.count]?.isHidden = false
                searchTerm.append(searchText)
                if searchTerm.count == 3 {
                    addButton.isHidden = true
                    searchIngredientsText.isEnabled = false
                }
            }
        }
        searchIngredientsText.text = ""
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        if let searchText = searchIngredientsText.text, !searchTerm.isEmpty {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm.append(contentsOf: searchTerm)
            navigationController?.pushViewController(resultView, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.clearSelection()
            }
        } else {
            let emptySearchAlert = UIAlertController(title: "Please, enter an ingredient!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            emptySearchAlert.addAction(okButton)
            present(emptySearchAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func ingredient1Pressed(_ sender: Any) {
        guard let ingredient1Title = ingredient1.title(for: .normal),
            let index = searchTerm.index(of: ingredient1Title) else {
                return
        }
        
        searchTerm.remove(at: index)
        searchIngredientsText.isEnabled = true
        if !ingredient2.isEnabled{
            ingredient1.setTitle("", for: .normal)
            ingredient1.isHidden = true
            ingredient1.isEnabled = false
            addButton.isHidden = false
        }
        else {
            ingredient1.setTitle(ingredient2.title(for: .normal), for: .normal)
            if !ingredient3.isEnabled {
                ingredient2.setTitle("", for: .normal)
                ingredient2.isEnabled = false
                ingredient2.isHidden = true
                addButton.isHidden = false
            }
            else {
                ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
                ingredient3.setTitle("", for: .normal)
                ingredient3.isEnabled = false
                ingredient3.isHidden = true
                addButton.isHidden = false
            }
        }
    }
    
    @IBAction func ingredient2Pressed(_ sender: Any) {
        guard let ingredient2Title = ingredient2.title(for: .normal),
              let index = searchTerm.index(of: ingredient2Title) else {
                return
        }
        
        searchTerm.remove(at: index)
        searchIngredientsText.isEnabled = true
        if !ingredient3.isEnabled {
            ingredient2.setTitle("", for: .normal)
            ingredient2.isEnabled = false
            ingredient2.isHidden = true
            addButton.isHidden = false
        }
        else {
            ingredient2.setTitle(ingredient3.title(for: .normal), for: .normal)
            ingredient3.setTitle("", for: .normal)
            ingredient3.isEnabled = false
            ingredient3.isHidden = true
            addButton.isHidden = false
        }
    }
    
    @IBAction func ingredient3Pressed(_ sender: Any) {
        guard let ingredient3Title = ingredient3.title(for: .normal),
              let index = searchTerm.index(of: ingredient3Title) else {
            return
        }
        
        searchTerm.remove(at: index)
        searchIngredientsText.isEnabled = true
        ingredient3.setTitle("", for: .normal)
        ingredient3.isEnabled = false
        ingredient3.isHidden = true
        addButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchField()
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(hue: 0.5389, saturation: 0.25, brightness: 0.45, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: searchIngredientsText.frame.size.height - width, width:  searchIngredientsText.frame.size.width, height: searchIngredientsText.frame.size.height)
        
        border.borderWidth = width
        searchIngredientsText.layer.addSublayer(border)
        searchIngredientsText.layer.masksToBounds = true
    }
    
    func clearSelection() {
        ingredient3Pressed(ingredient3)
        ingredient2Pressed(ingredient2)
        ingredient1Pressed(ingredient1)
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
