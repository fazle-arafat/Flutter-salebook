 class User {



 String uid,name, phone,email,created_at,updated_at,org_id,salesrep_id,imei,ZM_ID,ZM_PHONE,ZM_EMAIL,DM_ID,DM_PHONE,DM_EMAIL;

    User({ this.uid,this.name, this.phone,this.email,this.created_at,this.updated_at,this.org_id,
   this.salesrep_id,this.imei,this.ZM_ID,this.ZM_PHONE,this.ZM_EMAIL,this.DM_ID,this.DM_PHONE,this.DM_EMAIL});

 /*   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid : json ['uid'],
    name: json['name'],
   phone: json['phone'],
   email: json['email'],
   created_at: json['created_at'],
   updated_at: json['updated_at'],
   org_id: json['org_id'],
   salesrep_id: json['salesrep_id'],
   imei: json['imei'],
   ZM_ID: json['ZM_ID'],
   ZM_PHONE: json['ZM_PHONE'],
   ZM_EMAIL: json['ZM_EMAIL'],
   DM_ID: json['DM_ID'],
   DM_PHONE: json['DM_PHONE'],
   DM_EMAIL: json['DM_EMAIL'],


    );
    }*/


User.fromJson(Map<String, dynamic> json)
    : uid = json['uid'],
      name = json['name'],
      phone= json['phone'],
      email= json['email'],
      created_at= json['created_at'],
      updated_at= json['updated_at'],
      org_id= json['org_id'],
      salesrep_id= json['salesrep_id'],
      imei= json['imei'],
      ZM_ID= json['ZM_ID'],
      ZM_PHONE= json['ZM_PHONE'],
      ZM_EMAIL= json['ZM_EMAIL'],
      DM_ID= json['DM_ID'],
      DM_PHONE= json['DM_PHONE'],
      DM_EMAIL= json['DM_EMAIL'];


  /*  Map toMap() {
      var map = new Map<String, dynamic>();
      map["uid"] = uid;
          map["name"] = name;
          map["phone"] = phone;
          map["email"] = email;

          map["created_at"] = created_at;
          map["updated_at"] = updated_at;
          map["org_id"] = org_id;
          map["salesrep_id"] = salesrep_id;
          map["imei"] = imei;
          map["ZM_ID"] = ZM_ID;
          map["ZM_PHONE"] = ZM_PHONE;
          map["ZM_EMAIL"] = ZM_EMAIL;
          map["DM_ID"] = DM_ID;
          map["DM_PHONE"] = DM_PHONE;
          map["DM_EMAIL"] = DM_EMAIL;


      return map;
    }*/

        Map<String, dynamic> toJson() =>
            {
              'uid': uid,
              'name': name,
            };
}