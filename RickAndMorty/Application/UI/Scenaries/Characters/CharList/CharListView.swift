//
//  CharListView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class CharListView: BaseCharCollectionVC {
    private var _completion: ((T) -> ())?
    
    init(presenter: Int?) {
        super.init()
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Characters"
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(red: 4/255, green: 10/255, blue: 25/255, alpha: 1)
    }
    
}

//MARK: - coordinator protocol
extension CharListView: ICharView {
    typealias T = Character
    
    public var completion: ((T) -> ())? {
        get {
            return _completion
        }
        set {
            _completion = newValue
        }
    }
}

//MARK: - collection delegate
extension CharListView {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let comp = _completion else {return}
        let char = Character()
        comp(char)
    }
}

