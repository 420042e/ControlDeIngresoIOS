//
//  VisitasController.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/18/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import UIKit

class VisitasController: UIViewController {

    @IBOutlet weak var visitasCV: UICollectionView!
    
    var items : [Visitante] = [
        Visitante(vteCi:"123654", vteCorreo:"", vteImagen:"", vteNombre:"Esteban", vteApellidos:"Choque Villalobos", vteTelefono:"", vteDireccion:"", vteEstado:"", vteLlave:"", vteFecha:"", tipoVisitante: TipoVisitante(tviCod:"", tviNombre:"", tviDescripcion:"", horEstado:""), empresa: Empresa(empCod:"", empNombre:"", empObs:"")),
        Visitante(vteCi:"123655", vteCorreo:"", vteImagen:"", vteNombre:"David", vteApellidos:"Poma", vteTelefono:"", vteDireccion:"", vteEstado:"", vteLlave:"", vteFecha:"", tipoVisitante: TipoVisitante(tviCod:"", tviNombre:"", tviDescripcion:"", horEstado:""), empresa: Empresa(empCod:"", empNombre:"", empObs:"")),
        Visitante(vteCi:"123656", vteCorreo:"", vteImagen:"", vteNombre:"Diego", vteApellidos:"Garrincha", vteTelefono:"", vteDireccion:"", vteEstado:"", vteLlave:"", vteFecha:"", tipoVisitante: TipoVisitante(tviCod:"", tviNombre:"", tviDescripcion:"", horEstado:""), empresa: Empresa(empCod:"", empNombre:"", empObs:"")),
        ]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "VisitantesCell"
    
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
    }
    
    private func setupCollectionView()
    {
        visitasCV.delegate = self
        visitasCV.dataSource = self
        let nib = UINib(nibName: "VisitantesCell", bundle: nil)
        visitasCV.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize()
    {
        if(collectionViewFlowLayout == nil)
        {
            let numberOfItemPerRow:CGFloat = 1
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 5
            
            let width = (visitasCV.frame.width-(numberOfItemPerRow-1)*interItemSpacing)/numberOfItemPerRow
            let height:CGFloat = 100.0
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width:width, height:height)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            visitasCV.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VisitasController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! VisitantesCell
        cell.visitanteNombre.text = items[indexPath.row].vteNombre
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        //performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
        
        //Se obtiene la posicion del item seleccionado
        print("The message is: \(indexPath.item)")
        
    }
}
