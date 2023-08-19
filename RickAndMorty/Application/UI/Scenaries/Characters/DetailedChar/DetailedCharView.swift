//
//  DetailedCharView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

protocol IDetailedCharView: AnyObject {
    func showCharacterInfo(from dataObject: DetailedCharDataObject)
}

class DetailedCharView: BaseDetailedCharCollection, IDetailedCharView {
    
    public var character: Character? = nil {
        didSet {
            presenter.viewDidLoad(with: character!)
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
    }
    
    public func showCharacterInfo(from dataObject: DetailedCharDataObject) {
        self.dataObject = dataObject
        collectionView.reloadData()
    }

}
