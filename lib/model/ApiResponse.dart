class ApiResponse {
  final dynamic message;
  final dynamic data;
  final dynamic error;
  final dynamic success;
  final dynamic token; // Add token field
  final Map<String, dynamic>? apiResponse; // Add apiResponse key

  ApiResponse({
    required this.message,
    required this.data,
    required this.error,
    required this.success,
    this.token, // Update constructor
    this.apiResponse, // Update constructor
  });

  factory ApiResponse.fromJson(Map<String, dynamic>? json) {
    return ApiResponse(
      message: json?["message"],
      data: json?["data"],
      error: json?["error"],
      success: json?["success"],
      token: json?["token"], // Store token from JSON response
      apiResponse: json, // Store entire JSON response
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data,
      'error': error,
      'success': success,
      'token': token, // Include token key
      'apiResponse': apiResponse, // Include apiResponse key
    };
  }
}
