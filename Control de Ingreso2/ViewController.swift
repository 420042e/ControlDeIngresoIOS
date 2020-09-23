//
//  ViewController.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/14/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usuarioField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet var _login_button: UIButton!
    var whosLogin : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton.init(type: .roundedRect)
        button.frame = CGRect(x:100.0, y:400.0, width:200.0, height:50.0)
        button.setTitle("INGRESAR", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        self.view.addSubview(button)
        
        let myColor : UIColor = UIColor.black
        usuarioField.layer.borderColor = myColor.cgColor
        usuarioField.layer.borderWidth = 1.0
        passField.layer.borderColor = myColor.cgColor
        passField.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var credentials: String {
        //return "\(ingresoVisitantes):\(albosalpz01codex)"
        return "ingresoVisitantes:albosalpz01codex"    }
    
    private var basicAuthHeader: String
    {
        return "Basic \(credentials)"
    }
    
    func makePostCall(user : String, pass : String) {
        /*let user : String
        let pass : String
        user = usuarioField.text!
        pass = passField.text!*/
        let todosEndpoint: String = "http://190.129.90.115:8083/ingresoVisitantes/oauth/token"
        let loginString = String(format: "%@:%@", "ingresoVisitantes", "albosalpz01codex")
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        guard let todosURL = URL(string: todosEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        todosUrlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        todosUrlRequest.setValue("PostmanRunTime/7.26.3", forHTTPHeaderField: "User-Agent")
        todosUrlRequest.httpMethod = "POST"
        let data : Data = "username=\(user)&password=\(pass)&grant_type=password".data(using: .utf8)!
        todosUrlRequest.httpBody = data
        let session = URLSession.shared
        let task = session.dataTask(with: todosUrlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /todos/1")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    print("Could not get JSON from responseData as dictionary")
                    return
                }
                print("The access_token is: " + receivedTodo.description)
                
                guard let todoID = receivedTodo["access_token"] as? String else {
                    print("Could not get todoID as int from JSON")
                    return
                }
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier:"homeSegue",sender:self);
                }
                print("The message is: \(todoID)")
            } catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! HomeController
        nextViewController.whosLogin = usuarioField.text!
    }
    
    @objc func buttonClicked(_ : UIButton)
    {
        let user : String
        let pass : String
        user = usuarioField.text!
        pass = passField.text!
        if(!user.isEmpty && !pass.isEmpty)
        {
            //makePostCall(user:user, pass:pass)
            self.performSegue(withIdentifier: "homeSegue", sender: nil)
            
        }
        else
        {
            print("Todos los campos son necesarios")
        }
        //makePostCall()
    }
    
}








