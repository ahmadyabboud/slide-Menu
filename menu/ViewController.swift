
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var slideView = UIView()
    let tableView:UITableView = {
        let table = UITableView()
        return table
    }()
    let menuLable = ["Profile","Settings","Help","SignOut"]
    
    
    @IBAction func menuButtonn(_ sender: Any) {
        
        //Show the menu
        UIView.animate(withDuration: 0.5) {
            self.slideView.addSubview(self.tableView)
            self.slideView.frame.size.width = 250
            self.tableView.frame.size.width = 250
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slideView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height)
        slideView.backgroundColor = UIColor.darkGray
        self.view.addSubview(slideView)
        self.tableView.frame = CGRect(x: 0, y: 88 , width: 0 , height: 100 * menuLable.count)
        tableView.backgroundColor = UIColor.darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch =  touches.first{
            //Hide the menu
           if touch.view == self.view
           {
            UIView.animate(withDuration: 0.5) {
                self.slideView.frame.size.width = 0
                self.tableView.frame.size.width = 0
                self.tableView.removeFromSuperview()
            
            }
            }
        }
        super.touchesBegan(touches, with: event)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuLable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuLable[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select \(menuLable[indexPath.row]) from menu")
    }
}

