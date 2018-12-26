/**
 * Created by TinySymphony on 2017-05-08.
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight
} from 'react-native';
import Calendar from './Calendar';

export default class calendar extends Component {
  constructor(props) {
    super(props);
    this.calendar = null;
    this.state = {
      selectedDay: new Date(2018, 12, 26)
    };
    this.openCalendar = this.openCalendar.bind(this);
    this.confirmDate = this.confirmDate.bind(this);
  }
  // when confirm button is clicked, an object is conveyed to outer component
  // contains following property:
  // startDate [Date Object], endDate [Date Object]
  // startMoment [Moment Object], endMoment [Moment Object]
  confirmDate ({startDate, endDate, startMoment, endMoment}) {
    console.log(startDate, endDate, startMoment, endMoment);
    this.setState({
      selectedDay: startDate
    });
  }
  openCalendar() {
    !!this.calendar && this.calendar.open();
  }

  //当前时间 yyyymmdd
  getFormatDate() {
    var date = new Date('2018-01-22');
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
      month = '0' + month;
    }
    if (strDate >= 0 && strDate <= 9) {
      strDate = '0' + strDate;
    }
    var currentdate = "" + year + month + strDate;
    return currentdate;
  }

  //过去三个月
  getPastMonth() {
    var date = new Date('2018-01-22');
    date.setMonth(date.getMonth() - 3);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
      month = '0' + month;
    }
    if (strDate >= 0 && strDate <= 9) {
      strDate = '0' + strDate;
    }
    var currentdate = "" + year + month + strDate;
    return currentdate;
  }

  render() {
    // It's an optional property, I use this to show the structure of customI18n object.
    let customI18n = {
      'w': ['', 'Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'],
      'weekday': ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
      'text': {
        'start': 'Check in',
        'end': 'Check out',
        'date': 'Date',
        'save': 'Confirm',
        'clear': 'Reset'
      },
      'date': 'DD / MM'  // date format
    };
    // optional property, too.
    let color = {
      mainColor: '#138691'
    };
    return (
      <View style={styles.container}>
        <TouchableHighlight
          style={styles.btn}
          title="press"
          onPress={this.openCalendar}
          >
          <Text style={styles.btnFont}>Choose Dates</Text>
        </TouchableHighlight>
        <View>
          <Text style={styles.font}>{this.state.selectedDay.toLocaleDateString()}</Text>
        </View>
        <Calendar
          i18n="zh"
          color={color}
          ref={(calendar) => {this.calendar = calendar;}}
          format="YYYYMMDD"
          minDate={this.getPastMonth()}
          maxDate={this.getFormatDate()}
          selectDate={this.getFormatDate()}
          onConfirm={this.confirmDate}
          />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  btn: {
    paddingHorizontal: 20,
    paddingVertical: 10,
    overflow: 'hidden',
    borderRadius: 6,
    marginBottom: 30,
    backgroundColor: '#138691'
  },
  btnFont: {
    color: '#fff',
    fontSize: 20
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  font: {
    fontSize: 24,
    fontWeight: '400',
    color: '#304853'
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('calendar', () => calendar);
