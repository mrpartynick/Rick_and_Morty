//
//  DetailedCharView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

protocol IDetailedCharView: AnyObject {
    
}

class DetailedCharView: BaseDetailedCharCollection, IDetailedCharView {
    
    public var character: Character? {
        get {
            return dataObject.character
        }
        
        set {
            dataObject.character = newValue
        }
    }
    
    public var presenter: IDetailedCharViewOutput
    
    init(presenter: IDetailedCharViewOutput) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = R.Colors.baseBackground
        presenter.viewDidLoad()
    }
}
