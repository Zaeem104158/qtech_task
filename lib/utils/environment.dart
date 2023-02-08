enum Environment {
  STAGING,
  PRODUCTION,
}

const Environment activeProfile = Environment.PRODUCTION;

String getBaseUrl() {
  switch (activeProfile) {
    case Environment.STAGING:
      return "https://dev.reprecinct.com.au/api/v2";

    case Environment.PRODUCTION:
      return "https://reprecinct.com.au/api/v2";
  }
}



enum HttpMethod {
  GET,
  POST,
  PUT,
}

