class SettingModel {
  final String siteMaintenanceMsg;
  final String cr;
  final String vat;
  final String maintenanceMode;
  final String instagram;
  final String tiktok;
  final String mobile;
  final String infoEmail;
  final String siteNameEn;
  final String siteName;
  final String siteLogo;
  final String taxAddedValue;

  SettingModel({
    required this.siteMaintenanceMsg,
    required this.cr,
    required this.vat,
    required this.maintenanceMode,
    required this.instagram,
    required this.tiktok,
    required this.mobile,
    required this.infoEmail,
    required this.siteNameEn,
    required this.siteName,
    required this.siteLogo,
    required this.taxAddedValue,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        siteMaintenanceMsg: json["siteMaintenanceMsg"] ?? '',
        cr: json["cr"] ?? '',
        vat: json["vat"] ?? '',
        maintenanceMode: json["maintenance_mode"] ?? '',
        instagram: json["instagram"] ?? '',
        tiktok: json["tiktok"] ?? '',
        mobile: json["mobile"] ?? '',
        infoEmail: json["info_email"] ?? '',
        siteNameEn: json["site_name_en"] ?? '',
        siteName: json["site_name"] ?? '',
        siteLogo: json["site_logo"] ?? '',
        taxAddedValue: json["tax_added_value"] ?? '',
      );
}
