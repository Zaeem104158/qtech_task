// class CovidModel {
//   Global? global;
//   List<Countries>? countries;
//   String? date;
//   String? error;

//   CovidModel({this.global, this.countries, this.date});

//   CovidModel.withError(String errorMessage) {
//     error = errorMessage;
//   }

//   CovidModel.fromJson(Map<String, dynamic> json) {
//     global =
//         json['Global'] != null ? new Global.fromJson(json['Global']) : null;
//     if (json['Countries'] != null) {
//       countries = [];
//       json['Countries'].forEach((v) {
//         countries!.add(new Countries.fromJson(v));
//       });
//     }
//     date = json['Date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.global != null) {
//       data['Global'] = this.global!.toJson();
//     }
//     if (this.countries != null) {
//       data['Countries'] = this.countries!.map((v) => v.toJson()).toList();
//     }
//     data['Date'] = this.date;
//     return data;
//   }
// }

// class Global {
//   double? newConfirmed;
//   double? totalConfirmed;
//   double? newDeaths;
//   double? totalDeaths;
//   double? newRecovered;
//   double? totalRecovered;

//   Global(
//       {this.newConfirmed,
//       this.totalConfirmed,
//       this.newDeaths,
//       this.totalDeaths,
//       this.newRecovered,
//       this.totalRecovered});

//   Global.fromJson(Map<String, dynamic> json) {
//     newConfirmed = json['NewConfirmed'];
//     totalConfirmed = json['TotalConfirmed'];
//     newDeaths = json['NewDeaths'];
//     totalDeaths = json['TotalDeaths'];
//     newRecovered = json['NewRecovered'];
//     totalRecovered = json['TotalRecovered'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['NewConfirmed'] = this.newConfirmed;
//     data['TotalConfirmed'] = this.totalConfirmed;
//     data['NewDeaths'] = this.newDeaths;
//     data['TotalDeaths'] = this.totalDeaths;
//     data['NewRecovered'] = this.newRecovered;
//     data['TotalRecovered'] = this.totalRecovered;
//     return data;
//   }
// }

// class Countries {
//   String? country;
//   String? countryCode;
//   String? slug;
//   double? newConfirmed;
//   double? totalConfirmed;
//   double? newDeaths;
//   double? totalDeaths;
//   double? newRecovered;
//   double? totalRecovered;
//   String? date;

//   Countries(
//       {this.country,
//       this.countryCode,
//       this.slug,
//       this.newConfirmed,
//       this.totalConfirmed,
//       this.newDeaths,
//       this.totalDeaths,
//       this.newRecovered,
//       this.totalRecovered,
//       this.date});

//   Countries.fromJson(Map<String, dynamic> json) {
//     country = json['Country'];
//     countryCode = json['CountryCode'];
//     slug = json['Slug'];
//     newConfirmed = json['NewConfirmed'];
//     totalConfirmed = json['TotalConfirmed'];
//     newDeaths = json['NewDeaths'];
//     totalDeaths = json['TotalDeaths'];
//     newRecovered = json['NewRecovered'];
//     totalRecovered = json['TotalRecovered'];
//     date = json['Date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Country'] = this.country;
//     data['CountryCode'] = this.countryCode;
//     data['Slug'] = this.slug;
//     data['NewConfirmed'] = this.newConfirmed;
//     data['TotalConfirmed'] = this.totalConfirmed;
//     data['NewDeaths'] = this.newDeaths;
//     data['TotalDeaths'] = this.totalDeaths;
//     data['NewRecovered'] = this.newRecovered;
//     data['TotalRecovered'] = this.totalRecovered;
//     data['Date'] = this.date;
//     return data;
//   }
// }



// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
    String? status;
    Data? data;
    String? error;
    ProductListModel({
       required this.status,
       required this.data,
        
    });
    //   Global? global;
//   List<Countries>? countries;
//   String? date;
//   String? error;

