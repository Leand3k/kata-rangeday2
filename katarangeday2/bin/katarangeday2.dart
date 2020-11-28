import 'package:katarangeday2/katarangeday2.dart' as katarangeday2;
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  Range rango = new Range();
  List resultado = new List();
  String inter = '[5, 10)';
  String another = '[5, 10)';
  List f = (rango.AddRange(inter));

  if (inter[0] == '(') {
    f.first += 1;
  }
  if (inter[inter.length - 1] == ')') {
    f.last -= 1;
  }

  print(rango.AddRange(inter));
  print(rango.getAllPoints(f));
  print(rango.endPoints(inter));
  print(rango.ContainsRange(f, rango.AddRange(another)));
  print(rango.overlapsRange(f, rango.AddRange(another)));
}

class Range {
  List AddRange(String Interval) {
    var i;
    var p = new List();
    var x = Interval.split(',');

    for (int o = 0; o < x.length; o++) {
      i = x[o]
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('(', '')
          .replaceAll(')', '');
      p.add(int.parse(i));
    }

    return p;
  }

  List getAllPoints(List v) {
    var x = new List();

    for (int i = v.first; i <= v.last; i++) {
      x.add(i);
    }

    return x;
  }

  String ContainsRange(List base, List nuevo) {
    String respuesta;
    if (base.first <= nuevo.first && nuevo.last <= base.last) {
      respuesta = 'Si lo contiene.';
    } else {
      respuesta = 'No lo contiene.';
    }
    return respuesta;
  }

  String endPoints(String Interval) {
    var i;
    var p = new List();
    var x = Interval.split(',');

    for (int o = 0; o < x.length; o++) {
      i = x[o]
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('(', '')
          .replaceAll(')', '');
      p.add(i);
    }

    return p.toString().replaceAll('[', '').replaceAll(']', '');
  }

  String overlapsRange(List base, List nuevo) {
    String respuesta;
    if (base.first > nuevo.first && nuevo.last < base.last) {
      respuesta = 'Si lo solapa.';
    } else {
      respuesta = 'No lo solapa.';
    }
    return respuesta;
  }

  String Equals(List base, List nuevo) {
    String respuesta;
    if (base.first == nuevo.first && nuevo.last == base.last) {
      respuesta = 'Si son iguales.';
    } else {
      respuesta = 'No son iguales.';
    }

    return respuesta;
  }
}
