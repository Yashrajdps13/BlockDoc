class User {
  final id;
  final String patientName;
  final String doctorName;
  final String patientEmail;

  User({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.patientEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patient_name': patientName,
      'doctor_name': doctorName,
      'patient_email': patientEmail,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      patientName: map['patient_name'],
      doctorName: map['doctor_name'],
      patientEmail: map['patient_email'],
    );
  }
}
