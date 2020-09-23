//
//  HomeController.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/14/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import UIKit

struct Item {
    var nombre : String
    var imageName : String
}

class HomeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //var items = ["First Cell", "Second Cell", "Third Cell", "Cuarta Celda", "Quinta Celda"]
    
    var items : [Item] = [
        Item(nombre:"Escanear QR", imageName:"icono_scan_qr"),
        Item(nombre:"Buscar CI", imageName:"icono_carnet"),
        Item(nombre:"VISITAS", imageName:"icono_visita"),
        Item(nombre:"VISITANTES", imageName:"icono_visitantes"),
        Item(nombre:"HORARIOS", imageName:"icono_horario"),
        Item(nombre:"EMPRESAS", imageName:"icono_empresa"),
        Item(nombre:"USUARIOS", imageName:"icono_usuarios")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "CollectionViewCell"
    //let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    let buscarXQRSegue = "buscarXQRSegue"
    let buscarXCISegue = "buscarXCISegue"
    let visitasSegue = "visitasSegue"
    let visitantesSegue = "visitantesSegue"
    let horariosSegue = "horariosSegue"
    let empresasSegue = "empresasSegue"
    let usuariosSegue = "usuariosSegue"
    
    var whosLogin : String!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupCollectionView()
        //Barra de navegacion
        //edgesForExtendedLayout = []
        //setUpNavBar()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        /*if segue.identifier == buscarXQRSegue
        {
            if let vc = segue.destination as? PruebaController {
                
            }
        }*/
    }
    
    private func setupCollectionView()
    {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize()
    {
        if(collectionViewFlowLayout == nil)
        {
            let numberOfItemPerRow:CGFloat = 2
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 5
            
            let width = (collectionView.frame.width-(numberOfItemPerRow-1)*interItemSpacing)/numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width:width, height:height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    func setUpNavBar(){
        //For title in navigation bar
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.orange
        self.navigationItem.title = "About Us"
        
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

extension HomeController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.proLbl.text = items[indexPath.row].nombre
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        //performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
        
        //Se obtiene la posicion del item seleccionado
        //print("The message is: \(indexPath.item)")
        
        if(indexPath.item == 0)
        {
            performSegue(withIdentifier: buscarXQRSegue, sender: item)
        }
        else if(indexPath.item == 1)
        {
            performSegue(withIdentifier: buscarXCISegue, sender: item)
        }
        else if(indexPath.item == 2)
        {
            performSegue(withIdentifier: visitasSegue, sender: item)
        }
        else if(indexPath.item == 3)
        {
            performSegue(withIdentifier: visitantesSegue, sender: item)
        }
        else if(indexPath.item == 4)
        {
            performSegue(withIdentifier: horariosSegue, sender: item)
        }
        else if(indexPath.item == 5)
        {
            performSegue(withIdentifier: empresasSegue, sender: item)
        }
        else if(indexPath.item == 6)
        {
            performSegue(withIdentifier: usuariosSegue, sender: item)
        }
    }
    
}

