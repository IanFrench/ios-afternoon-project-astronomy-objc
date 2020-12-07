//
//  PhotoDetailViewController.swift
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {


    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoDetailsLabel: UILabel!
    @IBOutlet weak var cameraIDLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!


    var photo: Photo?

    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        activityIndicatorView.startAnimating()
        guard let photo = photo,
              let imageData = try? Data(contentsOf: photo.imgURL) else { return }

        photoImageView.image = UIImage(data: imageData)
        photoDetailsLabel.text = "Taken by rover # \(photo.rover.id) on \(dateFormatter.string(from: photo.earthDate)) (Sol: \(photo.sol))"
        cameraIDLabel.text = "Camera: \(photo.camera)"
        activityIndicatorView.stopAnimating()
    }

    @IBAction func savePhotoButtonTapped(_ sender: Any) {
        guard let image = photoImageView.image else { return }

        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else { return }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }) { (success, error) in
                if let error = error {
                    print("Error saving photo: \(error)")
                    return
                }
                DispatchQueue.main.async {
                    print("Photo has been saved.")
                }
            }
        }
    }
}
