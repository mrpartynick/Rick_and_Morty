//
//  CharListView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

//MARK: - View Protocol
protocol ICharListView: AnyObject {
    func showCharacters(from dataObject: ICharDataObject)
}

class CharListView: BaseCharListCollection {
    private var _completion: ((T) -> ())?
    private var presenter: ICharListViewOutput
    
    //MARK: - init
    init(presenter: ICharListViewOutput) {
        self.presenter = presenter
        super.init()
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Characters"
        navigationItem.backButtonTitle = ""
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = R.Colors.baseBackground
        presenter.viewDidLoad()
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
        guard let comp = _completion, let character = dataObject?.getChar(by: indexPath.row) else {return}
        comp(character)
    }
}

extension CharListView: ICharListView {
    public func showCharacters(from dataObject: ICharDataObject) {
        self.dataObject = dataObject
        state = .Showing
    }
}

