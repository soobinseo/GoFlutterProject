class TokensModel {
  String accessToken;
  String refreshToken;

  TokensModel(
      {this.accessToken,
        this.refreshToken,
        });

  TokensModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access-token'];
    refreshToken = json['refresh-token'];
  }
}