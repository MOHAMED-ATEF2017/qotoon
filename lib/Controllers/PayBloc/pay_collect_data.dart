class PayCollectData {
  String? apartmentId, checkInDate, checkOutDate, paymentMethod;
  PayCollectData(
      {this.apartmentId,
      this.checkInDate,
      this.checkOutDate,
      this.paymentMethod});
  Map<String, dynamic> toJson() => {
    "apartment_list":apartmentId,
    "check_in_date":checkInDate,
    "check_out_date":checkOutDate,
    "payment_method":'fatoorah',
  };
}
