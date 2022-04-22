//
//  PhotoVerificationViewController.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/19/22.
//

import UIKit
import AlamofireImage
import Parse

class PhotoVerificationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    // access to camera
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    //user can pick the image for profile
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 128, height: 128)
        let scaledImage = image.af.imageScaled(to: size)
        
        profileImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
        

    }
    
    //images need to be saved in files
    

    @IBAction func onNextButton(_ sender: Any) {
        
        let imageData = profileImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        PFUser.current()?["profilepic"] = file
        
        PFUser.current()?
            .saveInBackground { success, error in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Error: \(String(describing: error))")
            }
        }

        
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
