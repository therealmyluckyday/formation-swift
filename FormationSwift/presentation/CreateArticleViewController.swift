//
//  CreateArticleViewController.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit
import Photos

class CreateArticleViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var subtitleField: UITextField!
    @IBOutlet weak var contentView: UITextView!
    
    private lazy var accessoryView: UIView = {
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard(_:)))
        
        let prev = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(previousField(_:)))
        let next = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(nextField(_:)))
        
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.items = [prev, next, space, done]
        
        return toolbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.inputAccessoryView = accessoryView
        subtitleField.inputAccessoryView = accessoryView
        contentView.inputAccessoryView = accessoryView
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    private func queryPhotos() {
        PHPhotoLibrary.requestAuthorization() { [weak self] status in
            switch status {
            case .authorized:
                self?.accessPhotos()
            default:
                break
            }
        }
    }
    
    private func accessPhotos() {
        let allPhotosOpts = PHFetchOptions()
        allPhotosOpts.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        let allPhotos = PHAsset.fetchAssets(with: allPhotosOpts)
        debugPrint(allPhotos)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let animDur: TimeInterval = (userInfo[UIWindow.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let endFrame = (userInfo[UIWindow.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: animDur) { [weak self] in
            self?.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: endFrame.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let animDur: TimeInterval = (userInfo[UIWindow.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: animDur) { [weak self] in
            self?.scrollView.contentInset = UIEdgeInsets.zero
        }
    }

    @IBAction func clickedCreate(_ sender: Any) {
        
//        queryPhotos(); return
        
        let params = CreateArticleParams(
            title: titleField.text,
            subtitle: subtitleField.text,
            content: contentView.text
        )
        
        AppDelegate.apiProvider.request(.createNews(params: params)) { [weak self] result in
            switch result {
            case let .failure(error):
                debugPrint(error.localizedDescription)
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let article = try filteredResponse.map(Article.self, atKeyPath: "news")
                    
                    let title = NSLocalizedString("Success", comment: "Create article success alert title")
                    let messageFormat = NSLocalizedString("successfully created article: %@", comment: "Create article success alert message")
                    let message = String(format: messageFormat, article.title)
                    
                    self?.showInfoAlert(title: title, message: message) { [weak self] _ in
                        self?.clearFields()
                    }
                } catch let error {
                    let title = NSLocalizedString("Error", comment: "Create article failure alert title")
                    self?.showInfoAlert(title: title, message: error.localizedDescription)
                }
            }
        }
    }
    
    @objc private func dismissKeyboard(_ sender: Any?) {
        view.endEditing(true)
    }
    
    @objc private func previousField(_ sender: Any?) {
        UIResponder.currentFirstResponder?.previousFormItem?.becomeFirstResponder()
    }
    
    @objc private func nextField(_ sender: Any?) {
        UIResponder.currentFirstResponder?.nextFormItem?.becomeFirstResponder()
    }
    
    private func clearFields() {
        titleField.text = nil
        subtitleField.text = nil
        contentView.text = nil
    }
    
    private func showInfoAlert(title: String?, message: String?, handler: ((UIAlertAction)->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(ok)
        show(alertController, sender: nil)
    }
}
