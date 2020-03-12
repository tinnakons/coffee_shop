import 'package:http/http.dart' as http;
import 'package:coffee_shop/controllers/loginController.dart';
import 'package:coffee_shop/controllers/apiController.dart';
import 'package:coffee_shop/models/member.dart';

//import 'iJSONController.dart';

class BaseController extends APIController  {
  
  Future<Member> getLoginObject() async {

    return new LoginController().getLoginObject();
  }
  
  Future<int> getResponseCode(url) async{
    final response = await http.get(url);
    return response.statusCode;
  }

  String getFullThaiDate(DateTime datetime){  
    String day, month, year;

    day = datetime.day.toString();
    month = getFullThaiMonth(datetime.month);
    year = (datetime.year + 543).toString();

    return day + ' ' + month + ' ' + year;

  }

  String getShortThaiDate(DateTime datetime){  
    String day, month, year;

    day = datetime.day.toString();
    month = getShortThaiMonth(datetime.month);
    year = (datetime.year + 543).toString();

    return day + ' ' + month + ' ' + year;

  }

  String getFullThaiMonth(int month){

    switch (month) {
      case 1: 
        return 'มกราคม';
      case 2: 
        return 'กุมภาพันธ์';
      case 3: 
        return 'มีนาคม';
      case 4: 
        return 'เมษายน';
      case 5: 
        return 'พฤษภาคม';
      case 6: 
        return 'มิถุนายน';
      case 7: 
        return 'กรกฎาคม';
      case 8: 
        return 'สิงหาคม';
      case 9: 
        return 'กันยายน';
      case 10: 
        return 'ตุลาคม';
      case 11: 
        return 'พฤศจิกายน';
      case 12: 
        return 'ธันวาคม';
      default:
        return '';
    }
  }

  String getShortThaiMonth(int month){

    switch (month) {
      case 1: 
        return 'ม.ค.';
      case 2: 
        return 'ก.พ.';
      case 3: 
        return 'มี.ค.';
      case 4: 
        return 'เม.ย.';
      case 5: 
        return 'พ.ค.';
      case 6: 
        return 'มิ.ย.';
      case 7: 
        return 'ก.ค.';
      case 8: 
        return 'ส.ค.';
      case 9: 
        return 'ก.ย.';
      case 10: 
        return 'ต.ค.';
      case 11: 
        return 'พ.ย.';
      case 12: 
        return 'ธ.ค.';
      default:
        return '';
    }
  }

  String getFullThaiWeekDay(int day, bool refSAU){
    if(refSAU == false){
      if(day == 7)
        day = 0;
      day += 1;
    }
    switch (day) {
      case 1: 
        return 'อาทิตย์';
      case 2: 
        return 'จันทร์';
      case 3: 
        return 'อังคาร';
      case 4: 
        return 'พุธ';
      case 5: 
        return 'พฤหัสบดี';
      case 6: 
        return 'ศุกร์';
      case 7: 
        return 'เสาร์';
      default:
        return 'อาทิตย์';
    }
  }

  String getShortThaiWeekDay(int day, bool refSAU){
    if(refSAU == false){
      if(day == 7)
        day = 0;
      day += 1;
    }

    if(day != 99){
      switch (day) {
        case 1: 
          return 'อา.';
        case 2: 
          return 'จ.';
        case 3: 
          return 'อ.';
        case 4: 
          return 'พ.';
        case 5: 
          return 'พฤ.';
        case 6: 
          return 'ศ.';
        case 7: 
          return 'ส.';
        default:
          return 'อา.';
      }
    }
    else{
      return '';
    }
  }

  String getThaiYearTerm(String yearTerm){
    String year = yearTerm;
    String term = yearTerm;
    String termInThai = 'ภาค';

    if(yearTerm != ''){
      term = term.substring(2,3);
      year = year.substring(0,2);
      switch (term) {
        case '0':
          return 'เทียบโอน';
        case '1':
          termInThai += 'การศึกษาที่ 1';
          break;
        case '2':
          termInThai += 'การศึกษาที่ 2';
          break;
        case '3':
          termInThai += 'ฤดูร้อน';
          break;
        default:
          termInThai += term;
          break;
      }
      return termInThai + '/' + '25' + year;

    }
    else{
      return 'ภาคการศึกษาปัจจุบัน';
    }
  }

  String getShortYearTerm(String yearTerm){
    String year = yearTerm;
    String term = yearTerm;
    year = year.substring(0,2);
    term = term.substring(2,3);
    if(term == '0') return 'เทียบโอน';
    if(term == '3') term = 'ฤดูร้อน';
    return term + '/' + '25' + year;
  }

  String getThaiEDUProgramYearTerm(String yearTerm){
    String year = yearTerm;
    String term = yearTerm;
    String yearInThai = 'ปีที่';
    String termInThai = 'ภาคการศึกษาที่';

    year = year.substring(0,1);
    term = term.substring(1,2);

    return yearInThai + ' ' + year + ' ' + termInThai + ' ' + term;
  }

  int getABSNumber(int number){
    if(number < 0) number *= -1;
    return number;
  }

  int getTimeDiff(DateTime start, DateTime end){
    int diff = 0;
    diff = end.difference(start).inMinutes;
    if(end.isBefore(start)) 
      diff = start.difference(end).inMinutes;
    return diff;
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    //return double.parse(s, (e) => null) != null;
    return double.tryParse(s) != null;
  }

}