class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String? phone;
  final String role; // e.g., admin, editor, writer, reader
  final String status; // active, suspended, pending_approval
  final String? profilePicture;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final bool isEmailVerified;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    required this.role,
    required this.status,
    this.profilePicture,
    required this.createdAt,
    this.lastLogin,
    required this.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      role: json['role'] ?? 'reader',
      status: json['status'] ?? 'pending_approval',
      profilePicture: json['profilePicture'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLogin:
          json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      isEmailVerified: json['isEmailVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role,
      'status': status,
      'profilePicture': profilePicture,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'isEmailVerified': isEmailVerified,
    };
  }
}

class UserData {
  static List<UserModel> dummyContentList = [
    UserModel(
      id: '1',
      fullName: 'Ravi Kumar',
      email: 'ravi.kumar@newscms.in',
      phone: '+91-9876543210',
      role: 'admin',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2023-10-01T10:30:00Z'),
      lastLogin: DateTime.parse('2025-05-10T08:45:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '2',
      fullName: 'Sneha Roy',
      email: 'sneha.roy@newscms.in',
      phone: '+91-9123456789',
      role: 'editor',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2023-11-15T09:00:00Z'),
      lastLogin: DateTime.parse('2025-05-09T16:20:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '3',
      fullName: 'Amit Verma',
      email: 'amit.verma@newscms.in',
      phone: '+91-9988776655',
      role: 'writer',
      status: 'pending_approval',
      profilePicture: null,
      createdAt: DateTime.parse('2024-01-05T14:15:00Z'),
      lastLogin: null,
      isEmailVerified: false,
    ),
    UserModel(
      id: '4',
      fullName: 'Priya Sharma',
      email: 'priya.sharma@newscms.in',
      phone: '+91-9812345678',
      role: 'reader',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2024-06-10T11:45:00Z'),
      lastLogin: DateTime.parse('2025-05-08T10:10:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '5',
      fullName: 'Arjun Mehta',
      email: 'arjun.mehta@newscms.in',
      phone: '+91-9090909090',
      role: 'writer',
      status: 'suspended',
      profilePicture: null,
      createdAt: DateTime.parse('2024-03-22T12:00:00Z'),
      lastLogin: DateTime.parse('2025-03-15T07:30:00Z'),
      isEmailVerified: false,
    ),
    UserModel(
      id: '6',
      fullName: 'Divya Nair',
      email: 'divya.nair@newscms.in',
      phone: '+91-9000011111',
      role: 'editor',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2024-04-10T09:30:00Z'),
      lastLogin: DateTime.parse('2025-05-10T11:10:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '7',
      fullName: 'Karan Singh',
      email: 'karan.singh@newscms.in',
      phone: '+91-8888777766',
      role: 'reader',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2024-07-19T08:15:00Z'),
      lastLogin: DateTime.parse('2025-05-10T07:00:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '8',
      fullName: 'Megha Joshi',
      email: 'megha.joshi@newscms.in',
      phone: '+91-7777666655',
      role: 'writer',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2024-08-25T17:45:00Z'),
      lastLogin: DateTime.parse('2025-05-09T18:25:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '9',
      fullName: 'Nikhil Bansal',
      email: 'nikhil.bansal@newscms.in',
      phone: '+91-7666555544',
      role: 'admin',
      status: 'active',
      profilePicture: null,
      createdAt: DateTime.parse('2023-12-12T13:00:00Z'),
      lastLogin: DateTime.parse('2025-05-10T09:55:00Z'),
      isEmailVerified: true,
    ),
    UserModel(
      id: '10',
      fullName: 'Isha Kapoor',
      email: 'isha.kapoor@newscms.in',
      phone: '+91-7555444433',
      role: 'reader',
      status: 'pending_approval',
      profilePicture: null,
      createdAt: DateTime.parse('2024-09-01T15:10:00Z'),
      lastLogin: null,
      isEmailVerified: false,
    ),
  ];
}
