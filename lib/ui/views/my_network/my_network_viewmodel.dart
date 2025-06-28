import 'package:edge_market/models/member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class MyNetworkViewModel extends BaseViewModel {
  int get pendingCount => members.where((m) => m.status == 'pending').length;
  int get acceptedCount => members.where((m) => m.status == 'accepted').length;
  String get inviteCode => 'EM2311';

  List<Member> get members => [
        Member(
          rank: 4,
          name: "Marsha Fisher",
          avatarPath: "https://i.pravatar.cc/150?img=10",
          status: "pending",
          score: 4000,
        ),
        Member(
          rank: 5,
          name: "Juanita Cormier",
          avatarPath: "https://i.pravatar.cc/150?img=11",
          status: "accepted",
          score: 4000,
        ),
        Member(
          rank: 7,
          name: "Tamara Schmidt",
          avatarPath: "https://i.pravatar.cc/150?img=12",
          status: "accepted",
          score: 4000,
        ),
      ];

  void copyInviteCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: inviteCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invitation code copied!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
