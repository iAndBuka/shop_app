// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "log_out": "Log out",
  "sign_in_with_email": "Sign in with E-mail",
  "sign_in_google": "Sign in with Google",
  "sign_in_face": "Sign in with Facebook",
  "sign_in_apple": "Sign in with Apple",
  "input_email": "Please input your email",
  "input_password": "Please input your password",
  "login": "Login",
  "register": "Register",
  "home": "Home",
  "need_to_buy": "You need to buy",
  "nothing": "Nothing ",
  "list": "List",
  "recipes": "Recipe",
  "see_recipe": "See recipe",
  "share_recipe": "Share recipe",
  "profile": "Profile",
  "hi": "Hi",
  "or": "Or"
};
static const Map<String,dynamic> ru = {
  "log_out": "Выйти",
  "sign_in_with_email": "Войти с Э-почтой",
  "sign_in_google": "Войти с Google",
  "sign_in_face": "Войти с Facebook",
  "sign_in_apple": "Войти с Apple",
  "input_email": "Пожалуйста введие свою Э-почту",
  "input_password": "Пожалуйста введите свой пароль",
  "login": "Войти",
  "register": "Зарегистрироваться",
  "home": "Главная",
  "need_to_buy": "Вам нужно купить",
  "nothing": "Ничего",
  "list": "Лист",
  "recipes": "Рецепты",
  "see_recipe": "Посмотреть рецепт",
  "share_recipe": "Поделиться",
  "profile": "Профиль",
  "hi": "Привет",
  "or": "Или"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
