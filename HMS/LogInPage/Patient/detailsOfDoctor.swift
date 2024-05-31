import SwiftUI

struct DoctorProfileView: View {
    let doctor: Doctor

    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(doctor.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(doctor.specialty)
                            .font(.title2)
                            .foregroundColor(.gray)
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("Call")
                        }
                    }
                    Spacer()
                }
                .padding()
                
                HStack {
                    ProfileDetail(title: "Patient", value: "300+")
                    ProfileDetail(title: "Experience", value: "4 years")
                    ProfileDetail(title: "Reviews", value: "160+")
                    ProfileDetail(title: "Age", value: "35")
                }
                .padding(.horizontal)
                
                Text("About")
                    .font(.headline)
                    .padding(.horizontal)
                Text("Dr. John Doe is a board-certified cardiologist with over 15 years of experience. He is dedicated to providing compassionate and comprehensive cardiac care...")
                    .padding(.horizontal)
                
                Text("Reviews")
                    .font(.headline)
                    .padding([.top, .horizontal])
                HStack {
                    Text("Allison Torwart")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Spacer()
                    Text("19 May, 2024")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                Text("Dr. Doe was thorough and caring. He took the time to explain my condition and treatment options in detail.")
                    .padding(.horizontal)
                
                Spacer()
                NavigationLink(destination: ConsultationOptionsView(doctor: doctor)) {
                    Text("Book an appointment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Book your appointment")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden()
    }
}

struct ProfileDetail: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
    }
}

struct DoctorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProfileView(doctor: Doctor(name: "DR. MAYA LELE", reviews: 160, specialty: "Allergist"))
    }
}
