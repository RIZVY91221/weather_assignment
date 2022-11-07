/*class OrderModel {
  List<Data>? data;

  OrderModel({this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/

class OrderModel {
  Order? order;
  FulfilmentOrder? fulfilmentOrder;
  List<Fulfilments>? fulfilments;
  //Additional? additional;

  OrderModel({this.order, /*this.fulfilmentOrder, this.fulfilments, this.additional*/});

  OrderModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    fulfilmentOrder = json['fulfilment_order'] != null
        ? new FulfilmentOrder.fromJson(json['fulfilment_order'])
        : null;
    /*if (json['fulfilments'] != null) {
      fulfilments = <Fulfilments>[];
      json['fulfilments'].forEach((v) {
        fulfilments!.add(new Fulfilments.fromJson(v));
      });
    }
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.fulfilmentOrder != null) {
      data['fulfilment_order'] = this.fulfilmentOrder!.toJson();
    }
  /*  if (this.fulfilments != null) {
      data['fulfilments'] = this.fulfilments!.map((v) => v.toJson()).toList();
    }
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }*/
    return data;
  }
}

class Order {
  int? orderId;
  String? orderNo;
  String? orderCurrency;
  List<String>? orderStatuses;
  String? paymentStatus;
  String? remarks;
  var subtotal;
  var tax;
  var total;
  var discount;
  var shippingFee;
  var totalWeight;
  String? totalWeightUom;
  String? createdAt;
  String? updatedAt;
  bool? isCancelled;
  String? cancellationReason;
  String? cancellationAt;
  Customer? customer;
  ShippingAddress? shippingAddress;
  List<LineItems>? lineItems;
  Additional? additional;

  Order(
      {this.orderId,
        this.orderNo,
        this.orderCurrency,
        this.orderStatuses,
        this.paymentStatus,
        this.remarks,
        this.subtotal,
        this.tax,
        this.total,
        this.discount,
        this.shippingFee,
        this.totalWeight,
        this.totalWeightUom,
        this.createdAt,
        this.updatedAt,
        this.isCancelled,
        this.cancellationReason,
        this.cancellationAt,
        this.customer,
        this.shippingAddress,
        this.lineItems,
        this.additional});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderNo = json['order_no'];
    orderCurrency = json['order_currency'];
    orderStatuses = json['order_statuses'].cast<String>();
    paymentStatus = json['payment_status'];
    remarks = json['remarks'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    total = json['total'];
    discount = json['discount'];
    shippingFee = json['shipping_fee'];
    totalWeight = json['total_weight'];
    totalWeightUom = json['total_weight_uom'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isCancelled = json['is_cancelled'];
    cancellationReason = json['cancellation_reason'];
    cancellationAt = json['cancellation_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_no'] = this.orderNo;
    data['order_currency'] = this.orderCurrency;
    data['order_statuses'] = this.orderStatuses;
    data['payment_status'] = this.paymentStatus;
    data['remarks'] = this.remarks;
    data['subtotal'] = this.subtotal;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['discount'] = this.discount;
    data['shipping_fee'] = this.shippingFee;
    data['total_weight'] = this.totalWeight;
    data['total_weight_uom'] = this.totalWeightUom;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_cancelled'] = this.isCancelled;
    data['cancellation_reason'] = this.cancellationReason;
    data['cancellation_at'] = this.cancellationAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }
    return data;
  }
}

class Customer {
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  var phone;

