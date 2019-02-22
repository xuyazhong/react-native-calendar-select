/**
 * Created by TinySymphony on 2017-05-08.
 */

import React, { Component } from 'react';
import PropTypes from 'prop-types';

import {NativeModules} from 'react-native';

let datePicker = NativeModules.CalenderModule;

export default class Calendar extends Component {

    dp_normal(date = '', callback) {
      datePicker.selectNormalDate(date, callback)
    }

    dp_past(date = '', callback) {
        datePicker.selectPastDatePicker(date, callback)
    }

    dp_feature(date = '', callback) {
        datePicker.selectFeatureDatePicker(date, callback)
    }

}
