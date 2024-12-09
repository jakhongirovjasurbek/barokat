// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Asosiy`
  String get main {
    return Intl.message(
      'Asosiy',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `To'lov`
  String get payment {
    return Intl.message(
      'To\'lov',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Profil`
  String get profile {
    return Intl.message(
      'Profil',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get have_account {
    return Intl.message(
      'I already have an account',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get send_code {
    return Intl.message(
      'Send code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `I agree with your Privacy policy`
  String get agree_privacy {
    return Intl.message(
      'I agree with your Privacy policy',
      name: 'agree_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Check your messages`
  String get check_message {
    return Intl.message(
      'Check your messages',
      name: 'check_message',
      desc: '',
      args: [],
    );
  }

  /// `Activation code sent to`
  String get activation_code_sent {
    return Intl.message(
      'Activation code sent to',
      name: 'activation_code_sent',
      desc: '',
      args: [],
    );
  }

  /// `Wrong number?`
  String get wrong_number {
    return Intl.message(
      'Wrong number?',
      name: 'wrong_number',
      desc: '',
      args: [],
    );
  }

  /// `Please, provide your full name`
  String get name_not_empty {
    return Intl.message(
      'Please, provide your full name',
      name: 'name_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please, provide your phone number`
  String get phone_not_empty {
    return Intl.message(
      'Please, provide your phone number',
      name: 'phone_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Create passcode`
  String get create_passcode {
    return Intl.message(
      'Create passcode',
      name: 'create_passcode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm passcode`
  String get confirm_password {
    return Intl.message(
      'Confirm passcode',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passcode did not match`
  String get passcode_mismatch {
    return Intl.message(
      'Passcode did not match',
      name: 'passcode_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get no_notifications {
    return Intl.message(
      'No notifications',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Failed to authenticate`
  String get failed_to_auth {
    return Intl.message(
      'Failed to authenticate',
      name: 'failed_to_auth',
      desc: '',
      args: [],
    );
  }

  /// `Passcode is not correct`
  String get passcode_incorrect {
    return Intl.message(
      'Passcode is not correct',
      name: 'passcode_incorrect',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
