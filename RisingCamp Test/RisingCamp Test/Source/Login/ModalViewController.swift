//
//  CustomModalViewController.swift
//  HalfScreenPresentation
//
//  Created by Hafiz on 06/06/2021.
//

import UIKit

class ModalViewController: UIViewController {
    // define lazy views
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 방법으로 로그인"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var faceBookLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("페이스북으로 시작하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var naverLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("네이버로 시작하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var myInfoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("본인 인증으로 시작하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
//    lazy var faceBookImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "페이스북")
//        imageView.draw(CGRect(x: 0, y: 0, width: 20.0, height: 20.0))
//         return imageView
//    }()
//
//    lazy var naverImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "네이버")
//        imageView.draw(CGRect(x: 0, y: 0, width: 20.0, height: 20.0))
//         return imageView
//    }()
//
//    lazy var selfAuthImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "본인인증")
//        imageView.draw(CGRect(x: 0, y: 0, width: 20.0, height: 20.0))
//         return imageView
//    }()
    
    lazy var contentStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, spacer])
        stackView.axis = .vertical
        stackView.spacing = 20.0
        return stackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [faceBookLoginButton, naverLoginButton, myInfoLoginButton, spacer])
        stackView.axis = .vertical
        stackView.spacing = 20.0
        return stackView
    }()
    
//    lazy var imageStackView: UIStackView = {
//        let spacer = UIView()
//        let stackView = UIStackView(arrangedSubviews: [faceBookImage, naverImage, selfAuthImage,])
//        stackView.axis = .vertical
//        stackView.spacing = 20.0
//        return stackView
//    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    // Constants
    let defaultHeight: CGFloat = 300
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep current new height, initial is default height
    var currentContainerHeight: CGFloat = 300
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        // tap gesture on dimmed view to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
        
//        setupPanGesture()
        
        myInfoLoginButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    @objc func presentModalController() {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyInfoLoginViewController")
//                as? MyInfoLoginViewController else { print("test"); return }
//            self.present(nextVC, animated: true, completion: nil)
        
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = storyboard.instantiateViewController(identifier: "MyInfoLoginViewController")
                mainViewController.modalPresentationStyle = .fullScreen
                self.present(mainViewController, animated: true, completion: nil)
        
        
//                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//                let mainViewController = storyboard.instantiateViewController(identifier: "MyInfoLoginViewController")
//                mainViewController.modalPresentationStyle = .fullScreen
//                self.navigationController?.show(mainViewController, sender: nil)
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        // Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(buttonStackView)
//        containerView.addSubview(imageStackView)

        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
//        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // content stackView
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            // button stackVeiw
            buttonStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 110),
            buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -50),
            buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            // image stackVeiw
//            imageStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
//            imageStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
//            imageStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
//            imageStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
//
        ])
        
        // Set dynamic constraints
        // First, set container to default height
        // after panning, the height can expand
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        
        // By setting the height to default height, the container will be hide below the bottom anchor view
        // Later, will bring it up by set it to 0
        // set the constant to default height to bring it down again
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    
    // MARK: Present and dismiss animation
    func animatePresentContainer() {
        // update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
        // hide main view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
}