  Customer(
      {this.firstName, this.lastName, this.fullName, this.email, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class ShippingAddress {
  String? firstName;
  String? lastName;
  String? fullName;
  var phone;
  String? address1;
  String? address2;
  var address3;
  var address4;
  var address5;
  String? city;
  String? country;
  var postal;
  String? fullAddress;

  ShippingAddress(
      {this.firstName,
        this.lastName,
        this.fullName,
        this.phone,
        this.address1,
        this.address2,
        this.address3,
        this.address4,
        this.address5,
        this.city,
        this.country,
        this.postal,
        this.fullAddress});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    phone = json['phone'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    address3 = json['address_3'];
    address4 = json['address_4'];
    address5 = json['address_5'];
    city = json['city'];
    country = json['country'];
    postal = json['postal'];
    fullAddress = json['full_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['address_3'] = this.address3;
    data['address_4'] = this.address4;
    data['address_5'] = this.address5;
    data['city'] = this.city;
    data['country'] = this.country;
    data['postal'] = this.postal;
    data['full_address'] = this.fullAddress;
    return data;
  }
}

class LineItems {
  var lineItemId;
  int? orderId;
  var productId;
  var variantId;
  String? sku;
  String? status;
  var price;
  String? currency;
  var qty;
  String? name;
  String? title;
  String? description;
  var image;
  var  weight;
  String? weightUom;
  String? cancellationReason;
  String? cancellationAt;
  bool? isShippingRequired;
  var fulfilmentId;
  String? trackingNo;
  var fulfilmentOrderId;

  LineItems(
      {this.lineItemId,
        this.orderId,
        this.productId,
        this.variantId,
        this.sku,
        this.status,
        this.price,
        this.currency,
        this.qty,
        this.name,
        this.title,
        this.description,
        this.image,
        this.weight,
        this.weightUom,
        this.cancellationReason,
        this.cancellationAt,
        this.isShippingRequired,
        this.fulfilmentId,
        this.trackingNo,
        this.fulfilmentOrderId});

  LineItems.fromJson(Map<String, dynamic> json) {
    lineItemId = json['line_item_id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    sku = json['sku'];
    status = json['status'];
    price = json['price'];
    currency = json['currency'];
    qty = json['qty'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    weight = json['weight'];
    weightUom = json['weight_uom'];
    cancellationReason = json['cancellation_reason'];
    cancellationAt = json['cancellation_at'];
    isShippingRequired = json['is_shipping_required'];
    fulfilmentId = json['fulfilment_id'];
    trackingNo = json['tracking_no'];
    fulfilmentOrderId = json['fulfilment_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_item_id'] = this.lineItemId;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['variant_id'] = this.variantId;
    data['sku'] = this.sku;
    data['status'] = this.status;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['qty'] = this.qty;
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['weight_uom'] = this.weightUom;
    data['cancellation_reason'] = this.cancellationReason;
    data['cancellation_at'] = this.cancellationAt;
    data['is_shipping_required'] = this.isShippingRequired;
    data['fulfilment_id'] = this.fulfilmentId;
    data['tracking_no'] = this.trackingNo;
    data['fulfilment_order_id'] = this.fulfilmentOrderId;
    return data;
  }
}

class Additional {
  int? lineItemsTotalQty;
  int? lineItemsTotalSku;
  Store? store;

  Additional({this.lineItemsTotalQty, this.lineItemsTotalSku, this.store});

  Additional.fromJson(Map<String, dynamic> json) {
    lineItemsTotalQty = json['line_items_total_qty'];
    lineItemsTotalSku = json['line_items_total_sku'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_items_total_qty'] = this.lineItemsTotalQty;
    data['line_items_total_sku'] = this.lineItemsTotalSku;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Store {
  int? shopId;
  String? shopName;
  String? shopCurrency;
  String? platformName;
  String? platformLogo;

  Store(
      {this.shopId,
        this.shopName,
        this.shopCurrency,
        this.platformName,
        this.platformLogo});

  Store.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopCurrency = json['shop_currency'];
    platformName = json['platform_name'];
    platformLogo = json['platform_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_currency'] = this.shopCurrency;
    data['platform_name'] = this.platformName;
    data['platform_logo'] = this.platformLogo;
    return data;
  }
}

class FulfilmentOrder {
  var fulfilmentOrderId;
  List<String>? statuses;
  String? createdAt;
  String? fulfillBy;
  String? shippingMethod;
  var remarks;
  var totalWeight;
  String? totalWeightUom;
  List<LineItems>? lineItems;
  Additional? additional;

  FulfilmentOrder(
      {this.fulfilmentOrderId,
        this.statuses,
        this.createdAt,
        this.fulfillBy,
        this.shippingMethod,
        this.remarks,
        this.totalWeight,
        this.totalWeightUom,
        this.lineItems,
        this.additional});

  FulfilmentOrder.fromJson(Map<String, dynamic> json) {
    fulfilmentOrderId = json['fulfilment_order_id'];
    statuses = json['statuses'].cast<String>();
    createdAt = json['created_at'];
    fulfillBy = json['fulfill_by'];
    shippingMethod = json['shipping_method'];
    remarks = json['remarks'];
    totalWeight = json['total_weight'];
    totalWeightUom = json['total_weight_uom'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fulfilment_order_id'] = this.fulfilmentOrderId;
    data['statuses'] = this.statuses;
    data['created_at'] = this.createdAt;
    data['fulfill_by'] = this.fulfillBy;
    data['shipping_method'] = this.shippingMethod;
    data['remarks'] = this.remarks;
    data['total_weight'] = this.totalWeight;
    data['total_weight_uom'] = this.totalWeightUom;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }
    return data;
  }
}

class LineItemsDetails {
  var lineItemId;
  var orderId;
  var productId;
  var variantId;
  String? sku;
  String? status;
  int? price;
  String? currency;
  int? qty;
  String? name;
  String? title;
  String? description;
  var image;
  int? weight;
  String? weightUom;
  var cancellationReason;
  String? cancellationAt;
  bool? isShippingRequired;
  var fulfilmentId;
  String? trackingNo;
  var fulfilmentOrderId;

  LineItemsDetails(
      {this.lineItemId,
        this.orderId,
        this.productId,
        this.variantId,
        this.sku,
        this.status,
        this.price,
        this.currency,
        this.qty,
        this.name,
        this.title,
        this.description,
        this.image,
        this.weight,
        this.weightUom,
        this.cancellationReason,
        this.cancellationAt,
        this.isShippingRequired,
        this.fulfilmentId,
        this.trackingNo,
        this.fulfilmentOrderId});

  LineItemsDetails.fromJson(Map<String, dynamic> json) {
    lineItemId = json['line_item_id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    sku = json['sku'];
    status = json['status'];
    price = json['price'];
    currency = json['currency'];
    qty = json['qty'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    weight = json['weight'];
    weightUom = json['weight_uom'];
    cancellationReason = json['cancellation_reason'];
    cancellationAt = json['cancellation_at'];
    isShippingRequired = json['is_shipping_required'];
    fulfilmentId = json['fulfilment_id'];
    trackingNo = json['tracking_no'];
    fulfilmentOrderId = json['fulfilment_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_item_id'] = this.lineItemId;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['variant_id'] = this.variantId;
    data['sku'] = this.sku;
    data['status'] = this.status;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['qty'] = this.qty;
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['weight_uom'] = this.weightUom;
    data['cancellation_reason'] = this.cancellationReason;
    data['cancellation_at'] = this.cancellationAt;
    data['is_shipping_required'] = this.isShippingRequired;
    data['fulfilment_id'] = this.fulfilmentId;
    data['tracking_no'] = this.trackingNo;
    data['fulfilment_order_id'] = this.fulfilmentOrderId;
    return data;
  }
}

class AdditionalItem {
  var lineItemsTotalQty;
  var lineItemsTotalSku;

  AdditionalItem({this.lineItemsTotalQty, this.lineItemsTotalSku});

  AdditionalItem.fromJson(Map<String, dynamic> json) {
    lineItemsTotalQty = json['line_items_total_qty'];
    lineItemsTotalSku = json['line_items_total_sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_items_total_qty'] = this.lineItemsTotalQty;
    data['line_items_total_sku'] = this.lineItemsTotalSku;
    return data;
  }
}

class Fulfilments {
  int? fulfilmentId;
  String? trackingNo;
  int? orderId;
  String? shippingCarrier;
  List<LineItems>? lineItems;
  Additional? additional;

  Fulfilments(
      {this.fulfilmentId,
        this.trackingNo,
        this.orderId,
        this.shippingCarrier,
        this.lineItems,
        this.additional});

  Fulfilments.fromJson(Map<String, dynamic> json) {
    fulfilmentId = json['fulfilment_id'];
    trackingNo = json['tracking_no'];
    orderId = json['order_id'];
    shippingCarrier = json['shipping_carrier'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fulfilment_id'] = this.fulfilmentId;
    data['tracking_no'] = this.trackingNo;
    data['order_id'] = this.orderId;
    data['shipping_carrier'] = this.shippingCarrier;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }
    return data;
  }
}

class AdditionalCount {
  var fulfilmentIdsCount;
  List<dynamic>? fulfilmentIds;

  AdditionalCount({this.fulfilmentIdsCount, this.fulfilmentIds});

  AdditionalCount.fromJson(Map<String, dynamic> json) {
    fulfilmentIdsCount = json['fulfilment_ids_count'];
    fulfilmentIds = json['fulfilment_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fulfilment_ids_count'] = this.fulfilmentIdsCount;
    data['fulfilment_ids'] = this.fulfilmentIds;
    return data;
  }
}