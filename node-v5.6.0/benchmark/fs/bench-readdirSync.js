'use strict';

const common = require('../common');
const fs = require('fs');

const bench = common.createBenchmark(main, {
  n: [1e4],
});


function main(conf) {
  const n = conf.n >>> 0;

  bench.start();
  for (var i = 0; i < n; i++) {
    fs.readdirSync(__dirname + '/../../lib/');
  }
  bench.end(n);
}
