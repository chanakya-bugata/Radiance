import UIKit

class HistoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
    }
    
    func createCalendar() {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        calendarView.layer.cornerRadius = 10
        
        let selection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = selection
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            calendarView.heightAnchor.constraint(equalToConstant: 400),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension HistoryViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        // Check if the date is selected
        guard let selectedDate = (calendarView.selectionBehavior as? UICalendarSelectionSingleDate)?.selectedDate,
              selectedDate == dateComponents else {
            return nil // No decoration for unselected dates
        }
        
        // Return a custom decoration for the selected date
        return .customView {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            view.backgroundColor = UIColor(hex: "FDF1F0") // Light pastel red background
            view.layer.cornerRadius = 20 // Circular shape
            
            let label = UILabel(frame: view.bounds)
            label.textAlignment = .center
            label.textColor = UIColor(hex: "F28D86") // Muted red text color
            label.text = "\(dateComponents.day!)"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            
            view.addSubview(label)
            return view
        }
    }
}

extension HistoryViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents else { return }
        print("Date Selected: \(dateComponents)")
        
        if let completeVC = storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController {
            if let date = Calendar.current.date(from: dateComponents) {
                completeVC.selectedDate = date
            }
            navigationController?.pushViewController(completeVC, animated: true)
        }
    }
}

// UIColor helper extension
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

