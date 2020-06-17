class TimeController {
  _timeTable = {
    1: 100,
    2: 150,
    3: 150,
    4: 150,
    5: 200,
    6: 300,
    7: 400,
    8: 500,
    9: 500,
    10: 600,
    11: 600,
    12: 1000,
    13: 1000,
    14: 900,
    15: 800,
    16: 700,
    17: 700,
    18: 600,
    19: 500,
    20: 700,
    21: 800,
    22: 900,
    23: 700,
    24: 400,
  };

  getTimeTable(index) {
    return this._timeTable[index];
  }
}

export default new TimeController();