import 'dart:developer';

import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/member.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/referral_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class MyNetworkViewModel extends BaseViewModel {
  final _referralService = locator<ReferralService>();
  final _authService = locator<AuthService>();

  UserModel? get user => _authService.user;

  List<Member> _members = [];
  List<Member> get members => _members;

  int get notAppliedCount =>
      _members.where((m) => m.kycStatus == 'not_applied').length;
  int get pendingCount =>
      _members.where((m) => m.kycStatus == 'pending').length;
  int get acceptedCount =>
      _members.where((m) => m.kycStatus == 'approved').length;

  String get inviteCode => "edg${user?.id}";

  onViewModelReady() {
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    setBusy(true);
    try {
      _members = await _referralService.getReferrals(user?.id);
      log(_members.toString());
    } catch (e) {
      debugPrint('Error fetching members: $e');
    } finally {
      setBusy(false);
    }
  }

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
