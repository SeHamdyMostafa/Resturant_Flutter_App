import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

void showSnackBar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          width: DeviceDimenssions.deviceWidth*.8,
                          elevation: 5.0,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                          content: Wrap(
                            children: [
                              Container(
                                //height: 20,
                                child: Center(
                                  child: Text(
                                    message,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          duration: const Duration(milliseconds: 1000),
                        )
                      );
}