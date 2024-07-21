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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Birth date`
  String get Please_enter_your_Birth_date {
    return Intl.message(
      'Please enter your Birth date',
      name: 'Please_enter_your_Birth_date',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get Please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'Please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `This is not an email !!`
  String get This_is_not_an_email {
    return Intl.message(
      'This is not an email !!',
      name: 'This_is_not_an_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Name`
  String get Please_enter_your_Name {
    return Intl.message(
      'Please enter your Name',
      name: 'Please_enter_your_Name',
      desc: '',
      args: [],
    );
  }

  /// `Name should be atleast 8 characters`
  String get Name_should_be_atleast_8_characters {
    return Intl.message(
      'Name should be atleast 8 characters',
      name: 'Name_should_be_atleast_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get Please_enter_your_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'Please_enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number should be atleast 11 number`
  String get Phone_number_should_be_atleast_11_number {
    return Intl.message(
      'Phone number should be atleast 11 number',
      name: 'Phone_number_should_be_atleast_11_number',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get Edit_Profile {
    return Intl.message(
      'Edit Profile',
      name: 'Edit_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get Personal_Details {
    return Intl.message(
      'Personal Details',
      name: 'Personal_Details',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get No_data_available {
    return Intl.message(
      'No data available',
      name: 'No_data_available',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get Edit_address {
    return Intl.message(
      'Edit address',
      name: 'Edit_address',
      desc: '',
      args: [],
    );
  }

  /// `Apartment`
  String get Apartment {
    return Intl.message(
      'Apartment',
      name: 'Apartment',
      desc: '',
      args: [],
    );
  }

  /// `House`
  String get House {
    return Intl.message(
      'House',
      name: 'House',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get Office {
    return Intl.message(
      'Office',
      name: 'Office',
      desc: '',
      args: [],
    );
  }

  /// `Building Name`
  String get Building_Name {
    return Intl.message(
      'Building Name',
      name: 'Building_Name',
      desc: '',
      args: [],
    );
  }

  /// `Apt. no.`
  String get Apt_no {
    return Intl.message(
      'Apt. no.',
      name: 'Apt_no',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get Floor {
    return Intl.message(
      'Floor',
      name: 'Floor',
      desc: '',
      args: [],
    );
  }

  /// `Street address`
  String get Street_address {
    return Intl.message(
      'Street address',
      name: 'Street_address',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `Save address`
  String get Save_address {
    return Intl.message(
      'Save address',
      name: 'Save_address',
      desc: '',
      args: [],
    );
  }

  /// `Your Current Location`
  String get Your_Current_Location {
    return Intl.message(
      'Your Current Location',
      name: 'Your_Current_Location',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get Area {
    return Intl.message(
      'Area',
      name: 'Area',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get Company {
    return Intl.message(
      'Company',
      name: 'Company',
      desc: '',
      args: [],
    );
  }

  /// `Field is empty`
  String get Field_is_empty {
    return Intl.message(
      'Field is empty',
      name: 'Field_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get Your_cart_is_empty {
    return Intl.message(
      'Your cart is empty',
      name: 'Your_cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get Order_Summary {
    return Intl.message(
      'Order Summary',
      name: 'Order_Summary',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get Order {
    return Intl.message(
      'Order',
      name: 'Order',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get Delivery {
    return Intl.message(
      'Delivery',
      name: 'Delivery',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Add items`
  String get Add_items {
    return Intl.message(
      'Add items',
      name: 'Add_items',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get My_Cart {
    return Intl.message(
      'My Cart',
      name: 'My_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  /// `No Order Yet`
  String get No_Order_Yet {
    return Intl.message(
      'No Order Yet',
      name: 'No_Order_Yet',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty.Add`
  String get Your_cart_is_empty_Add {
    return Intl.message(
      'Your cart is empty.Add',
      name: 'Your_cart_is_empty_Add',
      desc: '',
      args: [],
    );
  }

  /// `something from the menu`
  String get something_from_the_menu {
    return Intl.message(
      'something from the menu',
      name: 'something_from_the_menu',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS`
  String get Send_SMS {
    return Intl.message(
      'Send SMS',
      name: 'Send_SMS',
      desc: '',
      args: [],
    );
  }

  /// `Verify your mobile number to place an order`
  String get Verify_your_mobile_number_to_place_an_order {
    return Intl.message(
      'Verify your mobile number to place an order',
      name: 'Verify_your_mobile_number_to_place_an_order',
      desc: '',
      args: [],
    );
  }

  /// `We'll send a 4-digit code to:`
  String get We_will_send_a_4digit_code_to {
    return Intl.message(
      'We\'ll send a 4-digit code to:',
      name: 'We_will_send_a_4digit_code_to',
      desc: '',
      args: [],
    );
  }

  /// `Please select (Send SMS)`
  String get Please_select_Send_SMS {
    return Intl.message(
      'Please select (Send SMS)',
      name: 'Please_select_Send_SMS',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get Card_Number {
    return Intl.message(
      'Card Number',
      name: 'Card_Number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your card number`
  String get Please_enter_your_card_number {
    return Intl.message(
      'Please enter your card number',
      name: 'Please_enter_your_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get Expiry_Date {
    return Intl.message(
      'Expiry Date',
      name: 'Expiry_Date',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the expiry date`
  String get Please_enter_the_expiry_date {
    return Intl.message(
      'Please enter the expiry date',
      name: 'Please_enter_the_expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get CVV {
    return Intl.message(
      'CVV',
      name: 'CVV',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your CVV`
  String get Please_enter_your_CVV {
    return Intl.message(
      'Please enter your CVV',
      name: 'Please_enter_your_CVV',
      desc: '',
      args: [],
    );
  }

  /// `Pay now`
  String get Pay_now {
    return Intl.message(
      'Pay now',
      name: 'Pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Error saving payment information`
  String get Error_saving_payment_information {
    return Intl.message(
      'Error saving payment information',
      name: 'Error_saving_payment_information',
      desc: '',
      args: [],
    );
  }

  /// `Pay with`
  String get Pay_with {
    return Intl.message(
      'Pay with',
      name: 'Pay_with',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get Please_select_payment_method {
    return Intl.message(
      'Please select payment method',
      name: 'Please_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Place order`
  String get Place_order {
    return Intl.message(
      'Place order',
      name: 'Place_order',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get Cash {
    return Intl.message(
      'Cash',
      name: 'Cash',
      desc: '',
      args: [],
    );
  }

  /// `Add a new card`
  String get Add_a_new_card {
    return Intl.message(
      'Add a new card',
      name: 'Add_a_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Special for you`
  String get Special_for_you {
    return Intl.message(
      'Special for you',
      name: 'Special_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get Menu {
    return Intl.message(
      'Menu',
      name: 'Menu',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Saved Address`
  String get Saved_Address {
    return Intl.message(
      'Saved Address',
      name: 'Saved_Address',
      desc: '',
      args: [],
    );
  }

  /// `Change email`
  String get Change_email {
    return Intl.message(
      'Change email',
      name: 'Change_email',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get Change_password {
    return Intl.message(
      'Change password',
      name: 'Change_password',
      desc: '',
      args: [],
    );
  }

  /// `FAQ & Help`
  String get FAQ_Help {
    return Intl.message(
      'FAQ & Help',
      name: 'FAQ_Help',
      desc: '',
      args: [],
    );
  }

  /// `Contact with us`
  String get Contact_with_us {
    return Intl.message(
      'Contact with us',
      name: 'Contact_with_us',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  /// `App feedback`
  String get App_feedback {
    return Intl.message(
      'App feedback',
      name: 'App_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Call us`
  String get Call_us {
    return Intl.message(
      'Call us',
      name: 'Call_us',
      desc: '',
      args: [],
    );
  }

  /// `Chat Us`
  String get Chat_Us {
    return Intl.message(
      'Chat Us',
      name: 'Chat_Us',
      desc: '',
      args: [],
    );
  }

  /// `🍀 Our Team Would like To Hear You ! 🍀`
  String get Our_Team_Would_ike_To_Hear_You {
    return Intl.message(
      '🍀 Our Team Would like To Hear You ! 🍀',
      name: 'Our_Team_Would_ike_To_Hear_You',
      desc: '',
      args: [],
    );
  }

  /// `Email Us`
  String get Email_Us {
    return Intl.message(
      'Email Us',
      name: 'Email_Us',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get Your_Message {
    return Intl.message(
      'Your Message',
      name: 'Your_Message',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get OR {
    return Intl.message(
      'OR',
      name: 'OR',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `No Favorites Yet`
  String get No_Favorites_Yet {
    return Intl.message(
      'No Favorites Yet',
      name: 'No_Favorites_Yet',
      desc: '',
      args: [],
    );
  }

  /// `Mark your favorite food and always have`
  String get Mark_your_favorite_food_and_always_have {
    return Intl.message(
      'Mark your favorite food and always have',
      name: 'Mark_your_favorite_food_and_always_have',
      desc: '',
      args: [],
    );
  }

  /// `them here`
  String get them_here {
    return Intl.message(
      'them here',
      name: 'them_here',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `check your Email or password`
  String get check_your_Email_or_password {
    return Intl.message(
      'check your Email or password',
      name: 'check_your_Email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get The_password_provided_is_too_weak {
    return Intl.message(
      'The password provided is too weak',
      name: 'The_password_provided_is_too_weak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email`
  String get The_account_already_exists_for_that_email {
    return Intl.message(
      'The account already exists for that email',
      name: 'The_account_already_exists_for_that_email',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get Enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'Enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get Full_Name {
    return Intl.message(
      'Full Name',
      name: 'Full_Name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Full Name`
  String get Enter_your_Full_Name {
    return Intl.message(
      'Enter your Full Name',
      name: 'Enter_your_Full_Name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get Enter_your_Password {
    return Intl.message(
      'Enter your Password',
      name: 'Enter_your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get Please_enter_a_new_password {
    return Intl.message(
      'Please enter a new password',
      name: 'Please_enter_a_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get Password_must_be_at_least_8_characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'Password_must_be_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain uppercase letter`
  String get Password_must_contain_uppercase_letter {
    return Intl.message(
      'Password must contain uppercase letter',
      name: 'Password_must_contain_uppercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain lowercase letter`
  String get Password_must_contain_lowercase_letter {
    return Intl.message(
      'Password must contain lowercase letter',
      name: 'Password_must_contain_lowercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain number`
  String get Password_must_contain_number {
    return Intl.message(
      'Password must contain number',
      name: 'Password_must_contain_number',
      desc: '',
      args: [],
    );
  }

  /// `Password_must_contain_special_character`
  String get Password_must_contain_special_character {
    return Intl.message(
      'Password_must_contain_special_character',
      name: 'Password_must_contain_special_character',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get Phone_number {
    return Intl.message(
      'Phone number',
      name: 'Phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get Enter_your_phone {
    return Intl.message(
      'Enter your phone',
      name: 'Enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `Birthdate`
  String get Birthdate {
    return Intl.message(
      'Birthdate',
      name: 'Birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pirthdate`
  String get Enter_your_pirthdate {
    return Intl.message(
      'Enter your pirthdate',
      name: 'Enter_your_pirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Enter new email`
  String get Enter_new_email {
    return Intl.message(
      'Enter new email',
      name: 'Enter_new_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new email`
  String get Please_enter_a_new_email {
    return Intl.message(
      'Please enter a new email',
      name: 'Please_enter_a_new_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm email`
  String get Enter_confirm_email {
    return Intl.message(
      'Enter confirm email',
      name: 'Enter_confirm_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a confirm email`
  String get Please_enter_a_confirm_email {
    return Intl.message(
      'Please enter a confirm email',
      name: 'Please_enter_a_confirm_email',
      desc: '',
      args: [],
    );
  }

  /// `Email do not much!`
  String get Email_do_not_much {
    return Intl.message(
      'Email do not much!',
      name: 'Email_do_not_much',
      desc: '',
      args: [],
    );
  }

  /// `Enter current password`
  String get Enter_current_password {
    return Intl.message(
      'Enter current password',
      name: 'Enter_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a current password`
  String get Please_enter_a_current_password {
    return Intl.message(
      'Please enter a current password',
      name: 'Please_enter_a_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get Enter_new_password {
    return Intl.message(
      'Enter new password',
      name: 'Enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm new password`
  String get Enter_confirm_new_password {
    return Intl.message(
      'Enter confirm new password',
      name: 'Enter_confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get Passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'Passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password_must_be_at_least_8_characters_and_include`
  String get Password_must_be_at_least_8_characters_and_include {
    return Intl.message(
      'Password_must_be_at_least_8_characters_and_include',
      name: 'Password_must_be_at_least_8_characters_and_include',
      desc: '',
      args: [],
    );
  }

  /// `1 number (0-9)`
  String get number {
    return Intl.message(
      '1 number (0-9)',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `1 uppercase letter (A-Z)`
  String get uppercase_letter {
    return Intl.message(
      '1 uppercase letter (A-Z)',
      name: 'uppercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `1 lowercase letter (a-z)`
  String get lowercase_letter {
    return Intl.message(
      '1 lowercase letter (a-z)',
      name: 'lowercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `1 special character (~@#$%^&*__-+=,?/)`
  String get special_character {
    return Intl.message(
      '1 special character (~@#\$%^&*__-+=,?/)',
      name: 'special_character',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message(
      'Support',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Slide to start`
  String get Slide_to_start {
    return Intl.message(
      'Slide to start',
      name: 'Slide_to_start',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy the best`
  String get Enjoy_the_best {
    return Intl.message(
      'Enjoy the best',
      name: 'Enjoy_the_best',
      desc: '',
      args: [],
    );
  }

  /// `food`
  String get food {
    return Intl.message(
      'food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `us...`
  String get us {
    return Intl.message(
      'us...',
      name: 'us',
      desc: '',
      args: [],
    );
  }

  /// `with`
  String get With {
    return Intl.message(
      'with',
      name: 'With',
      desc: '',
      args: [],
    );
  }

  /// `Choose A Tasty Dish`
  String get Choose_A_Tasty_Dish {
    return Intl.message(
      'Choose A Tasty Dish',
      name: 'Choose_A_Tasty_Dish',
      desc: '',
      args: [],
    );
  }

  /// `Order anything you want and it will`
  String get Order_anything_you_want_and_it_will {
    return Intl.message(
      'Order anything you want and it will',
      name: 'Order_anything_you_want_and_it_will',
      desc: '',
      args: [],
    );
  }

  /// `be delivered to your doorstep`
  String get be_delivered_to_your_doorstep {
    return Intl.message(
      'be delivered to your doorstep',
      name: 'be_delivered_to_your_doorstep',
      desc: '',
      args: [],
    );
  }

  /// `Easy Payment`
  String get Easy_Payment {
    return Intl.message(
      'Easy Payment',
      name: 'Easy_Payment',
      desc: '',
      args: [],
    );
  }

  /// `Payment made easy through`
  String get Payment_made_easy_through {
    return Intl.message(
      'Payment made easy through',
      name: 'Payment_made_easy_through',
      desc: '',
      args: [],
    );
  }

  /// `debit card, credit & more ways`
  String get debit_card_credit_more_ways {
    return Intl.message(
      'debit card, credit & more ways',
      name: 'debit_card_credit_more_ways',
      desc: '',
      args: [],
    );
  }

  /// `to pay for your food`
  String get to_pay_for_your_food {
    return Intl.message(
      'to pay for your food',
      name: 'to_pay_for_your_food',
      desc: '',
      args: [],
    );
  }

  /// `Healthy eating means eating a`
  String get Healthy_eating_means_eating_a {
    return Intl.message(
      'Healthy eating means eating a',
      name: 'Healthy_eating_means_eating_a',
      desc: '',
      args: [],
    );
  }

  /// ` variety of foods that give you`
  String get variety_of_foods_that_give_you {
    return Intl.message(
      ' variety of foods that give you',
      name: 'variety_of_foods_that_give_you',
      desc: '',
      args: [],
    );
  }

  /// `the nutrients you need to`
  String get the_nutrients_you_need_to {
    return Intl.message(
      'the nutrients you need to',
      name: 'the_nutrients_you_need_to',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `How do I place an order?`
  String get Question_1 {
    return Intl.message(
      'How do I place an order?',
      name: 'Question_1',
      desc: '',
      args: [],
    );
  }

  /// `What are your opening hours?`
  String get Question_2 {
    return Intl.message(
      'What are your opening hours?',
      name: 'Question_2',
      desc: '',
      args: [],
    );
  }

  /// `Do you offer delivery?`
  String get Question_3 {
    return Intl.message(
      'Do you offer delivery?',
      name: 'Question_3',
      desc: '',
      args: [],
    );
  }

  /// `What payment methods do you accept?`
  String get Question_4 {
    return Intl.message(
      'What payment methods do you accept?',
      name: 'Question_4',
      desc: '',
      args: [],
    );
  }

  /// `Can i customize my order?`
  String get Question_5 {
    return Intl.message(
      'Can i customize my order?',
      name: 'Question_5',
      desc: '',
      args: [],
    );
  }

  /// `How long does it take to receive my order?`
  String get Question_6 {
    return Intl.message(
      'How long does it take to receive my order?',
      name: 'Question_6',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any dietary or allergy information?`
  String get Question_7 {
    return Intl.message(
      'Do you have any dietary or allergy information?',
      name: 'Question_7',
      desc: '',
      args: [],
    );
  }

  /// `Can I cancel or modify my order?`
  String get Question_8 {
    return Intl.message(
      'Can I cancel or modify my order?',
      name: 'Question_8',
      desc: '',
      args: [],
    );
  }

  /// `How do I contact customer support?`
  String get Question_9 {
    return Intl.message(
      'How do I contact customer support?',
      name: 'Question_9',
      desc: '',
      args: [],
    );
  }

  /// `Do you have a loyalty program?`
  String get Question_10 {
    return Intl.message(
      'Do you have a loyalty program?',
      name: 'Question_10',
      desc: '',
      args: [],
    );
  }

  /// `To place an order, simply browse our menu, select the items you want, and tap the (Add to Cart) button. When you \n re ready, proceed to checkout and complete your order.`
  String get Answer_1 {
    return Intl.message(
      'To place an order, simply browse our menu, select the items you want, and tap the (Add to Cart) button. When you \n re ready, proceed to checkout and complete your order.',
      name: 'Answer_1',
      desc: '',
      args: [],
    );
  }

  /// `We are open daily from 11am to 10pm.`
  String get Answer_2 {
    return Intl.message(
      'We are open daily from 11am to 10pm.',
      name: 'Answer_2',
      desc: '',
      args: [],
    );
  }

  /// `Yes, we offer delivery within a 5-mile radius. There is a delivery fee of ${3.99}`
  String get Answer_3 {
    return Intl.message(
      'Yes, we offer delivery within a 5-mile radius. There is a delivery fee of \${3.99}',
      name: 'Answer_3',
      desc: '',
      args: [],
    );
  }

  /// `We accept Visa, Mastercard, American Express, and Apple Pay`
  String get Answer_4 {
    return Intl.message(
      'We accept Visa, Mastercard, American Express, and Apple Pay',
      name: 'Answer_4',
      desc: '',
      args: [],
    );
  }

  /// `We aim to have your order ready for pickup or delivery within 30-45 minutes, depending on the size of your order and current order volume.`
  String get Answer_5 {
    return Intl.message(
      'We aim to have your order ready for pickup or delivery within 30-45 minutes, depending on the size of your order and current order volume.',
      name: 'Answer_5',
      desc: '',
      args: [],
    );
  }

  /// `Absolutely! You can customize your order by adding, removing, or substituting ingredients. Just let us know your preferences when placing your order.`
  String get Answer_6 {
    return Intl.message(
      'Absolutely! You can customize your order by adding, removing, or substituting ingredients. Just let us know your preferences when placing your order.',
      name: 'Answer_6',
      desc: '',
      args: [],
    );
  }

  /// `All of our menu items are labeled with dietary and allergy information. If you have any specific concerns, please let us know when placing your order.`
  String get Answer_7 {
    return Intl.message(
      'All of our menu items are labeled with dietary and allergy information. If you have any specific concerns, please let us know when placing your order.',
      name: 'Answer_7',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel or modify your order up to 15 minutes before it is scheduled to be prepared. Please contact us directly to make any changes.`
  String get Answer_8 {
    return Intl.message(
      'You can cancel or modify your order up to 15 minutes before it is scheduled to be prepared. Please contact us directly to make any changes.',
      name: 'Answer_8',
      desc: '',
      args: [],
    );
  }

  /// `For customer support, you can reach us at 555-1234 or by emailing support@ourrestaurant.com.`
  String get Answer_9 {
    return Intl.message(
      'For customer support, you can reach us at 555-1234 or by emailing support@ourrestaurant.com.',
      name: 'Answer_9',
      desc: '',
      args: [],
    );
  }

  /// `Yes, we have a loyalty program where you can earn points for every dollar spent. Accumulated points can be redeemed for discounts on future orders.`
  String get Asnwer_10 {
    return Intl.message(
      'Yes, we have a loyalty program where you can earn points for every dollar spent. Accumulated points can be redeemed for discounts on future orders.',
      name: 'Asnwer_10',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get Please_enter_your_password {
    return Intl.message(
      'Please enter your password',
      name: 'Please_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get Verification {
    return Intl.message(
      'Verification',
      name: 'Verification',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get Verification_code {
    return Intl.message(
      'Verification code',
      name: 'Verification_code',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a verification code to your`
  String get We_have_sent_a_verification_code_to_your {
    return Intl.message(
      'We have sent a verification code to your',
      name: 'We_have_sent_a_verification_code_to_your',
      desc: '',
      args: [],
    );
  }

  /// `mobile number`
  String get mobile_number {
    return Intl.message(
      'mobile number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Haven't received OTP yet?`
  String get Haven_not_received_OTP_yet {
    return Intl.message(
      'Haven\'t received OTP yet?',
      name: 'Haven_not_received_OTP_yet',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `You can resend OTP after`
  String get You_can_resend_OTP_after {
    return Intl.message(
      'You can resend OTP after',
      name: 'You_can_resend_OTP_after',
      desc: '',
      args: [],
    );
  }

  /// `second(s)`
  String get second {
    return Intl.message(
      'second(s)',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `Invalid otp!`
  String get Invalid_otp {
    return Intl.message(
      'Invalid otp!',
      name: 'Invalid_otp',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message(
      'Verify',
      name: 'Verify',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for Buying`
  String get Thanks_for_Buying {
    return Intl.message(
      'Thanks for Buying',
      name: 'Thanks_for_Buying',
      desc: '',
      args: [],
    );
  }

  /// `food with us`
  String get food_with_us {
    return Intl.message(
      'food with us',
      name: 'food_with_us',
      desc: '',
      args: [],
    );
  }

  /// `Your food will come in 15 min`
  String get Your_food_will_come_in_15_min {
    return Intl.message(
      'Your food will come in 15 min',
      name: 'Your_food_will_come_in_15_min',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get Continue_Shopping {
    return Intl.message(
      'Continue Shopping',
      name: 'Continue_Shopping',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
