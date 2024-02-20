// To parse this JSON data, do
//
//     final cryptoModel = cryptoModelFromJson(jsonString);

import 'dart:convert';

List<CryptoModel> cryptoModelFromJson(dynamic str) => List<CryptoModel>.from(
    json.decode(str).map((x) => CryptoModel.fromJson(x)));

dynamic cryptoModelToJson(List<CryptoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoModel {
  dynamic id;
  dynamic symbol;
  dynamic name;
  dynamic image;
  dynamic currentPrice;
  dynamic marketCap;
  dynamic marketCapRank;
  dynamic fullyDilutedValuation;
  dynamic totalVolume;
  dynamic high24H;
  dynamic low24H;
  dynamic priceChange24H;
  dynamic priceChangePercentage24H;
  dynamic marketCapChange24H;
  dynamic marketCapChangePercentage24H;
  dynamic circulatingSupply;
  dynamic totalSupply;
  dynamic maxSupply;
  dynamic ath;
  dynamic athChangePercentage;
  DateTime? athDate;
  dynamic atl;
  dynamic atlChangePercentage;
  DateTime? atlDate;
  Roi? roi;
  DateTime? lastUpdated;

  CryptoModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory CryptoModel.fromJson(Map<dynamic, dynamic> json) => CryptoModel(
        id: json["id"] ?? '',
        symbol: json["symbol"] ?? '',
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        currentPrice: json["current_price"]?.toDouble(),
        marketCap: json["market_cap"] ?? '',
        marketCapRank: json["market_cap_rank"] ?? '',
        fullyDilutedValuation: json["fully_diluted_valuation"] ?? '',
        totalVolume: json["total_volume"] ?? '',
        high24H: json["high_24h"]?.toDouble(),
        low24H: json["low_24h"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        maxSupply: json["max_supply"] ?? '',
        ath: json["ath"]?.toDouble(),
        athChangePercentage: json["ath_change_percentage"]?.toDouble(),
        athDate:
            json["ath_date"] == null ? null : DateTime.parse(json["ath_date"]),
        atl: json["atl"]?.toDouble(),
        atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
        atlDate:
            json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
        roi: json["roi"] == null ? null : Roi.fromJson(json["roi"]),
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate?.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate?.toIso8601String(),
        "roi": roi?.toJson(),
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class Roi {
  dynamic times;
  dynamic currency;
  dynamic percentage;

  Roi({
    this.times,
    this.currency,
    this.percentage,
  });

  factory Roi.fromJson(Map<dynamic, dynamic> json) => Roi(
        times: json["times"]?.toDouble(),
        currency: json["currency"] ?? '',
        percentage: json["percentage"]?.toDouble(),
      );

  Map<dynamic, dynamic> toJson() => {
        "times": times,
        "currency": currency,
        "percentage": percentage,
      };
}
