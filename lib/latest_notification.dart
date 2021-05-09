class LatestIosVoipNotification {
  final UserCallReaction callReaction;
  final Map<String, dynamic> payload;

  LatestIosVoipNotification(this.callReaction, this.payload);

  static LatestIosVoipNotification fromMap(Map raw) {
    if (raw == null) {
      return LatestIosVoipNotification(null, null);
    }

    final rawReaction = raw["action"];
    final rawPayload = raw["payload"];

    UserCallReaction reaction =
        rawReaction != null ? rawReaction.toString().toUserCallReaction() : null;
    Map<String, dynamic> payload =
        rawPayload != null ? Map<String, dynamic>.from(rawPayload) : null;

    return LatestIosVoipNotification(reaction, payload);
  }
}

enum UserCallReaction { Accepted, Rejected }

extension UserCallReactionStrings on String {
  UserCallReaction toUserCallReaction() {
    if (this.toLowerCase() == "accepted") return UserCallReaction.Accepted;
    if (this.toLowerCase() == "rejected") return UserCallReaction.Rejected;
    return null;
  }
}
