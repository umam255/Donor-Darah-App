// ignore_for_file: must_be_immutable, unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@override
List<Object> get props => [];

class ResultSucces<D> implements ResultEntity<D> {
  final D data;

  ResultSucces(this.data);

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class ResultError<D> implements ResultEntity<D> {
  final String? message;

  ResultError({this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

abstract class ResultEntity<D> extends Equatable {}
