part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAddedItem extends CartState {}

final class CartRemovedItem extends CartState {}
