int abs(n) {
  return n >= 0 ? n : -n;
}

int pow(int x, int exponent) {
  int res = 1;
  for (int i = 0; i < exponent; i++) {
    res = x * res;
  }
  return res;
}

double roundNum(double n, int decimal) {
  return (n * pow(10, decimal).toDouble()).round() /
      pow(10, decimal).toDouble();
}

String numerizeNumber(n) {
  var sufixes = [
    "",
    "K",
    "M",
    "B",
    "T",
    "Qa",
    "Qu",
    "S",
    "Oc",
    "No",
    "D",
    "Ud",
    "Dd",
    "Td",
    "Qt",
    "Qi",
    "Se",
    "Od",
    "Nd",
    "V",
    "Uv",
    "Dv",
    "Tv",
    "Qv",
    "Qx",
    "Sx",
    "Ox",
    "Nx",
    "Tn",
    "Qa",
    "Qu",
    "S",
    "Oc",
    "No",
    "D",
    "Ud",
    "Dd",
    "Td",
    "Qt",
    "Qi",
    "Se",
    "Od",
    "Nd",
    "V",
    "Uv",
    "Dv",
    "Tv",
    "Qv",
    "Qx",
    "Sx",
    "Ox",
    "Nx",
    "Tn",
    "x",
    "xx",
    "xxx",
    "X",
    "XX",
    "XXX",
    "END"
  ];

  var sci_expr = [
    1e0,
    1e3,
    1e6,
    1e9,
    1e12,
    1e15,
    1e18,
    1e21,
    1e24,
    1e27,
    1e30,
    1e33,
    1e36,
    1e39,
    1e42,
    1e45,
    1e48,
    1e51,
    1e54,
    1e57,
    1e60,
    1e63,
    1e66,
    1e69,
    1e72,
    1e75,
    1e78,
    1e81,
    1e84,
    1e87,
    1e90,
    1e93,
    1e96,
    1e99,
    1e102,
    1e105,
    1e108,
    1e111,
    1e114,
    1e117,
    1e120,
    1e123,
    1e126,
    1e129,
    1e132,
    1e135,
    1e138,
    1e141,
    1e144,
    1e147,
    1e150,
    1e153,
    1e156,
    1e159,
    1e162,
    1e165,
    1e168,
    1e171,
    1e174,
    1e177
  ];

  if (n == 0) {
    return "0";
  }

  var minusBuff = n < 0;
  var number = abs(n);

  for (var i = 0; i < sufixes.length; i++) {
    if (number >= sci_expr[i] && number < sci_expr[i + 1]) {
      var sufix = sufixes[i];
      String num;
      if (number >= 1e3) {
        num = roundNum(number.roundToDouble()/sci_expr[i], 2).toString();
      } else {
        num = number.toString();
      }
      return minusBuff ? "-$num $sufix" : "$num $sufix";
    }
  }

  return "infinit";
}
