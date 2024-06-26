
import SwiftUI

struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let reviews: Int
    let specialty: String
}

struct DoctorListView: View {
    let serviceName: String
    @State private var doctors = [
        Doctor(name: "DR. MAYA LELE", reviews: 100, specialty: "Allergist"),
        Doctor(name: "DR. ELIZABETH", reviews: 100, specialty: "Cardiologist"),
        Doctor(name: "DR. RONALD", reviews: 100, specialty: "Dermatologist"),
        Doctor(name: "DR. HARRY", reviews: 100, specialty: "Pediatrician"),
        Doctor(name: "DR. MAYA LELE", reviews: 100, specialty: "Allergist"),
        Doctor(name: "DR. MAYA LELE", reviews: 100, specialty: "Allergist")
    ]
    @State private var selectedDoctor: Doctor?
    @State private var isShowingProfile = false
    @State private var isShowingBooking = false
    
    var body: some View {
        VStack {
            List(doctors) { doctor in
                NavigationLink(destination: DoctorProfileView(doctor: doctor)) {
                    DoctorCellView(doctor: doctor)
                }
            }
            .navigationBarTitle(serviceName, displayMode: .inline)
        }
    }
}

struct DoctorCellView: View {
    let doctor: Doctor
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(doctor.name)
                    .font(.headline)
                Text("\(doctor.reviews) reviews")
                    .font(.subheadline)
                
                HStack {
                    Button(action: {}) {
                        Text("View Profile")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .contentShape(Rectangle()) // Only button is tappable
                }
            }
            Spacer()
            HStack {
                Button(action: {}) {
                    Text("Book")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .contentShape(Rectangle()) // Only button is tappable
            }
        }
        .padding(.vertical, 8)
        .background(Color.clear) // Ensure the rest of the cell is not tappable
    }
}

struct DoctorListView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListView(serviceName: "Sample Service")
    }
}

