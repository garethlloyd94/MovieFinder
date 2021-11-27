//
//  BaseMVVMViewController.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit

class BaseMVVMViewController<ViewModel: ViewModelProtocol>: BaseViewController {
    
    let viewModel: ViewModel
    
    // MARK: - Initialisation
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }
    
    // MARK: - Binding
    
    func bind() {
        self.viewModel.update = { [weak self] type in
            DispatchQueue.main.async {
                self?.updateView(type)
            }
        }
        self.viewModel.error = { [weak self] error in
            DispatchQueue.main.async {
                self?.handle(error)
            }
        }
        self.viewModel.base = { [weak self] type in
            DispatchQueue.main.async {
                self?.base(type)
            }
        }
    }
    
    // MARK: - Base Updates
    
    func base(_ type: BaseViewModel.BaseType) {
        switch type {
        case .beginLoading:
            self.showPleaseWait()
        case .endLoading:
            self.hidePleaseWait()
        }
    }
    
    // MARK: - View Update
    
    func updateView(_ type: ViewModel.UpdateType) { assertionFailure("updates are not being handled") }
    
    // MARK: - Error Handling
    
    func handle(_ error: ViewModel.ErrorType) { assertionFailure("errors are not being handled") }
}
