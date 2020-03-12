class Member {
  String LOGIN;
  String MB_ID;
  String MB_USERNAME;
  String MB_FNAME;
  String MB_LNAME;
  String MB_EMAIL;
  String MB_PHONE;
  String MB_BIRTH;



  //GET/SET

  void set mbLogin(String mb_login) {
    this.LOGIN = mb_login;
  }

  String get mbLogin {
    return this.LOGIN;
  }

  void set mbID(String mb_id) {
    this.MB_ID = mb_id;
  }

  String get mbID {
    return this.MB_ID;
  }

  void set mbUSERNAME(String mb_username) {
    this.MB_USERNAME = mb_username;
  }

  String get mbUSERNAME {
    return this.MB_USERNAME;
  }


  void set mbFNAME(String mb_fname) {
    this.MB_FNAME = mb_fname;
  }

  String get mbFNAME {
    return this.MB_FNAME;
  }

  void set mbLNAME(String mb_lname) {
    this.MB_LNAME = mb_lname;
  }

  String get mbLNAME {
    return this.MB_FNAME;
  }

  void set mbEMAIL(String mb_email) {
    this.MB_EMAIL = mb_email;
  }

  String get mbEMAIL {
    return this.MB_EMAIL;
  }

  void set mbPHONE(String mb_phone) {
    this.MB_PHONE = mb_phone;
  }

  String get mbPHONE {
    return this.MB_PHONE;
  }

   void set mbBIRTH(String mb_birth) {
    this.MB_BIRTH = mb_birth;
  }

  String get mbBIRTH {
    return this.MB_BIRTH;
  }


}
