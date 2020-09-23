//
//  HorariosController.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/21/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import UIKit

class UsuariosController: UIViewController {
    
    @IBOutlet weak var usuariosCV: UICollectionView!
    
    var items : [Usuario] = [
        Usuario(username:"Usuario1", password:"Empresa 1", email:"", pic:"", fullname:"Esteban Choque Villalobos", occupation:"", phone:"", address:"", state:"", recinto:"", rol:"" ),
        Usuario(username:"Usuario2", password:"Empresa 1", email:"", pic:"", fullname:"Fernando Vasquez Apaza", occupation:"", phone:"", address:"", state:"", recinto:"", rol:"" ),
        Usuario(username:"Usuario3", password:"Empresa 1", email:"", pic:"", fullname:"Diego Garrincha Fernandez", occupation:"", phone:"", address:"", state:"", recinto:"", rol:"" ),
        Usuario(username:"Usuario4", password:"Empresa 1", email:"", pic:"", fullname:"Julio Sanchez", occupation:"", phone:"", address:"", state:"", recinto:"", rol:"" ),
        ]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "UsuariosCell"
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func setupCollectionView()
    {
        usuariosCV.delegate = self
        usuariosCV.dataSource = self
        let nib = UINib(nibName: "UsuariosCell", bundle: nil)
        usuariosCV.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize()
    {
        if(collectionViewFlowLayout == nil)
        {
            let numberOfItemPerRow:CGFloat = 1
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 5
            
            let width = (usuariosCV.frame.width-(numberOfItemPerRow-1)*interItemSpacing)/numberOfItemPerRow
            let height:CGFloat = 100.0
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width:width, height:height)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            usuariosCV.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    func listarVisitantes() {
        // Set up the URL request
        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                // now we have the todo
                // let's just print it to prove we can access it
                print("The todo is: " + todo.description)
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let todoTitle = todo["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
}

extension UsuariosController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! UsuariosCell
        cell.fullname.text = items[indexPath.row].fullname
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        //performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
        
        //Se obtiene la posicion del item seleccionado
        print("The message is: \(indexPath.item)")
        
    }
    
}


