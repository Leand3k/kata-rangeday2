import 'package:katarangeday2/katarangeday2.dart';
import 'package:test/test.dart';

void main() {
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

  test('Testing AddRange', () {
    resultado.add(5);
    resultado.add(10);

    String expected = '[5,10)';
    var actual = rango.AddRange(expected);

    expect(actual, resultado);
  });

  test('Testing getAllPoints', () {
    var expected = [5, 6, 7, 8, 9];
    var actual = rango.getAllPoints(f);

    expect(actual, expected);
  });

  test('Testing ContainsRange', () {
    var expected = "No lo contiene.";
    var actual = rango.ContainsRange(f, rango.AddRange(another));

    expect(actual, expected);
  });

  test('Testing endPoints', () {
    var expected = '5,  10';
    var actual = rango.endPoints(inter);

    expect(actual, expected);
  });

  test('Testing overlapsRange', () {
    var expected = 'No lo solapa.';

    var actual = rango.overlapsRange(f, rango.AddRange(another));

    expect(actual, expected);
  });

  test('Testing Equals', () {
    var expected = 'No son iguales.';
    var actual = rango.Equals(f, rango.AddRange(another));

    expect(actual, expected);
  });
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
