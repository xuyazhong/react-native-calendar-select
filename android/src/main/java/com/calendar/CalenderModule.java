package com.calendar;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.util.Log;
import android.os.Build;
import android.widget.DatePicker;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.Random;
import java.util.TimeZone;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;

/**
 * Created by xuyazhong on 2018/5/16.
 */

public class CalenderModule extends ReactContextBaseJavaModule {

    public interface successBlock {
        public void onResult(String result);
    }

    public interface failureBlock {
        public void onResult(String result);
    }

    private final ReactApplicationContext reactContext;

    private long min = 0;

    private long max = 0;


    private Callback mPickerCallback; // 保存回调

    public CalenderModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "CalenderModule";
    }

    @ReactMethod
    public void selectPastDatePicker(String currentDate, Callback callback) {
        this.min = FileUtil.getPassDate();
        this.max = FileUtil.getCurrentDate();
        showDatePicker(currentDate, true, callback);
    }

    @ReactMethod
    public void selectFeatureDatePicker(String currentDate, Callback callback) {
        this.min = FileUtil.getCurrentDate();
        this.max = FileUtil.getFeatureDate();
        showDatePicker(currentDate, true, callback);
    }

    @ReactMethod
    public void selectNormalDate(String currentDate, Callback callback) {
        showDatePicker(currentDate, false, callback);
    }

    private void showDatePicker(String currentDate, Boolean hasLimit, final Callback callback) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+8"), Locale.SIMPLIFIED_CHINESE);
        Date date;
        try {
            date = sdf.parse(currentDate);
        } catch (Exception e) {
            date = new Date();
        }
        calendar.setTime(date);

        int Resid = 0;

        Activity currentActivity = getCurrentActivity();

        DatePickerDialog dpd = new DatePickerDialog(currentActivity, Resid, new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                // 此处得到选择的时间，可以进行你想要的操作
                Log.e("您选择了：", + year + "年" + (monthOfYear + 1) + "月" + dayOfMonth + "日");
                String selectDate = year + "-" + (monthOfYear + 1) + "-" + dayOfMonth;
                callback.invoke(selectDate);
            }
        }, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));
        if (hasLimit) {
            DatePicker dp = dpd.getDatePicker();
            dp.setMaxDate(max);
            dp.setMinDate(min);
        }
        dpd.show();
    }
}
