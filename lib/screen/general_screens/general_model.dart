class GeneralScreenResponse {
  List<SystemSettings>? systemSettings;

  GeneralScreenResponse({this.systemSettings});

  GeneralScreenResponse.fromJson(Map<String, dynamic> json) {
    if (json['system_settings'] != null) {
      systemSettings = <SystemSettings>[];
      json['system_settings'].forEach((v) {
        systemSettings!.add(new SystemSettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.systemSettings != null) {
      data['system_settings'] =
          this.systemSettings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SystemSettings {
  String? privacyPolicy;
  String? termsConditions;
  String? aboutUs;

  SystemSettings({this.privacyPolicy, this.termsConditions, this.aboutUs});

  SystemSettings.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacy_policy'];
    termsConditions = json['terms_conditions'];
    aboutUs = json['about_us'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy_policy'] = this.privacyPolicy;
    data['terms_conditions'] = this.termsConditions;
    data['about_us'] = this.aboutUs;
    return data;
  }
}