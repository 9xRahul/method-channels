package com.example.method_channel

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.os.Bundle
import android.os.BatteryManager

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example/my_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            if(call.method=="getBatteryLevel"){

                val batteryLevel=getBatteryLevel();

                if(batteryLevel!=1){
                    result.success(batteryLevel);
                }
                else{
                    result.error("Unavailable", "Battery level is not available", null);
                }

            }
            else{
                result.notImplemented();
            }

           
        }
    }

    private fun getBatteryLevel():Int{
        val batteryManager=getSystemService(Context.BATTERY_SERVICE) as BatteryManager 

        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}
