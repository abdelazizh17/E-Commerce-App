class StripeCustomer {
  final String? id;
  final String? name;
  final String? email;
  final String? currency;
  final int? created;
  final String? invoicePrefix;
  final bool? delinquent;

  StripeCustomer({
    this.id,
    this.name,
    this.email,
    this.currency,
    this.created,
    this.invoicePrefix,
    this.delinquent,
  });

  factory StripeCustomer.fromJson(Map<String, dynamic> json) {
    return StripeCustomer(
      id: json['id'] as String, // ← هذا الحقل ضروري
    email: json['email'] as String?,
    name: json['name'] as String?,
      currency: json['currency'],
      created: json['created'],
      invoicePrefix: json['invoice_prefix'],
      delinquent: json['delinquent'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'currency': currency,
      'created': created,
      'invoice_prefix': invoicePrefix,
      'delinquent': delinquent,
    };
  }
}
