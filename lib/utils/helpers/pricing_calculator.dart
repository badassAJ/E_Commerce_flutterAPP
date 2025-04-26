
class TPricingCalculator {

  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice*taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    //lookup from database or api
    //return tax  rate
    return 0.10; //example cost
  }

  static double getShippingCost(String location){
    //lookup from database or api
    //calculate shipping cost
    return 5.00; //example cost
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart){
  // return cart.items.map((e) => e.price).fold(0,(previousPrice, currentPrice)=> previousPrice + (currentPrice ?? 0));
  // }


}