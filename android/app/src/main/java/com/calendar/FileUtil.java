/*
 * Copyright (C) 2017 Baidu, Inc. All Rights Reserved.
 */
package com.calendar;

import java.io.File;
import java.util.Calendar;

import android.content.Context;
import android.util.Log;

public class FileUtil {

    public static long getCurrentDate() {
        Calendar calendar = Calendar.getInstance();
        return calendar.getTimeInMillis()-1000;
    }

    public static long getPassDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -3);
        return calendar.getTimeInMillis();
    }

    public static long getFeatureDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 6);
        return calendar.getTimeInMillis();
    }
}
