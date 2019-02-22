/**
 * Created by TinySymphony on 2017-05-08.
 */

import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {NativeModules} from 'react-native';

let datePicker = NativeModules.CalenderModule;

class Calendar {

    dp_normal(date = '', callback) {
        console.log("dp_normal")
      datePicker.selectNormalDate(date, callback)
    }

    dp_past(date = '', callback) {
        console.log("dp_past")
        datePicker.selectPastDatePicker(date, callback)
    }

    dp_feature(date = '', callback) {
        console.log("dp_feature")
        datePicker.selectFeatureDatePicker(date, callback)
    }

}

module.exports = new Calendar();
