import 'package:flutter/material.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Page_Model.dart';

class Setting_Card_Design extends StatelessWidget {
   Setting_Card_Design({super.key,required this.setting_page_model});
  Setting_Page_Model setting_page_model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return setting_page_model.Page!;
          }));
        },
        child: ListTile(
          title: Row(
            children: [
              Icon(setting_page_model.leadingIcon,size: 18,),
              SizedBox(width: 10,),
              Text(setting_page_model.text,style: TextStyle(fontSize: 16),),
            ],
          ),
          trailing: Icon(setting_page_model.icon,size: 18,),
        ),
        
      );
  }
}