import 'package:http/http.dart' as http;
import 'package:coffee_shop/helpers/slException.dart';
import 'package:xml/xml.dart' as xml;

class WebServiceHelper {

Future<String> callLDAP(String username, String password) async {

  var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Ldap xmlns="http://tempuri.org/">
      <username>'''+username+'''</username>
      <password>'''+password+'''</password>
    </Ldap>
  </soap:Body>
</soap:Envelope>
    ''';

    var client = new http.Client();
    try {
      var response = await client.post(
        'http://webapp.sau.ac.th/sauservice/WebsauService.asmx',
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/Ldap",
          "Host": "www.sau.ac.th"
        },
        body: envelope).timeout(Duration(seconds: 10));

    if(response == null || response.statusCode != 200)
      throw new SLException(response.statusCode.toString());

    var rawXmlResponse = response.body;

    List<String> itemsList = List();

    // Use the xml package's 'parse' method to parse the response.
    xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
    //var parsedXml = xml.parse(rawXmlResponse);

    //print("" + response.body);

    Iterable<xml.XmlElement> items = parsedXml.findAllElements('LdapResponse');
    var result;
    items.map((xml.XmlElement item) {
      result = getValue(item.findElements('LdapResult'));
      itemsList.add(result.toString());
    }).toList();
    return result.toString(); //getValue(parsedXml.findElements("LdapResult")).toString() ;//response.body + "";

    }
    on Exception catch (e){
      print(e.toString());
      //return null;
      if(e.toString().contains('404'))
        throw new SLException('ไม่พบข้อมูล');
      else if(e.toString().contains('SocketException'))
        throw new SLException('การเชื่อมต่อไม่สำเร็จ');
      else if(e.toString().contains('TimeoutException'))
        throw new SLException('การเชื่อมต่อนานเกินไป');
      else
        throw new SLException('เกิดข้อผิดพลาด');

    } finally {
      client.close();
      //return null;
    }    
}

Future<String> callLDAPServ(String username, String password) async {

  var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Ldap xmlns="http://tempuri.org/">
      <username>'''+username+'''</username>
      <password>'''+password+'''</password>
    </Ldap>
  </soap:Body>
</soap:Envelope>
    ''';

    http.Response response = await http.post(
        'http://webapp.sau.ac.th/sauservice/WebsauService.asmx',
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/Ldap",
          "Host": "www.sau.ac.th"
        },
        body: envelope);

    var rawXmlResponse = response.body;

    List<String> itemsList = List();

    // Use the xml package's 'parse' method to parse the response.
    xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
    //var parsedXml = xml.parse(rawXmlResponse);

    //print("" + response.body);

    Iterable<xml.XmlElement> items = parsedXml.findAllElements('LdapResponse');
    var result;
    items.map((xml.XmlElement item) {
      result = getValue(item.findElements('LdapResult'));
      itemsList.add(result.toString());
    }).toList();
    return result.toString(); //getValue(parsedXml.findElements("LdapResult")).toString() ;//response.body + "";
}

Future<String> callLDAPTest(String username, String password) async {

  var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Login xmlns="http://tempuri.org/Login">
      <usename>'''+username+'''</usename>
      <password>'''+password+'''</password>
    </Login>
  </soap:Body>
</soap:Envelope>
    ''';

    var client = new http.Client();
    try {
      var response = await client.post(
        'http://webapp.sau.ac.th/webservice/Webservice1.asmx',
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/Login",
          "Host": "www.sau.ac.th"
        },
        body: envelope).timeout(Duration(seconds: 10));

      var rawXmlResponse = response.body;

      List<String> itemsList = List();

      // Use the xml package's 'parse' method to parse the response.
      xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
      //var parsedXml = xml.parse(rawXmlResponse);

      //print("" + response.body);

      Iterable<xml.XmlElement> items = parsedXml.findAllElements('LoginResponse');
      var result;
      items.map((xml.XmlElement item) {
        result = getValue(item.findElements('LoginResult'));
        itemsList.add(result.toString());
      }).toList();
      return result.toString(); //getValue(parsedXml.findElements("LdapResult")).toString() ;//response.body + "";
    } catch(e){
      print('ERROR =====>'+ e.toString());
      return null;
    } finally {
      client.close();
      //return null;
    }

    /*
    http.Response response = await http.post(
        'http://webapp.sau.ac.th/webservice/Webservice1.asmx',
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/DetailCustomer",
          "Host": "www.sau.ac.th"
        },
        body: envelope);
    */
}

getValue(Iterable<xml.XmlElement>  items) {
  var textValue;
  items.map((xml.XmlElement node) {
    textValue = node.text;
  }).toList();
  return textValue;
}

}