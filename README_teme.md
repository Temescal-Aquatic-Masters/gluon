TODO:

* get table structure to Tom
* Update swimmers from Wild Apricot
* Get donations information from Wild Apricot
* Update swimmers that are not registered with TEME
* parametrize field names, store dates as dates


Using the ruby watir gem (which uses selenium to automate the browser) to grab the team's roster from the USMS site, or lookup individuals.

The data structures are mostly straight imports from the csv files from Wild Apricot and USMS.

Using the ruby pluot gem to work with the Wild Apricot API. Had to implement a put to write data to Wild Apricot.