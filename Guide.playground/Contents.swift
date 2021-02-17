import UIKit

//Tuple
     let http404Error = (404, "Not Found")
     let http202Ok = (code:202, description: "Ok")
     //They dont have to be same type
     let (status, _ ) = http202Ok
     //print("\(status)")
     http404Error.0
     http202Ok.code
//Array
     let x = [String]()
     let x1: [String] = []
//Set
     //Cant have same item “A” and “A”
     let y = Set<String> ( [ "A", "B" ] )
     let y1:  Set <String> = []
//Dictionary
     //Key : Value
     var z: [ Int : String ] = [ : ]
     var z1: [ Int : String ] = [ 404 :  "Page Not found" ]
     z [ 200 ] = "OK"
     z1 [ 404 ] = "Error!"
//Enum
    enum someEnum /* :String rawValue must be String */ {
        case North,South
        case Us(String,Int)
    }
    let TH: someEnum
    let usaPostalCode = someEnum.Us("V5K 0A1", 2625)

// MARK: - Go to another view Controller
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let VC = storyboard.instantiateViewController(identifier: "news")
    //    if let unwrappedVC = VC as? *VIEWCONTROLLER* {
    //        unwrappedVC.delegate = self
    //    }
    //    self.navigationController?.pushViewController(VC, animated: true)

// MARK: - Check with guard
    //   guard let fullname = textField.text, textField.hasText else {}

// MARK: - Alert
    //   func alert(title:String, message: String)  {
    //         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    //         alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
    //         self.present(alert, animated: true)
    //   }


// MARK: - UITableViewDelegate -  Edit:Delete on swipe Trailing-Right
    //    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view,handler) in
    //
    //        }
    //        let edit = UIContextualAction(style: .normal, title: "Edit") { (action,view,handler) in
    //
    //        }
    //
    //        let config = UISwipeActionsConfiguration(actions: [delete, edit])
    //        return config
    //    }


// MARK: - UITabBarController From Where to start TabBar
   // self.selectedIndex = 0


// MARK: - Frame,Bounds
   // frame - SuperView,ParentView
   // bounds -  own Coordinate system

//MARK: - ScroolView Keyboard
    //extension *VC* {
    //    @objc func keyboardWillShow(notification: Notification) {
    //        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    //            if self.view.frame.origin.y == 0{
    //                self.view.frame.origin.y -= keyboardSize.height
    //            }
    //        }
    //
    //    }
    //
    //    @objc func keyboardWillHide(notification: Notification) {
    //        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    //            if self.view.frame.origin.y != 0 {
    //                self.view.frame.origin.y += keyboardSize.height
    //            }
    //        }
    //    }
    //
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        self.view.endEditing(true)
    //    }
    //}

    // NotificationCenter.default.addObserver(self, selector: #selector(*VC*.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    // NotificationCenter.default.addObserver(self, selector: #selector(*VC*.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

// MARK: - Core Data
    // App delegate - Before core data stack

    //static var coreDataContainer: NSPersistentContainer {
    //    return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    //}

    //func save(saveWhat: String) {
    //    let context = AppDelegate.coreDataContainer.viewContext
    //    let newData = EntityName(context: context)
    //
    //    newData.attrubure = saveWhat
    //
    //    do {
    //        try context.save()
    //    } catch {}
    // }


    //func fetchData() {
    //     let context = AppDelegate.coreDataContainer.viewContext
    //
    //     let request: NSFetchRequest<EntityName> = EntityName.fetchRequest()
    //
    //     do {
    //         let Data = try context.fetch(request)
    //       } catch {}
    // }

//MARK: - UIImagePicker

    //let imagePicker = UIImagePickerController()
    //
    //@IBAction func AddPhoto(_ sender: Any) {
    //    imagePicker.sourceType = .photoLibrary
    //    imagePicker.delegate = self
    //    imagePicker.allowsEditing = true
    //    self.present(imagePicker, animated: true)
    //}
    //
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //  if let image = info[.editedImage] as? UIImage {
    //      self.photo.image = image
    //  }
    //  self.dismiss(animated: true)
    //}


//MARK: - Get JSON and Parse

//static func get<T: Codable>(url: String, completion: @escaping (T)->Void) {
//
//    guard let url = URL(string: url) else {return}
//    URLSession.shared.dataTask(with: url) { (data, res, err) in
//
//        guard let data = data else {return}
//
//        do {
//            let decoder = JSONDecoder()
//            let decodedData = try decoder.decode(T.self, from: data)
//
//            completion(decodedData)
//        } catch let err {
//            print("failed to decode json \(err)")
//        }
//
//    }.resume()
//}

//enum CodingKeys: String, CodingKey {
//    All case
//    case Title
//    case legalType = "Type"
//
//}



//MARK: - download image


//extension String {
//  func downloadImage(completion: @escaping (UIImage?) -> ()) {
//    guard let url = URL(string: self) else {return}
//    URLSession.shared.dataTask(with: url) { (data, res, err) in
//      guard let data = data else {return}
//      completion(UIImage(data: data))
//    }.resume()
//  }
//}

//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}



//MARK: - show action sheet
//func showAlert(){
//    let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
//
//    let highAction = UIAlertAction(title: "", style: .default) { UIAlertAction in
//
//    }
//
//    let mediumAction = UIAlertAction(title: "", style: .default) { UIAlertAction in
//
//    }
//
//    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//
//    actionSheet.addAction(highAction)
//    actionSheet.addAction(mediumAction)
//    actionSheet.addAction(cancel)
//
//    self.present(actionSheet, animated: true)
//}



//MARK: - Hex Color 
//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}
//
//let gold = UIColor(hex: "#ffe700ff")


