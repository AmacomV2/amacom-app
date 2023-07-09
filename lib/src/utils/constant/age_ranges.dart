import 'package:flutter/material.dart';

/// Age ranges DropdownMenuItem with a identifier
List<DropdownMenuItem> ageRanges = [
  const DropdownMenuItem<String>(
    value: '1',
    child: Text('Menor de 16'),
  ),
  const DropdownMenuItem<String>(
    value: '2',
    child: Text('16 - 25'),
  ),
  const DropdownMenuItem<String>(
    value: '3',
    child: Text('26 - 35'),
  ),
  const DropdownMenuItem<String>(
    value: '4',
    child: Text('36 - 46'),
  ),
  const DropdownMenuItem<String>(
    value: '5',
    child: Text('Mayor de 46'),
  ),
];