//   CovidModel({this.global, this.countries, this.date});

  ProductListModel.withError(String errorMessage) {
    error = errorMessage;
  }

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        required this.categories,
        required this.products,
    });

    List<dynamic> categories;
    Products products;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        products: Products.fromJson(json["products"]),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "products": products.toJson(),
    };
}

class Products {
    Products({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    int count;
    String next;
    String previous;
    List<Result> results;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.id,
        required this.brand,
        required this.image,
        required this.charge,
        required this.images,
        required this.slug,
        required this.productName,
        required this.model,
        required this.commissionType,
        required this.amount,
        required this.tag,
        required this.description,
        required this.note,
        required this.embaddedVideoLink,
        required this.maximumOrder,
        required this.stock,
        required this.isBackOrder,
        required this.specification,
        required this.warranty,
        required this.preOrder,
        required this.productReview,
        required this.isSeller,
        required this.isPhone,
        required this.willShowEmi,
        this.badge,
        required this.isActive,
        required this.sackEquivalent,
        required this.createdAt,
        required this.updatedAt,
        this.language,
        required this.seller,
        this.combo,
        required this.createdBy,
        this.updatedBy,
        required this.category,
        required this.relatedProduct,
        required this.filterValue,
        required this.distributors,
    });

    int id;
    Brand brand;
    String image;
    Charge charge;
    List<Image> images;
    String slug;
    String productName;
    String model;
    CommissionType commissionType;
    String amount;
    String tag;
    String description;
    String note;
    String embaddedVideoLink;
    int maximumOrder;
    int stock;
    bool isBackOrder;
    Specification specification;
    String warranty;
    bool preOrder;
    int productReview;
    bool isSeller;
    bool isPhone;
    bool willShowEmi;
    dynamic badge;
    bool isActive;
    String sackEquivalent;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic language;
    Seller seller;
    dynamic combo;
    CreatedBy createdBy;
    dynamic updatedBy;
    List<int> category;
    List<dynamic> relatedProduct;
    List<dynamic> filterValue;
    List<dynamic> distributors;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        brand: Brand.fromJson(json["brand"]),
        image: json["image"],
        charge: Charge.fromJson(json["charge"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        slug: json["slug"],
        productName: json["product_name"],
        model: json["model"],
        commissionType: commissionTypeValues.map[json["commission_type"]]!,
        amount: json["amount"],
        tag: json["tag"],
        description: json["description"],
        note: json["note"],
        embaddedVideoLink: json["embadded_video_link"],
        maximumOrder: json["maximum_order"],
        stock: json["stock"],
        isBackOrder: json["is_back_order"],
        specification: specificationValues.map[json["specification"]]!,
        warranty: json["warranty"],
        preOrder: json["pre_order"],
        productReview: json["product_review"],
        isSeller: json["is_seller"],
        isPhone: json["is_phone"],
        willShowEmi: json["will_show_emi"],
        badge: json["badge"],
        isActive: json["is_active"],
        sackEquivalent: json["sack_equivalent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        language: json["language"],
        seller: sellerValues.map[json["seller"]]!,
        combo: json["combo"],
        createdBy: createdByValues.map[json["created_by"]]!,
        updatedBy: json["updated_by"],
        category: List<int>.from(json["category"].map((x) => x)),
        relatedProduct: List<dynamic>.from(json["related_product"].map((x) => x)),
        filterValue: List<dynamic>.from(json["filter_value"].map((x) => x)),
        distributors: List<dynamic>.from(json["distributors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand.toJson(),
        "image": image,
        "charge": charge.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "slug": slug,
        "product_name": productName,
        "model": model,
        "commission_type": commissionTypeValues.reverse[commissionType],
        "amount": amount,
        "tag": tag,
        "description": description,
        "note": note,
        "embadded_video_link": embaddedVideoLink,
        "maximum_order": maximumOrder,
        "stock": stock,
        "is_back_order": isBackOrder,
        "specification": specificationValues.reverse[specification],
        "warranty": warranty,
        "pre_order": preOrder,
        "product_review": productReview,
        "is_seller": isSeller,
        "is_phone": isPhone,
        "will_show_emi": willShowEmi,
        "badge": badge,
        "is_active": isActive,
        "sack_equivalent": sackEquivalent,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "language": language,
        "seller": sellerValues.reverse[seller],
        "combo": combo,
        "created_by": createdByValues.reverse[createdBy],
        "updated_by": updatedBy,
        "category": List<dynamic>.from(category.map((x) => x)),
        "related_product": List<dynamic>.from(relatedProduct.map((x) => x)),
        "filter_value": List<dynamic>.from(filterValue.map((x) => x)),
        "distributors": List<dynamic>.from(distributors.map((x) => x)),
    };
}

class Brand {
    Brand({
        required this.name,
        required this.image,
        this.headerImage,
        required this.slug,
    });

    Name name;
    String image;
    dynamic headerImage;
    Slug slug;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        headerImage: json["header_image"],
        slug: slugValues.map[json["slug"]]!,
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "image": image,
        "header_image": headerImage,
        "slug": slugValues.reverse[slug],
    };
}

enum Name { RICE }

final nameValues = EnumValues({
    "Rice": Name.RICE
});

enum Slug { RICE }

final slugValues = EnumValues({
    "rice": Slug.RICE
});

class Charge {
    Charge({
        required this.bookingPrice,
        required this.currentCharge,
        this.discountCharge,
        required this.sellingPrice,
        required this.profit,
        required this.isEvent,
        this.eventId,
        required this.highlight,
        this.highlightId,
        required this.groupping,
        this.grouppingId,
        this.campaignSectionId,
        required this.campaignSection,
        this.message,
    });

    double bookingPrice;
    double currentCharge;
    dynamic discountCharge;
    double sellingPrice;
    double profit;
    bool isEvent;
    dynamic eventId;
    bool highlight;
    dynamic highlightId;
    bool groupping;
    dynamic grouppingId;
    dynamic campaignSectionId;
    bool campaignSection;
    dynamic message;

    factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        bookingPrice: json["booking_price"],
        currentCharge: json["current_charge"],
        discountCharge: json["discount_charge"],
        sellingPrice: json["selling_price"],
        profit: json["profit"],
        isEvent: json["is_event"],
        eventId: json["event_id"],
        highlight: json["highlight"],
        highlightId: json["highlight_id"],
        groupping: json["groupping"],
        grouppingId: json["groupping_id"],
        campaignSectionId: json["campaign_section_id"],
        campaignSection: json["campaign_section"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "booking_price": bookingPrice,
        "current_charge": currentCharge,
        "discount_charge": discountCharge,
        "selling_price": sellingPrice,
        "profit": profit,
        "is_event": isEvent,
        "event_id": eventId,
        "highlight": highlight,
        "highlight_id": highlightId,
        "groupping": groupping,
        "groupping_id": grouppingId,
        "campaign_section_id": campaignSectionId,
        "campaign_section": campaignSection,
        "message": message,
    };
}

enum CommissionType { PERCENT }

final commissionTypeValues = EnumValues({
    "Percent": CommissionType.PERCENT
});

enum CreatedBy { QTECSL }

final createdByValues = EnumValues({
    "qtecsl": CreatedBy.QTECSL
});

class Image {
    Image({
        required this.id,
        required this.image,
        required this.isPrimary,
        required this.product,
    });

    int id;
    String image;
    bool isPrimary;
    int product;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        isPrimary: json["is_primary"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "is_primary": isPrimary,
        "product": product,
    };
}

enum Seller { SUPPLY_LINE }

final sellerValues = EnumValues({
    "SupplyLine": Seller.SUPPLY_LINE
});

enum Specification { EMPTY }

final specificationValues = EnumValues({
    "<|>": Specification.EMPTY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
