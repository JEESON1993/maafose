// To parse this JSON data, do
//
//     final restoProductModel = restoProductModelFromJson(jsonString);

import 'dart:convert';

RestoProductModelNew restoProductModelFromJson(String str) =>
    RestoProductModelNew.fromJson(json.decode(str));

String restoProductModelToJson(RestoProductModelNew data) =>
    json.encode(data.toJson());

// class RestoProductModelNew {
//   RestoProductModelNew({
//     this.success,
//     this.data,
//   });

//   final bool success;
//   final Data data;

//   factory RestoProductModelNew.fromJson(Map<String, dynamic> json) =>
//       RestoProductModelNew(
//         success: json["success"] == null ? null : json["success"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success == null ? null : success,
//         "data": data == null ? null : data.toJson(),
//       };
// }

class RestoProductModelNew {
  RestoProductModelNew({
    this.vendor,
    this.products,
  });

  final Vendor vendor;
  final List<RestoProductNewModelProduct> products;

  factory RestoProductModelNew.fromJson(Map<String, dynamic> json) =>
      RestoProductModelNew(
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        products: json["products"] == null
            ? null
            : List<RestoProductNewModelProduct>.from(json["products"]
                .map((x) => RestoProductNewModelProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendor": vendor == null ? null : vendor.toJson(),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class RestoProductNewModelProduct {
  RestoProductNewModelProduct({
    this.id,
    this.category,
    this.products,
  });

  final String id;
  final ProductCategory category;
  final List<Product> products;

  factory RestoProductNewModelProduct.fromJson(Map<String, dynamic> json) =>
      RestoProductNewModelProduct(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null
            ? null
            : ProductCategory.fromJson(json["category"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "category": category == null ? null : category.toJson(),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductCategory {
  ProductCategory({
    this.id,
    this.status,
    this.name,
    this.branch,
    this.type,
    this.timing,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final String id;
  final bool status;
  final String name;
  final String branch;
  final String type;
  final List<dynamic> timing;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["_id"] == null ? null : json["_id"],
        status: json["status"] == null ? null : json["status"],
        name: json["name"] == null ? null : json["name"],
        branch: json["branch"] == null ? null : json["branch"],
        type: json["type"] == null ? null : json["type"],
        timing: json["timing"] == null
            ? null
            : List<dynamic>.from(json["timing"].map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "status": status == null ? null : status,
        "name": name == null ? null : name,
        "branch": branch == null ? null : branch,
        "type": type == null ? null : type,
        "timing":
            timing == null ? null : List<dynamic>.from(timing.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Product {
  Product({
    this.id,
    this.status,
    this.type,
    this.name,
    this.category,
    this.categoryType,
    this.meal,
    this.price,
    this.packingCharge,
    this.offerPrice,
    this.specialTag,
    this.maafosPrice,
    this.description,
    this.branch,
    this.vendor,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bestSeller,
    this.addonStatus,
    this.timingStatus,
    this.addons,
    this.variantStatus,
    this.productId,
    this.addonCount,
    this.variantCount,
    this.showAddon,
    this.showVariant,
    this.timing,
    this.variants,
    this.ids,
  });

  final String id;
  String ids;
  final bool status;
  final String type;
  final String name;
  final String category;
  final String categoryType;
  final String meal;
  final int price;
  final int packingCharge;
  final int offerPrice;
  final String specialTag;
  final int maafosPrice;
  final String description;
  final String branch;
  final String vendor;
  final StoreBg image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool bestSeller;
  final bool addonStatus;
  final bool timingStatus;
  final List<Addon> addons;
  final bool variantStatus;
  final String productId;
  final int addonCount;
  final int variantCount;
  final bool showAddon;
  final bool showVariant;
  final List<Timing> timing;
  final List<Addon> variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] == null ? null : json["_id"],
        ids: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
        category: json["category"] == null ? null : json["category"],
        categoryType:
            json["categoryType"] == null ? null : json["categoryType"],
        meal: json["meal"] == null ? null : json["meal"],
        price: json["price"] == null ? null : json["price"],
        packingCharge:
            json["packingCharge"] == null ? null : json["packingCharge"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
        specialTag: json["specialTag"] == null ? null : json["specialTag"],
        maafosPrice: json["maafosPrice"] == null ? null : json["maafosPrice"],
        description: json["description"] == null ? null : json["description"],
        branch: json["branch"] == null ? null : json["branch"],
        vendor: json["vendor"] == null ? null : json["vendor"],
        image: json["image"] == null ? null : StoreBg.fromJson(json["image"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        bestSeller: json["bestSeller"] == null ? null : json["bestSeller"],
        addonStatus: json["addonStatus"] == null ? null : json["addonStatus"],
        timingStatus:
            json["timingStatus"] == null ? null : json["timingStatus"],
        addons: json["addons"] == null
            ? null
            : List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
        variantStatus:
            json["variantStatus"] == null ? null : json["variantStatus"],
        productId: json["id"] == null ? null : json["id"],
        addonCount: json["addonCount"] == null ? null : json["addonCount"],
        variantCount:
            json["variantCount"] == null ? null : json["variantCount"],
        showAddon: json["showAddon"] == null ? null : json["showAddon"],
        showVariant: json["showVariant"] == null ? null : json["showVariant"],
        timing: json["timing"] == null
            ? null
            : List<Timing>.from(json["timing"].map((x) => Timing.fromJson(x))),
        variants: json["variants"] == null
            ? null
            : List<Addon>.from(json["variants"].map((x) => Addon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "id": ids == null ? null : ids,
        "status": status == null ? null : status,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "category": category == null ? null : category,
        "categoryType": categoryType == null ? null : categoryType,
        "meal": meal == null ? null : meal,
        "price": price == null ? null : price,
        "packingCharge": packingCharge == null ? null : packingCharge,
        "offerPrice": offerPrice == null ? null : offerPrice,
        "specialTag": specialTag == null ? null : specialTag,
        "maafosPrice": maafosPrice == null ? null : maafosPrice,
        "description": description == null ? null : description,
        "branch": branch == null ? null : branch,
        "vendor": vendor == null ? null : vendor,
        "image": image == null ? null : image.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "bestSeller": bestSeller == null ? null : bestSeller,
        "addonStatus": addonStatus == null ? null : addonStatus,
        "timingStatus": timingStatus == null ? null : timingStatus,
        "addons": addons == null
            ? null
            : List<dynamic>.from(addons.map((x) => x.toJson())),
        "variantStatus": variantStatus == null ? null : variantStatus,
        "id": productId == null ? null : productId,
        "addonCount": addonCount == null ? null : addonCount,
        "variantCount": variantCount == null ? null : variantCount,
        "showAddon": showAddon == null ? null : showAddon,
        "showVariant": showVariant == null ? null : showVariant,
        "timing": timing == null
            ? null
            : List<dynamic>.from(timing.map((x) => x.toJson())),
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Addon {
  Addon({
    this.status,
    this.id,
    this.name,
    this.price,
    this.offerPrice,
    this.maafosPrice,
  });

  final bool status;
  final String id;
  final String name;
  final int price;
  final int offerPrice;
  final int maafosPrice;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
        maafosPrice: json["maafosPrice"] == null ? null : json["maafosPrice"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "offerPrice": offerPrice == null ? null : offerPrice,
        "maafosPrice": maafosPrice == null ? null : maafosPrice,
      };
}

class StoreBg {
  StoreBg({
    this.key,
    this.image,
  });

  final String key;
  final String image;

  factory StoreBg.fromJson(Map<String, dynamic> json) => StoreBg(
        key: json["key"] == null ? null : json["key"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "image": image == null ? null : image,
      };
}

class Timing {
  Timing({
    this.id,
    this.startTime,
    this.endTime,
    this.timingId,
  });

  final String id;
  final String startTime;
  final String endTime;
  final int timingId;

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
        id: json["_id"] == null ? null : json["_id"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        timingId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "id": timingId == null ? null : timingId,
      };
}

class Vendor {
  Vendor({
    this.storeLogo,
    this.storeBg,
    this.location,
    this.contactNumber,
    this.quickDelivery,
    this.storeStatus,
    this.addons,
    this.featured,
    this.rating,
    this.minimumOrderValue,
    this.id,
    this.name,
    this.branch,
    this.type,
    this.openTime,
    this.closeTime,
    this.cuisine,
    this.commission,
    this.dCommission,
    this.sortOrder,
    this.avgCookingTime,
    this.avgPersonAmt,
    this.user,
    this.storeBanner,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final StoreBg storeLogo;
  final StoreBg storeBg;
  final Location location;
  final int contactNumber;
  final bool quickDelivery;
  final bool storeStatus;
  final List<dynamic> addons;
  final bool featured;
  final double rating;
  final int minimumOrderValue;
  final String id;
  final String name;
  final String branch;
  final String type;
  final String openTime;
  final String closeTime;
  final String cuisine;
  final int commission;
  final int dCommission;
  final int sortOrder;
  final int avgCookingTime;
  final int avgPersonAmt;
  final String user;
  final List<dynamic> storeBanner;
  final List<CategoryElement> category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        storeLogo: json["storeLogo"] == null
            ? null
            : StoreBg.fromJson(json["storeLogo"]),
        storeBg:
            json["storeBg"] == null ? null : StoreBg.fromJson(json["storeBg"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        contactNumber:
            json["contactNumber"] == null ? null : json["contactNumber"],
        quickDelivery:
            json["quickDelivery"] == null ? null : json["quickDelivery"],
        storeStatus: json["storeStatus"] == null ? null : json["storeStatus"],
        addons: json["addons"] == null
            ? null
            : List<dynamic>.from(json["addons"].map((x) => x)),
        featured: json["featured"] == null ? null : json["featured"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        minimumOrderValue: json["minimumOrderValue"] == null
            ? null
            : json["minimumOrderValue"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        branch: json["branch"] == null ? null : json["branch"],
        type: json["type"] == null ? null : json["type"],
        openTime: json["openTime"] == null ? null : json["openTime"],
        closeTime: json["closeTime"] == null ? null : json["closeTime"],
        cuisine: json["cuisine"] == null ? null : json["cuisine"],
        commission: json["commission"] == null ? null : json["commission"],
        dCommission: json["dCommission"] == null ? null : json["dCommission"],
        sortOrder: json["sortOrder"] == null ? null : json["sortOrder"],
        avgCookingTime:
            json["avgCookingTime"] == null ? null : json["avgCookingTime"],
        avgPersonAmt:
            json["avgPersonAmt"] == null ? null : json["avgPersonAmt"],
        user: json["user"] == null ? null : json["user"],
        storeBanner: json["storeBanner"] == null
            ? null
            : List<dynamic>.from(json["storeBanner"].map((x) => x)),
        category: json["category"] == null
            ? null
            : List<CategoryElement>.from(
                json["category"].map((x) => CategoryElement.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "storeLogo": storeLogo == null ? null : storeLogo.toJson(),
        "storeBg": storeBg == null ? null : storeBg.toJson(),
        "location": location == null ? null : location.toJson(),
        "contactNumber": contactNumber == null ? null : contactNumber,
        "quickDelivery": quickDelivery == null ? null : quickDelivery,
        "storeStatus": storeStatus == null ? null : storeStatus,
        "addons":
            addons == null ? null : List<dynamic>.from(addons.map((x) => x)),
        "featured": featured == null ? null : featured,
        "rating": rating == null ? null : rating,
        "minimumOrderValue":
            minimumOrderValue == null ? null : minimumOrderValue,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "branch": branch == null ? null : branch,
        "type": type == null ? null : type,
        "openTime": openTime == null ? null : openTime,
        "closeTime": closeTime == null ? null : closeTime,
        "cuisine": cuisine == null ? null : cuisine,
        "commission": commission == null ? null : commission,
        "dCommission": dCommission == null ? null : dCommission,
        "sortOrder": sortOrder == null ? null : sortOrder,
        "avgCookingTime": avgCookingTime == null ? null : avgCookingTime,
        "avgPersonAmt": avgPersonAmt == null ? null : avgPersonAmt,
        "user": user == null ? null : user,
        "storeBanner": storeBanner == null
            ? null
            : List<dynamic>.from(storeBanner.map((x) => x)),
        "category": category == null
            ? null
            : List<dynamic>.from(category.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class CategoryElement {
  CategoryElement({
    this.status,
    this.id,
    this.category,
  });

  final bool status;
  final String id;
  final String category;

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "category": category == null ? null : category,
      };
}

class Location {
  Location({
    this.type,
    this.formattedAddress,
    this.address,
    this.coordinates,
    this.landmark,
  });

  final String type;
  final String formattedAddress;
  final String address;
  final List<double> coordinates;
  final String landmark;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] == null ? null : json["type"],
        formattedAddress:
            json["formattedAddress"] == null ? null : json["formattedAddress"],
        address: json["address"] == null ? null : json["address"],
        coordinates: json["coordinates"] == null
            ? null
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        landmark: json["landmark"] == null ? null : json["landmark"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "formattedAddress": formattedAddress == null ? null : formattedAddress,
        "address": address == null ? null : address,
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates.map((x) => x)),
        "landmark": landmark == null ? null : landmark,
      };
}
