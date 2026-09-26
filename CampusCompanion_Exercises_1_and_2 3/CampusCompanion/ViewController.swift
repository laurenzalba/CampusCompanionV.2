import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var campusImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var notifySwitch: UISwitch!
    @IBOutlet private weak var roleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var eventDatePicker: UIDatePicker!
    @IBOutlet private weak var guestStepper: UIStepper!
    @IBOutlet private weak var guestCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campus Companion"
        titleLabel.text = "Campus Companion"
        campusImageView.image = UIImage(systemName: "graduationcap.fill")
        campusImageView.tintColor = .systemGreen
        guestStepper.minimumValue = 1
        guestStepper.maximumValue = 10
        guestStepper.stepValue = 1
        if guestStepper.value < 1 { guestStepper.value = 1 }
        updateGuestCount()
    }

    @IBAction private func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's get started!"
    }

    @IBAction private func guestStepperChanged(_ sender: UIStepper) {
        updateGuestCount()
    }

    @IBAction private func exploreButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }

    private func updateGuestCount() {
        guestCountLabel.text = "Guests: \(Int(guestStepper.value))"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue",
              let destination = segue.destination as? DetailViewController else { return }

        let enteredName = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        destination.studentName = enteredName.isEmpty ? "Student" : enteredName
        destination.notificationsEnabled = notifySwitch.isOn
        destination.selectedRole = roleSegmentedControl.selectedSegmentIndex == 0 ? "Student" : "Faculty"
        destination.preferredEventDate = eventDatePicker.date
        destination.numberOfGuests = max(1, Int(guestStepper.value))
    }
}
