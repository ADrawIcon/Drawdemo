
import UIKit

class InfoViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button1 = UIButton()
        button1.backgroundColor = UIColor.greenColor()
        button1.frame = CGRectMake(50, 120, 100, 50)
        button1.addTarget(self, action: "action", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        
    }
    
    func action(){
        self.view.backgroundColor = UIColor.lightGrayColor()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}







