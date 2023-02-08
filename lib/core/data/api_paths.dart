class ApiPaths {
  static const baseUrl =
      'https://dev.citytech.global/web-api/finpos-dev-mobile-support-backend';

  static const allTickets =
      "$baseUrl/v1/mobile-support/tickets/all-tickets-details";

  static String myTickets(String userId) =>
      "$baseUrl/v1/mobile-support/tickets/my-tickets-details/$userId";
}
