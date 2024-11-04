enum Status {
  pending,
  processed,
  shipped,
  outForDelivery,
  cancelled,
  onHold,
  expired,
}

enum StatusHistory {
  pending,
  processed,
  shipped,
  outForDelivery,
  cancelled,
  onHold,
  expired,
}

class Order {
  final String id;
  final List<dynamic> orderItems;
  final String shippingAdress;
  final String phone;
  final String country;
  final String? paymentId;
  final Status status;
  final StatusHistory? statusHistory;
  final double? totalPrice;
  final String user;
  final DateTime? dateOrdered;
  final String? postalCode;

  Order({
    required this.id,
    required this.orderItems,
    required this.shippingAdress,
    required this.phone,
    required this.country,
    this.paymentId,
    required this.status,
    this.statusHistory,
    this.totalPrice,
    required this.user,
    this.dateOrdered,
    this.postalCode,
  });

  static String statusToString(Status status) {
    switch (status) {
      case Status.pending:
        return 'pending';
      case Status.processed:
        return 'processed';
      case Status.shipped:
        return 'shipped';
      case Status.outForDelivery:
        return 'outForDelivery';
      case Status.cancelled:
        return 'cancelled';
      case Status.onHold:
        return 'onHold';
      case Status.expired:
        return 'expired';
      default:
        return 'pending';
    }
  }

  static String statusHistoryToString(StatusHistory status) {
    switch (status) {
      case StatusHistory.pending:
        return 'pending';
      case StatusHistory.processed:
        return 'processed';
      case StatusHistory.shipped:
        return 'shipped';
      case StatusHistory.outForDelivery:
        return 'outForDelivery';
      case StatusHistory.cancelled:
        return 'cancelled';
      case StatusHistory.onHold:
        return 'onHold';
      case StatusHistory.expired:
        return 'expired';
      default:
        return 'pending';
    }
  }

  static Status statusToJson(String status) {
    switch (status) {
      case 'pending':
        return Status.pending;
      case 'processed':
        return Status.processed;
      case 'shipped':
        return Status.shipped;
      case 'outForDelivery':
        return Status.outForDelivery;
      case 'cancelled':
        return Status.cancelled;
      case 'onHold':
        return Status.onHold;
      case 'expired':
        return Status.expired;
      default:
        return Status.pending;
    }
  }

  static StatusHistory statusHistoryToJson(String status) {
    switch (status) {
      case 'pending':
        return StatusHistory.pending;
      case 'processed':
        return StatusHistory.processed;
      case 'shipped':
        return StatusHistory.shipped;
      case 'outForDelivery':
        return StatusHistory.outForDelivery;
      case 'cancelled':
        return StatusHistory.cancelled;
      case 'onHold':
        return StatusHistory.onHold;
      case 'expired':
        return StatusHistory.expired;
      default:
        return StatusHistory.pending;
    }
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      orderItems: json['orderItems'] ?? '',
      shippingAdress: json['shippingAdress'],
      phone: json['phone'],
      country: json['country'],
      paymentId: json['paymentId'] ?? '',
      status: statusToJson(json['status'] ?? 'pending'),
      statusHistory: statusHistoryToJson(json['statusHistory'] ?? 'pending'),
      totalPrice: json['totalPrice'],
      user: json['user'],
      dateOrdered: json['dateOrdered'] != null
          ? DateTime.parse(json['dateOrdered'])
          : null,
      postalCode: json['postalCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'orderItems': orderItems,
      'shippingAdress': shippingAdress,
      'phone': phone,
      'country': country,
      'paymentId': paymentId,
      'status': statusToString(status),
      'statusHistory':
          statusHistory != null ? statusHistoryToString(statusHistory!) : null,
      'totalPrice': totalPrice,
      'user': user,
      'dateOrdered': dateOrdered?.toIso8601String(),
      'postalCode': postalCode,
    };
  }
}
