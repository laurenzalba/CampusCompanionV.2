# CampusCompanion - MAD2 Exercises 1 and 2

Open `CampusCompanion.xcodeproj` in Xcode, choose an iPhone Simulator, and press Cmd+R.

Implemented:
- Exercise 1 welcome UI: 28pt bold title, subtitle, 150x150 aspect-fit image view, Auto Layout, IBOutlet.
- Exercise 1 challenge: Get Started button changes subtitle to `Let's get started!`.
- Exercise 2 navigation: UINavigationController, Campus Events detail screen, Show segue `ShowDetailSegue`, Back button.
- Exercise 2 inputs: name text field, notification switch, Student/Faculty segmented control.
- Exercise 2 challenge: preferred event date using UIDatePicker and guest count using UIStepper.
- Detail screen displays name, role, notification status, event date, and guests.
- Empty name defaults to `Student`; guest count defaults to 1.
- Welcome content is in a scroll view so it remains usable on smaller simulator sizes.

If Xcode asks for signing, select your Personal Team under Signing & Capabilities. Simulator builds normally do not require a paid developer account.
