import 'package:e_commerce_app_project/model/order_items.dart';
import 'package:e_commerce_app_project/model/user.dart';

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

// class Order {
//   final String id;
//   final List<OrderItems> orderItems;
//   final String shippingAdress;
//   final String phone;
//   final String country;
//   final String? paymentId;
//   final Status status;
//   final List<StatusHistory>? statusHistory;
//   //final List<String>? statusHistory;
//   final int? totalPrice;
//   final String user;
//   final DateTime? dateOrdered;
//   final String? postalCode;

//   Order({
//     required this.id,
//     required this.orderItems,
//     required this.shippingAdress,
//     required this.phone,
//     required this.country,
//     this.paymentId,
//     required this.status,
//     this.statusHistory,
//     this.totalPrice,
//     required this.user,
//     this.dateOrdered,
//     this.postalCode,
//   });

// static String statusToString(Status status) {
//   switch (status) {
//     case Status.pending:
//       return 'pending';
//     case Status.processed:
//       return 'processed';
//     case Status.shipped:
//       return 'shipped';
//     case Status.outForDelivery:
//       return 'outForDelivery';
//     case Status.cancelled:
//       return 'cancelled';
//     case Status.onHold:
//       return 'onHold';
//     case Status.expired:
//       return 'expired';
//     default:
//       return 'pending';
//   }
// }

//   static String statusHistoryToString(StatusHistory status) {
//     switch (status) {
//       case StatusHistory.pending:
//         return 'pending';
//       case StatusHistory.processed:
//         return 'processed';
//       case StatusHistory.shipped:
//         return 'shipped';
//       case StatusHistory.outForDelivery:
//         return 'outForDelivery';
//       case StatusHistory.cancelled:
//         return 'cancelled';
//       case StatusHistory.onHold:
//         return 'onHold';
//       case StatusHistory.expired:
//         return 'expired';
//       default:
//         return 'pending';
//     }
//   }

// static Status statusToJson(String status) {
//   switch (status) {
//     case 'pending':
//       return Status.pending;
//     case 'processed':
//       return Status.processed;
//     case 'shipped':
//       return Status.shipped;
//     case 'outForDelivery':
//       return Status.outForDelivery;
//     case 'cancelled':
//       return Status.cancelled;
//     case 'onHold':
//       return Status.onHold;
//     case 'expired':
//       return Status.expired;
//     default:
//       return Status.pending;
//   }
// }

//   static StatusHistory statusHistoryToJson(String status) {
//     switch (status) {
//       case 'pending':
//         return StatusHistory.pending;
//       case 'processed':
//         return StatusHistory.processed;
//       case 'shipped':
//         return StatusHistory.shipped;
//       case 'outForDelivery':
//         return StatusHistory.outForDelivery;
//       case 'cancelled':
//         return StatusHistory.cancelled;
//       case 'onHold':
//         return StatusHistory.onHold;
//       case 'expired':
//         return StatusHistory.expired;
//       default:
//         return StatusHistory.pending;
//     }
//   }

//   factory Order.fromJson(Map<String, dynamic> json) {
//     List<OrderItems> orderItemsList = (json['orderItems'] as List<dynamic>)
//         .map((item) => OrderItems.fromJson(item))
//         .toList();

//     List<StatusHistory>? statusHistoryList =
//         (json['statusHistory'] as List<dynamic>?)
//                 ?.map((status) => statusHistoryToJson(status))
//                 .toList() ??
//             [];
//     return Order(
//       id: json['_id'],
//       orderItems:
//           // json['orderItems'] != null
//           //     ? List<OrderItems>.from(
//           //         json['orderItems'].map((x) => OrderItems.fromJson(x)))
//           //     : []
//           //List<Map<String, dynamic>>.from(json['orderItems'] ?? []),
//           //List<String>.from(json['orderItems'] ?? []),
//           orderItemsList,
//       shippingAdress: json['shippingAdress'],
//       phone: json['phone'],
//       country: json['country'],
//       paymentId: json['paymentId'] ?? '',
//       status: statusToJson(json['status'] ?? 'pending'),
//       statusHistory: statusHistoryList, // fixing
//       //json['statusHistory'] ?? ['pending'],
//       totalPrice: json['totalPrice'],
//       user: json['user'] as String,
//       dateOrdered: json['dateOrdered'] != null
//           ? DateTime.parse(json['dateOrdered'])
//           : null,
//       postalCode: json['postalCode'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     List<Map<String, dynamic>> orderItemsJson =
//         orderItems.map((item) => item.toJson()).toList();
//     List<String>? statusHistoryList = statusHistory
//             ?.map((status) => statusHistoryToString(status))
//             .toList() ??
//         [];
//     return {
//       '_id': id,
//       'orderItems': orderItemsJson,
//       'shippingAdress': shippingAdress,
//       'phone': phone,
//       'country': country,
//       'paymentId': paymentId,
//       'status': statusToString(status),
//       'statusHistory': //(statusHistory),
//           statusHistoryList,
//       //statusHistory != null ? (statusHistory!) : null
//       //,
//       'totalPrice': totalPrice,
//       'user': user,
//       'dateOrdered': dateOrdered?.toIso8601String(),
//       'postalCode': postalCode,
//     };
//   }
// }

class Order {
  final String id;
  final List<OrderItems> orderItems; // Sửa thành List<OrderItem>
  final String shippingAdress;
  final String phone;
  final String country;
  final String? paymentId;
  final Status status;
  final List<StatusHistory>?
      statusHistory; // Cập nhật lại kiểu dữ liệu List<StatusHistory>
  final int? totalPrice;
  final User user;
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

  factory Order.fromJson(Map<String, dynamic> json) {
    // Chuyển orderItems từ mảng ObjectId thành danh sách đối tượng OrderItem

    List<StatusHistory>? statusHistoryList =
        (json['statusHistory'] as List<dynamic>?)
                ?.map((status) => statusHistoryToJson(status))
                .toList() ??
            []; // Giải mã đúng mảng statusHistory

    return Order(
      id: json['_id'],
      //orderItems: List<String>.from(json['orderItems'] ?? []),
      // orderItems: (json['orderItems'] as List<dynamic>?)
      //         ?.map((item) => item is String
      //             ? item
      //             : (item['_id'] ?? '')
      //                 .toString()) // Ensure each item is a String
      //         .where((id) => id.isNotEmpty) // Filter out empty IDs
      //         .toList() ??
      //     [],
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((item) => OrderItems.fromJson(item))
          .toList(),
      shippingAdress: json['shippingAdress'],
      phone: json['phone'],
      country: json['country'],
      paymentId: json['paymentId'] ?? '',
      status: statusToJson(json['status'] ?? 'pending'),
      statusHistory: statusHistoryList,
      totalPrice: json['totalPrice'],
      user: User.fromJson(json['user']),
      dateOrdered: json['dateOrdered'] != null
          ? DateTime.parse(json['dateOrdered'])
          : null,
      postalCode: json['postalCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    // Chuyển orderItems thành mảng các đối tượng JSON

    List<String>? statusHistoryList =
        statusHistory?.map((status) => statusHistoryToString(status)).toList();

    return {
      '_id': id,
      'orderItems': orderItems,
      'shippingAdress': shippingAdress,
      'phone': phone,
      'country': country,
      'paymentId': paymentId,
      'status': statusToString(status),
      'statusHistory': statusHistoryList,
      'totalPrice': totalPrice,
      'user': user.toJson(),
      'dateOrdered': dateOrdered?.toIso8601String(),
      'postalCode': postalCode,
    };
  }
}
