/*
Bai tap: GPT ax^2 + bx+c =0;
*/
import 'dart:io';
import 'dart:math';
void main(){
  double a = 0, b = 0, c = 0;
  do{
    stdout.write('nhap he so a(a khac 0):');
    String? input = stdin.readLineSync();
    if(input!=null){
      a=double.tryParse(input)?? 0;
    }
    if(a==0){
      print('Vui long nhap lai:');
    }
  }while(a==0);
  // input b
  stdout.write('Nhập hệ số b: ');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }
  // input c
  stdout.write('Nhập hệ số c: ');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }
  // hein thi phuong trinh 
   print('\nPhương trình: ${a}x² + ${b}x + $c = 0');
   
  // tinh delta
   double delta = b * b - 4 * a * c;
  // giai phuong trinh
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    x = double.parse(x.toStringAsFixed(2));
    print('Phương trình có nghiệm kép x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    x1 = double.parse(x1.toStringAsFixed(2));
    x2 = double.parse(x2.toStringAsFixed(2));
    print('Phương trình có 2 nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}