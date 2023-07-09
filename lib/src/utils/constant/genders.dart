import 'package:flutter/material.dart';

/// Genders DropdownMenuItem with a identifier
List<DropdownMenuItem> genders = [
  const DropdownMenuItem<String>(
    value: 'M',
    child: Text('Masculino'),
  ),
  const DropdownMenuItem<String>(
    value: 'F',
    child: Text('Femenino'),
  ),
  const DropdownMenuItem<String>(
    value: 'NB',
    child: Text('No Binario'),
  ),
  const DropdownMenuItem<String>(
    value: 'O',
    child: Text('Otro'),
  ),
];
